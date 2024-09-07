@php
    $registerMethod = getGeneralSettings('register_method') ?? 'mobile';
    $showOtherRegisterMethod = getFeaturesSettings('show_other_register_method') ?? false;
@endphp

@if($showOtherRegisterMethod)
<p>"Please fill the form below to receive a OTP. Feel free to add as much details as need."</p>
    <div class="step-content" id="email-step">
        <div class="js-email-fields form-group {{ (($registerMethod == 'email' and empty(old('type'))) or old('type') == "email") ? '' : 'd-none' }}">
            <label class="input-label" for="email">{{ trans('public.email') }}:</label>
            <input name="email" type="email" placeholder="Enter Your Email" class="form-control form @error('email') is-invalid @enderror" id="email" value="{{ old('email') }}" aria-describedby="emailHelp">
            @error('email')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
            @enderror

            <div id="email-error" class="invalid-feedback" style="display: none;">
                Please enter your adhar Number.
            </div>

            <button type="button" class="btn btn-block mt-35 next" onclick="nextStep()">Next</button>
        </div>
    </div>

    <div id="aadhar-step" class="step-content">
        <form id="aadhar-form" class="forms">
            <div class="form-group">
                <label for="aadhar-number">Aadhar Number</label>
                <input type="text" id="aadhar-number" class="form" placeholder="Enter your Aadhar Number" required>
                <div class="invalid-feedback" id="aadhar-number-error"></div>
            </div>
            <button type="button" class="next btn btn-block login" onclick="sendOtp()">Next</button>
            <div id="loading-spinner" style="display: none;">
                <div class="spinner-border" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
        </form>
        @error('aadhar-number')
        <div class="invalid-feedback">
            {{ $message.$message }}
        </div>
        @enderror
    </div>

    <div class="js-mobile-fields {{ (($registerMethod == 'mobile' and empty(old('type'))) or old('type') == "mobile") ? '' : 'd-none' }}">
        @include('web.default.auth.register_includes.mobile_field')
    </div>

@else
    @if($registerMethod == 'mobile')
        <input type="hidden" name="type" value="mobile">
        <div class="">
            @include('web.default.auth.register_includes.mobile_field')
        </div>

    @else
        <input type="hidden" name="type" value="email">

        <div class=" form-group">
            <label class="input-label" for="email">{{ trans('public.email') }}:</label>
            <input name="email" type="email" class="form-control @error('email') is-invalid @enderror" id="email"
                   value="{{ old('email') }}" aria-describedby="emailHelp">
            @error('email')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
            @enderror
        </div>
    @endif
@endif
