<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Support\Facades\Log;

class AadhaarVerification
{
    protected $apiKey;
    protected $apiSecret;
    protected $apiVersion;
    protected $accessToken;

    public function __construct()
    {
        // $this->apiKey = env('SANDBOX_API_KEY');
        // $this->apiSecret = env('SANDBOX_API_SECRET');
        // $this->apiVersion = env('SANDBOX_API_VERSION');
        // $this->accessToken = $this->authenticate();

        $this->apiKey = "key_live_vEMXqHrRxbSbjR2MvyXhBjbDrVAYR3ZP";
        $this->apiSecret = "secret_live_cYh5qN5dtHoigWtaEzIu4GQWCkAms49s";
        $this->apiVersion = "2.0";
        $this->accessToken = $this->authenticate();
    }

    protected function authenticate()
    {
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://api.sandbox.co.in/authenticate',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_HTTPHEADER => array(
                'x-api-key: ' . $this->apiKey,
                'x-api-secret: ' . $this->apiSecret,
                'x-api-version: ' . $this->apiVersion,
                'Content-Type: application/json'
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            throw new \Exception("Authentication Error: " . $err);
        }

        $authResponse = json_decode($response, true);

        if (isset($authResponse['access_token'])) {
            return $authResponse['access_token'];
        } else {
            throw new \Exception("Failed to get access token: " . print_r($authResponse, true));
        }
    }

    public function sendOtp($aadharNumber)
    {
        Log::info("Access Token: " . $this->accessToken);
        
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://api.sandbox.co.in/kyc/aadhaar/okyc/otp',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => json_encode(array(
                "@entity" => "in.co.sandbox.kyc.aadhaar.okyc.otp.request",
                "aadhaar_number" => $aadharNumber,
                "reason" => "For KYC",
                "consent" => "y"
            )),
            CURLOPT_HTTPHEADER => array(
                'Authorization: ' . $this->accessToken,
                'x-api-key: ' . $this->apiKey,
                'x-api-version: ' . $this->apiVersion,
                'Content-Type: application/json'
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            Log::error("Send OTP Error: " . $err);
            return json_encode(['error' => $err]);
        }

        $responseData = json_decode($response, true);
        Log::info("sent URL: ", ['curl' => $curl]);

        // Log the full response for debugging
        Log::info("Send OTP Response: " . print_r($responseData, true));

        if (isset($responseData['data']['reference_id'])) {
            return [
                'success' => true,
                'data' => [
                    'reference_id' => $responseData['data']['reference_id']
                ]
            ];
        } else {
            return ['success' => false, 'error' => 'Reference ID not found in response.'];
        }
    }
   

    public function verifyOtp($referenceId, $otp, $userId = null)
    {
        Log::info("Access Token: " . $this->accessToken);
        Log::info("referenceId: " . $referenceId);
    
        $curl = curl_init();
        $postFields = '{
            "@entity": "in.co.sandbox.kyc.aadhaar.okyc.request",
            "reference_id": "'. $referenceId . '",
            "otp": "' . $otp . '"
        }';
        curl_setopt_array($curl, [
            CURLOPT_URL => 'https://api.sandbox.co.in/kyc/aadhaar/okyc/otp/verify',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => $postFields,
            CURLOPT_HTTPHEADER => array(
                'Authorization: ' . $this->accessToken,
                'x-api-key: ' . $this->apiKey,
                'x-api-secret: ' . $this->apiSecret,
                'x-api-version: ' . $this->apiVersion,
                'Content-Type: application/json'
            ),
        ]);
    
        $response = curl_exec($curl);
        $err = curl_error($curl);
        curl_close($curl);
    
        Log::info("OTP: ", ['otp' => $otp]);
        Log::info("Reference ID: ", ['reference_id' => $referenceId]);
    
        if ($err) {
            Log::error("Curl Error: " . $err);
            return ['success' => false, 'error' => 'An unexpected error occurred'];
        }
        $responseData = json_decode($response, true);
        Log::info("API Response: ", ['response' => $responseData]);
        Log::info("API cirl: ", ['$curl' => $curl]);
    
        if (isset($responseData['code']) && $responseData['code'] == 400) {
            Log::error("API Error: " . $responseData['message']);
            return ['success' => false, 'error' => $responseData['message']];
        }
    
        if (isset($responseData['data'])) {
            $message = $responseData['data']['message'] ?? null;
    
            if ($message === "Aadhaar Card Exists") {
                Log::info("Aadhaar Card Exists: " . $message);
    
                if ($userId) {
                    $user = User::find($userId);
                    if ($user) {
                        $user->aadhaar_data = $responseData;
                        $user->aadhaar_verified = 1;
                        $user->save();
                    } else {
                        Log::warning("User with ID {$userId} not found. Storing data in session.");
                    }
                }

                session()->put('aadhaar_verification', $responseData);
                session()->put('aadhaar_verified', true);
                return ['success' => true, 'data' => $responseData];
            } else {
                session()->put('aadhaar_verified', false);
                return ['success' => false, 'message' => $message];
            }
        } else {
            Log::error("Unexpected response format: " . print_r($responseData, true));
            session()->put('aadhaar_verified', false);
            return ['success' => false, 'message' => 'Unexpected response format'];
        }
    }
    
    
}
