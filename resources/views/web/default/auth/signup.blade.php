

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    {{-- Google Fonts --}}
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">

    {{-- Font Awesome --}}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <link rel="stylesheet" href="/assets/default/css/app.css">
    <link rel="stylesheet" href="/assets/default/vendors/select2/select2.min.css">
    <link rel="stylesheet" href="/assets/default/css/loginpage.css">

    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: "Montserrat", system-ui;
        }

        .main {
            width: 100%;
            height: 100vh;
            background-color: white;
            display: flex;
            align-items: center;
        }

        .sidebar {
            width: 30%;
            height: 100%;
            background-color: #FAFAFA;
            padding: 50px 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .sidebar .logo {
            width: 100px;
        }

        .form-step {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin-top: 80px;
        }

        .step {
            display: flex;
            align-items: center;
            margin-bottom: 70px;
            position: relative;
        }

        .circle {
            width: 30px;
            height: 30px;
            background-color: #EFF0F6;
            border-radius: 50%;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            position: relative;
            z-index: 2;
        }

        .line {
            width: 4px;
            height: 50px;
            border-radius: 15px;
            background-color: #EFF0F6;
            border: none;
            outline: none;
            position: absolute;
            left: 14px;
            top: 30px;
            z-index: 1;
            margin: 15px 0;
        }

        .content {
            display: flex;
            align-items: center;
            margin-left: 20px;
            z-index: 2;
        }

        .icon {
            font-size: 16px;
            margin-right: 15px;
            color: #000;
            background-color: white;
            width: 35px;
            height: 35px;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .text {
            color: #000;
        }

        .text h3 {
            margin: 0;
            font-size: 14px;
            font-weight: 600;
        }

        .text p {
            font-size: 12px;
            font-weight: 600;
            color: #797979;
        }

        .designs {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 55px;
        }

        .designs img {
            width: 100px;
        }

        .home {
            align-self: flex-start;
            text-decoration: none;
        }

        .home p {
            font-size: 14px;
            font-weight: 600;
            color: black;
            margin-top: 45px;
        }

        .mob-home {
            align-self: flex-start;
            font-size: 14px;
            font-weight: 600;
            color: black;
            margin-top: 45px;
            display: none;
        }

        .login-form-container {
            width: 70%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .login-form {
            max-width: 23rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
        }

        .login-form h4 {
            font-size: 25px;
            font-weight: 600;
        }

        .login-form p {
            font-size: 12px;
            font-weight: 500;
            max-width: 30rem;
            text-align: center;
            line-height: 20px;
        }

        .login-form .forms {
            width: 100%;
        }

        .login-form .form {
            width: 100%;
            padding: 13px 17px;
            font-family: "Montserrat", system-ui;
            font-size: 14px;
            font-weight: 500;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .forget-password {
            color: #FF9B26;
            font-size: 12px;
            font-weight: 600;
        }

        .sign-up {
            margin-bottom: 15px;
        }

        .sign-up span {
            font-size: 13px;
            font-weight: 600;
        }

        .sign-up a {
            font-size: 13px;
            font-weight: 600;
            color: #FF9B26;
        }
        
        @keyframes colorFlow {
            0% {
                background-color: transparent;
            }
            100% {
                background-color: #4A3AFF;
            }
        }

        .step.completed .circle,
        .step.completed .line,
        .step.active .circle {
            animation: colorFlow 1s forwards;
        }

        .step.completed .circle,
        .step.active .circle {
            background-color: #4A3AFF; /* Fallback for browsers that don't support animations */
        }

        .step.completed .line {
            background-color: #4A3AFF; /* Fallback for browsers that don't support animations */
        }

        .step-content {
            display: none;
        }

        #password-step {
            display: flex;
            flex-direction: column;
        }

        #email-step {
            display: block;
            position: relative;
        }

        #password-step.active {
            display: block;
        }

        .login {
            align-self: center;
            width: 120px;
            padding: 15px 25px;
            border-radius: 25px;
            text-transform: uppercase;
            letter-spacing: 1.2px;
            background-color: #4A3AFF;
            color: white;
            font-size: 13px;
            font-weight: 600;
        }

        .login:hover {
            color: white;
        }

        .next {
            background-color: #4A3AFF;
            color: white;
            font-size: 15px;
            font-weight: 600;
        }

        .next:hover {
            color: white;
        }

        .invalid-feedback {
            font-weight: 600;
            font-size: 12px;
        }

        @media (max-width:768px) {

            .sidebar {
                display: none;
            }

            .login-form-container {
                width: 100%;
                padding: 0 30px;
            }

            .mob-home {
                display: block;
            }
        }

        .otp-input-group {
            display: flex;
            justify-content: space-between; 
            max-width: 300px; 
            margin-top: 10px; 
        }
        .otp-input {
            width: 40px;
            height: 40px; 
            text-align: center; 
            font-size: 20px;
            border: 1px solid #ccc; 
            border-radius: 5px; 
            margin: 0 5px; 
        }

        .otp-input:focus {
            border-color: #007bff; 
            outline: none; 
        }

        
        .form-control{
            padding: 12px 1rem !important;
        }
        .error-message{
            color: red;
        }
        #loadingMessage {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100px; 
        }

        .spinner-border {
            width: 3rem;
            height: 3rem;
            border: 0.25em solid rgba(0, 0, 0, 0.966);
            border-right-color: transparent;
            border-radius: 50%;
            animation: spinner-border .75s linear infinite;
        }

        @keyframes spinner-border {
            to { transform: rotate(360deg); }
        }

    </style>
