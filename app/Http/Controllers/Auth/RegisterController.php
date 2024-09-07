<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Web\traits\UserFormFieldsTrait;
use App\Mixins\RegistrationBonus\RegistrationBonusAccounting;
use App\Models\Affiliate;
use App\Models\Reward;
use App\Models\RewardAccounting;
use App\Models\Role;
use App\Models\UserMeta;
use App\User;
use Illuminate\Auth\Events\Registered;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\MessageBag;
use Illuminate\Validation\ValidationException;
use App\Services\AadhaarVerification;
use App\Http\Controllers\Auth\Session;
use App\Models\AadhaarUser;

class RegisterController extends Controller
{

    use UserFormFieldsTrait;

    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */
    protected $aadhaarVerification;

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/panel';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    // public function __construct()
    // {
    //     $this->middleware('guest');
    // }

    public function __construct(AadhaarVerification $AadhaarVerification)
    {
        $this->AadhaarVerification = $AadhaarVerification;
        $this->middleware('guest');
    }

    public function showRegistrationForm(Request $request)
    {
        $seoSettings = getSeoMetas('register');
        $pageTitle = !empty($seoSettings['title']) ? $seoSettings['title'] : trans('site.register_page_title');
        $pageDescription = !empty($seoSettings['description']) ? $seoSettings['description'] : trans('site.register_page_title');
        $pageRobot = getPageRobot('register');

        $referralSettings = getReferralSettings();

        $referralCode = Cookie::get('referral_code');

        $formFields = $this->getFormFieldsByUserType($request, 'user', true);

        $data = [
            'pageTitle' => $pageTitle,
            'pageDescription' => $pageDescription,
            'pageRobot' => $pageRobot,
            'referralCode' => $referralCode,
            'referralSettings' => $referralSettings,
            'formFields' => $formFields
        ];

        return view(getTemplate() . '.auth.signup', $data);
    }

    // public function sendOtp(Request $request, AadhaarVerification $aadhaarService)
    // {
    //     $validator = Validator::make($request->all(), [
    //         'aadhar_number' => 'required|regex:/^\d{12}$/',
    //     ]);
    
    //     if ($validator->fails()) {
    //         return response()->json(['success' => false, 'message' => 'Invalid Aadhaar Number format.']);
    //     }
    //     // if ($validator->fails()) {
    //     //     return redirect()->back()
    //     //         ->withErrors($validator)
    //     //         ->withInput();
    //     // }
    
    //     $aadharNumber = $request->input('aadhar_number');
    //     $response = $aadhaarService->sendOtp($aadharNumber);
    
    //     // Ensure the response structure is handled correctly
    //     if ($response['success']) {
    //         $request->session()->put('reference_id', $response['data']['reference_id']);
    //         return response()->json([
    //             'success' => true,
    //             'message' => 'OTP sent successfully',
    //             'reference_id' => $response['data']['reference_id'] // Adjusted to access nested 'reference_id'
    //         ]);
    //     } else {
    //         return response()->json(['success' => false, 'message' => $response['error'] ?? 'OTP send failed']);
    //     }
    // }
    
    // public function verifyOtp(Request $request, AadhaarVerification $aadhaarService)
    // {
    //     $validator = Validator::make($request->all(), [
    //         'otp' => 'required|digits:6',
    //     ]);

    //     if ($validator->fails()) {
    //         return response()->json(['success' => false, 'message' => 'Invalid OTP format.']);
    //     }

    //     $otp = $request->input('otp');
    //     $referenceId = $request->session()->get('reference_id'); // Retrieve stored reference_id

    //     if (!$referenceId) {
    //         return response()->json(['success' => false, 'message' => 'Reference ID not found in session.']);
    //     }

    //     $response = $aadhaarService->verifyOtp($referenceId, $otp);

    //     if (isset($response['error'])) {
    //         return response()->json(['success' => false, 'message' => 'OTP verification failed: ' . $response['error']]);
    //     }

    //     if (isset($response['data']['message']) && $response['data']['message'] === "Aadhaar Card Exists") {
    //         return response()->json(['success' => true, 'message' => 'OTP verified successfully']);
    //     }
    //     return response()->json(['success' => true, 'message' => 'OTP verified successfully']);
    // }


    public function sendOtp(Request $request)
    {
        try {
            $aadharNumber = $request->input('aadhar_number');
            if (!$aadharNumber) {
                return response()->json([
                    'success' => false,
                    'message' => 'Aadhaar number is required'
                ], 400);
            }

            $result = $this->AadhaarVerification->sendOtp($aadharNumber);

            \Log::info('Aadhaar OTP Response: ', $result);

            if (!$result['success']) {
                return response()->json([
                    'success' => false,
                    'message' => 'OTP generation failed',
                    'error' => $result['error'] ?? 'An error occurred'
                ], 500);
            }

            if (!isset($result['data']['reference_id'])) {
                \Log::error('Invalid OTP response structure', ['result' => $result]);
                return response()->json([
                    'success' => false,
                    'message' => 'Reference ID not found in OTP response'
                ], 500);
            }

            \DB::table('aadhaar_users')->updateOrInsert(
                ['aadhar_number' => $aadharNumber],
                [
                    'reference_id' => $result['data']['reference_id'],
                    'response_data' => json_encode($result)
                ]
            );

            session()->put('aadhaar_otp_response', $result);
            session()->put('reference_id', $result['data']['reference_id']); 
            return response()->json([
                'success' => true,
                'message' => 'OTP sent successfully. Please proceed with OTP verification.'
            ], 200);

        } catch (ValidationException $e) {
            return response()->json([
                'success' => false,
                'errors' => $e->errors()
            ], 422);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'An error occurred',
                'error' => $e->getMessage()
            ], 500);
        }
    }  

    public function verifyOtp(Request $request)
    {
        try {
            $otp = $request->input('otp');
            if (!$otp) {
                return response()->json([
                    'success' => false,
                    'message' => 'OTP is required'
                ], 400);
            }

            $reference_id = session()->get('reference_id');
            \Log::info('Reference ID: ', ['reference_id' => $reference_id]);

            if (!$reference_id) {
                return response()->json([
                    'success' => false,
                    'message' => 'Reference ID not found in session. Please send OTP again.'
                ], 400); 
            }

            $result = $this->AadhaarVerification->verifyOtp($reference_id, $otp);
            \Log::info('Aadhaar OTP Verification Response: ', ['result' => $result]);

            if ($result['success']) {
                session()->put('aadhaar_verification_data', $result['data']);  
                session()->put('aadhaar_verified', true);
                \Log::info('Full Aadhaar Data: ', ['data' => $result['data']]);

                \DB::table('aadhaar_users')->where('reference_id', $reference_id)->update([
                    'response_data' => json_encode($result)
                ]);

                return response()->json([
                    'success' => true,
                    'message' => 'OTP verified successfully. Aadhaar is now verified.',
                    'aadhaar_data' => $result['data']
                ], 200); 
            } else {
                return response()->json([
                    'success' => false,
                    'message' => $result['message'] ?? 'OTP verification failed',
                    'error' => $result['error'] ?? 'An error occurred'
                ], 400); 
            }

        } catch (\Exception $e) {
            \Log::error('Exception in verifyOtp method: ', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'An unexpected error occurred',
                'error' => 'Internal Server Error'
            ], 500); 
        }
    }


    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'full_name'     => 'required|string|max:255',
            'email'         => 'required|email|unique:users,email',
            'phone'         => 'required|digits:10',
            'password'      => 'required|string',
            // 'aadhar_number' => 'required|string|max:12', 
        ]);
    
        $user = new User();
        $user->full_name = $validatedData['full_name'];
        $user->email = $validatedData['email'];
        $user->mobile = $validatedData['phone'];
        $user->role_name = 'user';
        $user->password = Hash::make($validatedData['password']);
        $user->save();
    
        // // Retrieve Aadhaar-related data from session
        // $aadhar_number = session()->get('aadhar_number');
        // $response_data = session()->get('response_data');
    
        // // Save Aadhaar details
        // $aadhaarUser = new AadhaarUser(); 
        // $aadhaarUser->aadhar_number = $aadhar_number;
        // $aadhaarUser->response_data = json_encode($response_data); 
        // $aadhaarUser->user_id = $user->id; 
        // $aadhaarUser->save();
    
        // Clear session data
        // session()->forget(['aadhar_number', 'response_data']);
    

        return redirect('/login')->with('status', 'Registration Successful!');
    }
    

    /**
     * Get a validator for an incoming registration request.
     *
     * @param array $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        $registerMethod = getGeneralSettings('register_method') ?? 'mobile';

        if (!empty($data['mobile']) and !empty($data['country_code'])) {
            $data['mobile'] = ltrim($data['country_code'], '+') . ltrim($data['mobile'], '0');
        }

        $aadhar_number = session()->get('aadhar_number');

        $rules = [
            'country_code' => ($registerMethod == 'mobile') ? 'required' : 'nullable',
            'mobile' => (($registerMethod == 'mobile') ? 'required' : 'nullable') . '|numeric|unique:users',
            'email' => (($registerMethod == 'email') ? 'required' : 'nullable') . '|email|max:255|unique:users',
            // 'term' => 'required',
            'full_name' => 'required|string|min:3',
            // 'aadhar_number' => 'required',
            'password' => 'required|string|min:6|confirmed',
            'password' => 'required|string|min:6',
            // 'password_confirmation' => 'required|same:password',
            'referral_code' => 'nullable|exists:affiliates_codes,code',
        ];

        if (!empty(getGeneralSecuritySettings('captcha_for_register'))) {
            $rules['captcha'] = 'required|captcha';
        }

        return Validator::make($data, $rules, [], [
            'mobile' => trans('auth.mobile'),
            'email' => trans('auth.email'),
            // 'term' => trans('update.terms'),
            'full_name' => trans('auth.full_name'),
            'password' => trans('auth.password'),
            // 'password_confirmation' => trans('auth.password_repeat'),
            'referral_code' => trans('financial.referral_code'),
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param array $data
     * @return
     */
    protected function create(array $data)
    {
        if (!empty($data['mobile']) and !empty($data['country_code'])) {
            $data['mobile'] = ltrim($data['country_code'], '+') . ltrim($data['mobile'], '0');
        }

        $referralSettings = getReferralSettings();
        $usersAffiliateStatus = (!empty($referralSettings) and !empty($referralSettings['users_affiliate_status']));

        if (empty($data['timezone'])) {
            $data['timezone'] = getGeneralSettings('default_time_zone') ?? null;
        }

        $disableViewContentAfterUserRegister = getFeaturesSettings('disable_view_content_after_user_register');
        $accessContent = !((!empty($disableViewContentAfterUserRegister) and $disableViewContentAfterUserRegister));

        $roleName = Role::$user;
        $roleId = Role::getUserRoleId();

        if (!empty($data['account_type'])) {
            if ($data['account_type'] == Role::$teacher) {
                $roleName = Role::$teacher;
                $roleId = Role::getTeacherRoleId();
            } else if ($data['account_type'] == Role::$organization) {
                $roleName = Role::$organization;
                $roleId = Role::getOrganizationRoleId();
            }
        }

        $aadhar_number = session()->get('aadhar_number');
        $aadhaar_data = session()->get('aadhaar_verification_data');

        \Log::info('deils: ', ['aadhar_number' => $aadhar_number]);

        $user = User::create([
            // 'aadhar_number' => $aadhar_number,
            // 'aadhaar_data' => $aadhaar_data,
            'role_name' => $roleName,
            'role_id' => $roleId,
            'mobile' => $data['mobile'] ?? null,
            'email' => $data['email'] ?? null,
            'full_name' => $data['full_name'],
            'status' => User::$pending,
            'access_content' => $accessContent,
            'password' => Hash::make($data['password']),
            'affiliate' => $usersAffiliateStatus,
            'timezone' => $data['timezone'] ?? null,
            'created_at' => time()
        ]);

        if (!empty($data['certificate_additional'])) {
            UserMeta::updateOrCreate([
                'user_id' => $user->id,
                'name' => 'certificate_additional'
            ], [
                'value' => $data['certificate_additional']
            ]);
        }

        $this->storeFormFields($data, $user);

        return $user;
    }


    public function register(Request $request)
    {
        $validate = $this->validator($request->all());

        if ($validate->fails()) {
            $errors = $validate->errors();

            $form = $this->getFormFieldsByType($request->get('account_type'));

            if (!empty($form)) {
                $fieldErrors = $this->checkFormRequiredFields($request, $form);

                if (!empty($fieldErrors) and count($fieldErrors)) {
                    foreach ($fieldErrors as $id => $error) {
                        $errors->add($id, $error);
                    }
                }
            }

            throw new ValidationException($validate);
        } else {
            $form = $this->getFormFieldsByType($request->get('account_type'));
            $errors = [];

            if (!empty($form)) {
                $fieldErrors = $this->checkFormRequiredFields($request, $form);

                if (!empty($fieldErrors) and count($fieldErrors)) {
                    foreach ($fieldErrors as $id => $error) {
                        $errors[$id] = $error;
                    }
                }
            }

            if (count($errors)) {
                return back()->withErrors($errors)->withInput($request->all());
            }
        }


        $data = $request->all();

        if (!empty($data['mobile']) and !empty($data['country_code'])) {
            $data['mobile'] = $data['country_code'] . ltrim($data['mobile'], '0');
        }


        if (!empty($data['mobile'])) {
            $checkIsValid = checkMobileNumber($data['mobile']);

            if (!$checkIsValid) {
                $errors['mobile'] = [trans('update.mobile_number_is_not_valid')];
                return back()->withErrors($errors)->withInput($request->all());
            }
        }

        $user = $this->create($request->all());

        event(new Registered($user));

        $notifyOptions = [
            '[u.name]' => $user->full_name,
            '[u.role]' => trans("update.role_{$user->role_name}"),
            '[time.date]' => dateTimeFormat($user->created_at, 'j M Y H:i'),
        ];
        sendNotification("new_registration", $notifyOptions, 1);

        $registerMethod = getGeneralSettings('register_method') ?? 'mobile';

        $value = $request->get($registerMethod);
        if ($registerMethod == 'mobile') {
            $value = $request->get('country_code') . ltrim($request->get('mobile'), '0');
        }

        $referralCode = $request->get('referral_code', null);
        if (!empty($referralCode)) {
            session()->put('referralCode', $referralCode);
        }

        $verificationController = new VerificationController();
        $checkConfirmed = $verificationController->checkConfirmed($user, $registerMethod, $value);

        $referralCode = $request->get('referral_code', null);

        if ($checkConfirmed['status'] == 'send') {

            if (!empty($referralCode)) {
                session()->put('referralCode', $referralCode);
            }

            return redirect('/verification');
        } elseif ($checkConfirmed['status'] == 'verified') {
            $this->guard()->login($user);

            $enableRegistrationBonus = false;
            $registrationBonusAmount = null;
            $registrationBonusSettings = getRegistrationBonusSettings();
            if (!empty($registrationBonusSettings['status']) and !empty($registrationBonusSettings['registration_bonus_amount'])) {
                $enableRegistrationBonus = true;
                $registrationBonusAmount = $registrationBonusSettings['registration_bonus_amount'];
            }


            $user->update([
                'status' => User::$active,
                'enable_registration_bonus' => $enableRegistrationBonus,
                'registration_bonus_amount' => $registrationBonusAmount,
            ]);

            $registerReward = RewardAccounting::calculateScore(Reward::REGISTER);
            RewardAccounting::makeRewardAccounting($user->id, $registerReward, Reward::REGISTER, $user->id, true);

            if (!empty($referralCode)) {
                Affiliate::storeReferral($user, $referralCode);
            }

            $registrationBonusAccounting = new RegistrationBonusAccounting();
            $registrationBonusAccounting->storeRegistrationBonusInstantly($user);

            if ($response = $this->registered($request, $user)) {
                return $response;
            }

            return $request->wantsJson()
                ? new JsonResponse([], 201)
                : redirect($this->redirectPath());
        }
    }

}