</head>
<body>
    <div class="main">
        <div class="sidebar">
            <img class="logo" src="./assets/default/img/logo.png" alt="">

            <div class="form-step">
                <div class="step" id="step-1">
                    <div class="circle">1</div>
                    <div class="line"></div>
                    <div class="content">
                        <div class="icon">
                            <i class="far fa-id-card"></i>
                        </div>
                        <div class="text">
                            <h3>Aadhar Number</h3>
                            <p>Enter your Aadhar number</p>
                        </div>
                    </div>
                </div>
                <div class="step" id="step-2">
                    <div class="circle">2</div>
                    <div class="line"></div>
                    <div class="content">
                        <div class="icon">
                            <i class="fas fa-key"></i>
                        </div>
                        <div class="text">
                            <h3>OTP Verification</h3>
                            <p>Verify your OTP</p>
                        </div>
                    </div>
                </div>
                <div class="step" id="step-3">
                    <div class="circle">3</div>
                    <div class="line"></div>
                    <div class="content">
                        <div class="icon">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="text">
                            <h3>Personal Details</h3>
                            <p>Enter your personal details</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="designs">
                <img src="./assets/default/img/dots.png" alt="">
                <img src="./assets/default/img/design.png" alt="">
            </div>

            <a href="{{route ('home')}}" class="home">
                <p>Back to Home</p>
            </a>
        </div>
        <div class="login-form-container">
            <div class="login-form">
                <h4>Create An Account</h4>
                <form method="POST" action="/register" class="forms">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                    <!-- Aadhar Number Section -->
                    <div class="form-group" id="aadhar-section">
                        <p class="m-5 p-5">"Please fill the form below to receive a OTP. Feel free to add as much details as need."</p>
                        <label class="input-label" for="aadhar_number">Aadhar Card Number:</label>
                        <div class="position-relative">
                            <input name="aadhar_number" type="text" class="form-control pr-5" id="aadhar_number" placeholder="Enter your Aadhar Number" required>
                            <i class="fa fa-user position-absolute" style="right: 80px; top: 50%; transform: translateY(-50%); color: #555;"></i>
                        </div>
                        <p class="p-5" style="font-weight: 400;">Already Have An Account? 
                            <a href="/login" style="color: #FF9B26">Login</a>
                        </p>
                        <div id="error-message-aadhar" class="error-message"></div>
                    </div>
                    <!-- OTP Section-->
                    <div class="form-group" id="otp-section" style="display: none;">
                        <p class="p-5" style="font-weight: 400;">Already Have An Account? 
                            <a href="/login" style="color: #FF9B26; font-weight: 600;">Login</a>
                        </p>
                        <p class="m-5 p-5" style="font-weight: 600;">Please fill the form below to receive an OTP. Feel free to add as many details as needed.</p>
                        <label class="input-label" for="otp">Enter OTP</label>
                        <div class="otp-input-group">
                            <input type="text" class="otp-input" maxlength="1" id="otp1" required>
                            <input type="text" class="otp-input" maxlength="1" id="otp2" required>
                            <input type="text" class="otp-input" maxlength="1" id="otp3" required>
                            <input type="text" class="otp-input" maxlength="1" id="otp4" required>
                            <input type="text" class="otp-input" maxlength="1" id="otp5" required>
                            <input type="text" class="otp-input" maxlength="1" id="otp6" required>
                        </div>
                        <p class="p-5 mt-5" style="font-weight: 600;">
                            <a href="/register" id="resendOtpLink" style="text-decoration: none; pointer-events: none;">Resend OTP</a>
                            <span id="timer" style="color: #FF9B26;">00:00</span>
                        </p>
                        <p class="p-5" style="font-weight: 600;">Help? 
                            <a href="/login" style="color: #FF9B26">Contact us</a>
                        </p>
                        <div id="error-message-otp" class="error-message"></div>
                    </div>
                    <!-- Personal Details Section  -->
                    <div class="form-group" id="personal-details-section" style="display: none;">
                        <p class="p-5" style="font-weight: 400;">Already Have An Account? 
                            <a href="/login" style="color: #FF9B26; font-weight: 600;">Login</a>
                        </p>
                        <div class="position-relative mb-3">
                            <label class="input-label" for="full_name">Full Name:</label>
                            <div class="d-flex align-items-center">
                                <i class="fas fa-user position-absolute" style="right: 12px; color: #555;"></i>
                                <input name="full_name" type="text" class="form-control ps-5" id="full_name" placeholder="Enter your full name" value="{{ old('name', $response_data['data']['name'] ?? '') }}" required>
                            </div>
                        </div>

                        <div class="position-relative mb-3">
                            <label class="input-label" for="email">Email:</label>
                            <div class="d-flex align-items-center">
                                <i class="fas fa-envelope position-absolute" style="right: 12px; color: #555;"></i>
                                <input name="email" type="email" class="form-control ps-5" id="email" placeholder="Enter your email address" required>
                            </div>
                        </div>

                        <div class="position-relative mb-3">
                            <label class="input-label" for="phone">Phone Number:</label>
                            <div class="d-flex align-items-center">
                                <i class="fas fa-phone position-absolute" style="right: 12px; color: #555;"></i>
                                <input name="phone" type="tel" class="form-control ps-5" id="phone" placeholder="Enter your phone number" required>
                            </div>
                        </div>

                        <div class="position-relative mb-3">
                            <label class="input-label" for="password">Password:</label>
                            <div class="d-flex align-items-center">
                                {{-- <i class="fas fa-lock position-absolute" style="right: 12px; color: #555;"></i> --}}
                                <input name="password" type="password" class="form-control ps-5" id="password" placeholder="Enter your password" required>
                                <i class="fas fa-eye position-absolute" style="right: 12px; color: #555; cursor: pointer;" id="togglePassword"></i>
                            </div>
                        </div>
                        <div class="position-relative mb-3">
                            <label class="input-label" for="confirm_password">Confirm Password:</label>
                            <div class="d-flex align-items-center">
                                {{-- <i class="fas fa-lock position-absolute" style="right: 12px; color: #555;"></i> --}}
                                <input name="confirm_password" type="password" class="form-control ps-5" id="confirm_password" placeholder="Confirm your password" required>
                                <i class="fas fa-eye position-absolute" style="right: 12px; color: #555; cursor: pointer;" id="toggleConfirmPassword"></i>
                            </div>
                        </div>
                        <div id="error-message-personal" class="error-message"></div>
                    </div>
                    <!-- Dynamic Button -->
                    <div class="text-center">
                        <button type="button" class="btn btn-primary" id="nextButton">Get OTP</button>
                        <div id="loadingMessage" style="display: none;">
                            <div class="spinner-border" role="status">
                                <span class="sr-only">Loading...</span>
                            </div>
                        </div>
                    </div>
                    {{-- <div class="text-center">
                        <button type="button" class="btn btn-primary" id="nextButton">Get OTP</button>
                    </div> --}}
                </form>
            </div>
            <a href="{{ route('home') }}" class="mob-home">
                <p>Back to Home</p>
            </a>
        </div>   
    </div>
    <script src="/assets/default/vendors/select2/select2.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/assets/default/js/parts/forgot_password.min.js"></script>

    {{-- <script>
        document.getElementById('nextButton').addEventListener('click', function() {
        // Get the current state of the sections
        const aadharSection = document.getElementById('aadhar-section');
        const otpSection = document.getElementById('otp-section');
        const personalDetailsSection = document.getElementById('personal-details-section');
        const nextButton = document.getElementById('nextButton');
        const promptText = document.getElementById('section-prompt');

        // Logic to move through the sections
        if (aadharSection.style.display !== 'none') {
            // Hide Aadhar section, show OTP section
            aadharSection.style.display = 'none';
            otpSection.style.display = 'block';
            nextButton.textContent = 'Verify';
        } else if (otpSection.style.display !== 'none') {
            otpSection.style.display = 'none';
            personalDetailsSection.style.display = 'block';
            nextButton.textContent = 'SignUp';
        } else if (personalDetailsSection.style.display !== 'none') {
            document.querySelector('form').submit();
        }
        });

    </script> --}}


    <script>
        $(document).ready(function() {
            $('#nextButton').on('click', function() {
                const aadharSection = $('#aadhar-section');
                const otpSection = $('#otp-section ');
                const personalDetailsSection = $('#personal-details-section');
                const nextButton = $('#nextButton');
                const loadingMessage = $('#loadingMessage');
                const errorMessageAadhar = $('#error-message-aadhar');
                const errorMessageOtp = $('#error-message-otp');
                const errorMessagePersonal = $('#error-message-personal');
    
                errorMessageAadhar.text('');
                errorMessageOtp.text('');
                errorMessagePersonal.text('');
    
                nextButton.prop('disabled', true);
                loadingMessage.show();
    
                let url, data, errorMessage;
    
                if (aadharSection.is(':visible')) {
                    url = '/send-otp'; 
                    data = {
                        aadhar_number: $('#aadhar_number').val(),
                        _token: $('input[name="_token"]').val()
                    };
    
                    $.ajax({
                        type: 'POST',
                        url: url,
                        data: data,
                        success: function(response) {
                            if (!response.success) {
                                errorMessage = response.message;
                                errorMessageAadhar.text(errorMessage); 
                            } else {
                                aadharSection.hide();
                                otpSection.show();
                                nextButton.text('Verify');
                                document.getElementById('step-1').classList.add('completed'); 
                                document.getElementById('step-2').classList.add('active'); 
                            }
                        },
                        error: function(xhr) {
                            errorMessage = 'An unexpected error occurred: ' + xhr.statusText;
                            errorMessageAadhar.text(errorMessage); 
                        },
                        complete: function() {
                            nextButton.prop('disabled', false);
                            loadingMessage.hide();
                        }
                    });
                } else if (otpSection.is(':visible')) {
                    url = '/verify-otp'; 
                    data = {
                        otp: getOtpValue(),
                        reference_id: $('input[name="reference_id"]').val(),
                        _token: $('input[name="_token"]').val()
                    };
    
                    $.ajax({
                        type: 'POST',
                        url: url,
                        data: data,
                        success: function(response) {
                            if (!response.success) {
                                errorMessage = response.message;
                                errorMessageOtp.text(errorMessage); 
                            } else {
                               
                                otpSection.hide();
                                personalDetailsSection.show();
                                nextButton.text('Submit');
                                document.getElementById('step-1').classList.add('completed'); 
                                document.getElementById('step-2').classList.add('completed'); 
                                document.getElementById('step-3').classList.add('active'); 
                            }
                        },
                        error: function(xhr) {
                            errorMessage = 'An unexpected error occurred: ' + xhr.statusText;
                            errorMessageOtp.text(errorMessage); 
                        },
                        complete: function() {
                            nextButton.prop('disabled', false);
                            loadingMessage.hide();
                        }
                    });
                } else if (personalDetailsSection.is(':visible')) {
                    url = '/register'; 
                    data = {
                        full_name: $('#full_name').val(),
                        email: $('#email').val(),
                        phone: $('#phone').val(),
                        password: $('#password').val(),
                        confirm_password: $('#confirm_password').val(),
                        _token: $('input[name="_token"]').val()
                    };
    
                    $.ajax({
                        type: 'POST',
                        url: url,
                        data: data,
                        success: function(response) {
                            if (!response.success) {
                                errorMessage = response.message;
                                errorMessagePersonal.text(errorMessage);
                            } else {
                                window.location.href = '/login'; 
                            }
                        },
                        error: function(xhr) {
                            window.location.href = '/login';
                            // errorMessage = 'An unexpected error occurred: ' + xhr.statusText;
                            // errorMessagePersonal.text(errorMessage); 
                        },
                        // complete: function() {
                        //     nextButton.prop('disabled', false);
                        //     loadingMessage.hide();
                        // }
                    });
                }
            });
    
            function getOtpValue() {
                return $('#otp1').val() + $('#otp2').val() + $('#otp3').val() + $('#otp4').val() + $('#otp5').val() + $('#otp6').val();
            }
        });
    </script>
    
    
    
    
    <script>
        document.querySelectorAll('.otp-input').forEach((element, index, elements) => {
            element.addEventListener('input', (event) => {
                if (event.target.value.length === 1 && index < elements.length - 1) {
                    elements[index + 1].focus();
                }
                
                if (event.inputType === 'deleteContentBackward' && index > 0) {
                    elements[index - 1].focus();
                }
            });
        });
    </script>


    {{-- OTP Timmer function --}}
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Set the timer duration (e.g., 2 minutes)
            var duration = 12 * 60; 
            var timerDisplay = document.getElementById('timer');
            var resendLink = document.getElementById('resendOtpLink');
    
            function updateTimer() {
                var minutes = Math.floor(duration / 60);
                var seconds = duration % 60;
                minutes = minutes < 10 ? '0' + minutes : minutes;
                seconds = seconds < 10 ? '0' + seconds : seconds;
                timerDisplay.textContent = minutes + ':' + seconds;
    
                if (duration > 0) {
                    duration--;
                    setTimeout(updateTimer, 1000);
                } else {
                    resendLink.style.pointerEvents = 'auto'; 
                    resendLink.style.color = '#FF9B26'; 
                }
            }
    
            updateTimer();
        });
    </script>

    {{-- password check --}}
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const togglePassword = document.getElementById('togglePassword');
            const passwordField = document.getElementById('password');
            const toggleConfirmPassword = document.getElementById('toggleConfirmPassword');
            const confirmPasswordField = document.getElementById('confirm_password');
        
            togglePassword.addEventListener('click', function () {
                const type = passwordField.type === 'password' ? 'text' : 'password';
                passwordField.type = type;
                this.classList.toggle('fa-eye-slash');
            });
        
            toggleConfirmPassword.addEventListener('click', function () {
                const type = confirmPasswordField.type === 'password' ? 'text' : 'password';
                confirmPasswordField.type = type;
                this.classList.toggle('fa-eye-slash');
            });
        });
    </script>
        
    
</body>
</html>
