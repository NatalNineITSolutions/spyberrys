<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Signup</title>

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
            width: 100%;
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
            /* max-width: 23rem; */
            display: flex;
            flex-direction: column;
            align-items: center;
            /* gap: 15px; */
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

        #aadhar-step {
            display: flex;
            flex-direction: column;
        }

        #otp-step {
            display: none;
            flex-direction: column;
        }

        #personal-details-step {
            display: none;
            flex-direction: column;
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
        #loading-spinner {
            position: fixed; /* Fixed position to overlay content */
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 1000;
            display: none; 
        }

        .spinner-border {
            width: 3rem;
            height: 3rem;
            border-width: 0.25em;
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

            <a class="home" href="/">
                <p>Back to Home</p>
            </a>

            <p class="mob-home">
                <a href="/">Back to Home</a>
            </p>
        </div>

        <div class="login-form-container">
            <form class="login-form" id="signup-form" method="POST" >
                <h4>Sign Up</h4>
                <p>Please enter your details to register.</p>

                <!-- Aadhar Step -->
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

                <!-- OTP Verification Step -->
                <div id="otp-step" class="step-content">
                    <div class="form-group">
                        <label for="otp">OTP</label>
                        <input type="text" id="otp" name="otp" class="form form-control" placeholder="Enter OTP" required>
                            @error('otp')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        <div class="invalid-feedback" id="otp-error"></div>
                    </div>
                    <button type="button" class="next btn btn-block login" onclick="verifyOtp()">Next</button>
                    <div id="loading-spinner" style="display: none;">
                        <div class="spinner-border" role="status">
                            <span class="sr-only">Loading...</span>
                        </div>
                    </div>
                </div>

                   <!-- Personal Details Step -->
                   <div id="personal-details-step" class="step-content">
                        <form class="login-form" id="signup-form" method="POST" onsubmit="event.preventDefault(); detailsForm();">
                            <div class="form-group">
                                <label for="full-name">Full Name</label>
                                <input type="text" id="full-name" name="full_name" class="form form-control" placeholder="Enter Full Name">
                                <div class="invalid-feedback" id="full-name-error"></div>
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" name="email" class="form form-control" placeholder="Enter Email">
                                <div class="invalid-feedback" id="email-error"></div>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" id="password" name="password" class="form form-control" placeholder="Enter Password">
                                <div class="invalid-feedback" id="password-error"></div>
                            </div>
                            <div class="form-group">
                                <label for="repassword">Re Password</label>
                                <input type="repassword" id="repassword" name="repassword" class="form form-control" placeholder="Enter Password">
                                <div class="invalid-feedback" id="password-error"></div>
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone</label>
                                <input type="text" id="phone" name="phone" class="form form-control" placeholder="Enter Phone Number">
                                <div class="invalid-feedback" id="phone-error"></div>
                            </div>
                            <button type="submit" class="btn btn-primary" onclick="verifyOtp()">Submit</button>
                        </form>
                    
                    <!-- Loading Spinner -->
                    <div id="loading-spinner" style="display: none;">
                        <div class="spinner-border" role="status">
                            <span class="sr-only">Loading...</span>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    {{-- <script>
        let currentStep = 1;
    
        function showStep(step) {
            const steps = document.querySelectorAll('.step-content');
            const stepElements = document.querySelectorAll('.step');
    
            steps.forEach((el, index) => {
                if (index + 1 === step) {
                    el.style.display = 'flex';
                    stepElements[index].classList.add('active');
                } else {
                    el.style.display = 'none';
                    stepElements[index].classList.remove('active');
                    stepElements[index].classList.remove('completed');
                }
            });
    
            // Mark completed steps
            for (let i = 1; i < step; i++) {
                document.getElementById(`step-${i}`).classList.add('completed');
            }
    
            currentStep = step;
        }
    
        function sendOtp() {
            const aadharNumber = document.getElementById('aadhar-number').value;
            fetch('/send-otp', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                },
                body: JSON.stringify({ aadhar_number: aadharNumber })
            })
            .then(response => response.json())
            .then(data => {
                if (data.message === 'OTP sent successfully') {
                    showStep(2); // Show OTP step
                } else {
                    // Handle error and display feedback
                    console.error(data.message);
                    document.getElementById('aadhar-number-error').textContent = data.message;
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('aadhar-number-error').textContent = 'An error occurred while sending OTP.';
            });
        }
    
        function verifyOtp() {
            const otp = document.getElementById('otp').value;
            fetch('/verify-otp', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                },
                body: JSON.stringify({ otp: otp })
            })
            .then(response => response.json())
            .then(data => {
                if (data.message === 'OTP verified successfully') {
                    showStep(3); // Proceed to next step
                } else {
                    // Handle error and display feedback
                    console.error(data.message);
                    document.getElementById('otp-error').textContent = data.message;
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('otp-error').textContent = 'An error occurred while verifying OTP.';
            });
        }
    
        // Show the first step initially
        showStep(1);
    
        // Optional: Bind event listeners if buttons are dynamically created or changed
        document.querySelector('.next').addEventListener('click', function() {
            if (currentStep === 1) {
                sendOtp();
            } else if (currentStep === 2) {
                verifyOtp();
            }
        });
    </script> --}}

    <script>
        let currentStep = 1;

        function showLoading() {
            document.getElementById('loading-spinner').style.display = 'block';
        }

        function hideLoading() {
            document.getElementById('loading-spinner').style.display = 'none';
        }
    
        function showStep(step) {
            const steps = document.querySelectorAll('.step-content');
            const stepElements = document.querySelectorAll('.step');
    
            steps.forEach((el, index) => {
                if (index + 1 === step) {
                    el.style.display = 'flex';
                    stepElements[index].classList.add('active');
                } else {
                    el.style.display = 'none';
                    stepElements[index].classList.remove('active');
                    stepElements[index].classList.remove('completed');
                }
            });
    
            // Mark completed steps
            for (let i = 1; i < step; i++) {
                document.getElementById(`step-${i}`).classList.add('completed');
            }
    
            currentStep = step;
        }
    
        function sendOtp() {
            const aadharNumber = document.getElementById('aadhar-number').value;
            showLoading();
            fetch('/send-otp', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: JSON.stringify({ aadhar_number: aadharNumber })
            })
            .then(response => response.json())
            .then(data => {
                if (data.error) {
                    document.getElementById('aadhar-number-error').textContent = data.error;
                } else if (data.message === 'OTP sent successfully') {
                    showStep(2); 
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('aadhar-number-error').textContent = 'An error occurred while sending OTP.';
            });
        }
    
        function verifyOtp() {
            const otp = document.getElementById('otp').value;
            showLoading();
            const aadharNumber = document.getElementById('aadhar-number').value; // You might need to include this if used in backend
            fetch('/verify-otp', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: JSON.stringify({ otp: otp, aadhar_number: aadharNumber })
            })
            .then(response => response.json())
            .then(data => {
                if (data.error) {
                    document.getElementById('otp-error').textContent = data.error;
                } else if (data.message === 'OTP verified successfully') {
                    showStep(3); // Proceed to next step
                }
            })
            .catch(error => {
                console.error('Error:', error);
                 hideLoading();
                document.getElementById('otp-error').textContent = 'An error occurred while verifying OTP.';
            });
        }
        function detailsForm() {
            const aadharNumber = document.getElementById('aadhar-number').value; 
            const name = document.getElementById('full-name').value;
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            const phone = document.getElementById('phone').value;

            showLoading();
        
            fetch('/register', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                },
                body: JSON.stringify({ name, aadhar_number: aadharNumber, email, password, phone })
            })
            .then(response => response.json())
            .then(data => {
                hideLoading();
                if (data.success) {
                    showStep(3); // Proceed to next step
                } else {
                    // Show errors
                    document.getElementById('aadhar-number-error').textContent = data.message || 'An error occurred.';
                }
            })
            .catch(error => {
                hideLoading();
                console.error('Error:', error);
                document.getElementById('aadhar-number-error').textContent = 'An error occurred while processing your request.';
            });
        }

    
        // Show the first step initially
        showStep(1);
    
        document.querySelector('.login-form').addEventListener('submit', function(event) {
            event.preventDefault();
            if (currentStep === 1) {
                sendOtp();
            } else if (currentStep === 2) {
                verifyOtp();
            } else {
                this.submit(); // Submit the form if on the last step
            }
        });
    </script>

    {{-- <script>
        let currentStep = 1;
    
        function showStep(step) {
            const steps = document.querySelectorAll('.step-content');
            const stepElements = document.querySelectorAll('.step');
    
            steps.forEach((el, index) => {
                if (index + 1 === step) {
                    el.style.display = 'flex';
                    stepElements[index].classList.add('active');
                } else {
                    el.style.display = 'none';
                    stepElements[index].classList.remove('active');
                    stepElements[index].classList.remove('completed');
                }
            });
    
            // Mark completed steps
            for (let i = 1; i < step; i++) {
                document.getElementById(`step-${i}`).classList.add('completed');
            }
    
            currentStep = step;
        }
    
        function sendOtp() {
            const aadharNumber = document.getElementById('aadhar-number').value;
            fetch('/send-otp', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: JSON.stringify({ aadhar_number: aadharNumber })
            })
            .then(response => response.json())
            .then(data => {
                if (!data.success) {
                    document.getElementById('aadhar-number-error').textContent = data.message;
                } else {
                    // Store reference_id in localStorage
                    localStorage.setItem('reference_id', data.reference_id);
                    showStep(2);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('aadhar-number-error').textContent = 'An error occurred while sending OTP.';
            });
        }
    
        function verifyOtp() {
            const otp = document.getElementById('otp').value;
            const referenceId = localStorage.getItem('reference_id');
            fetch('/verify-otp', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: JSON.stringify({ otp: otp, reference_id: referenceId })
            })
            .then(response => response.json())
            .then(data => {
                if (!data.success) {
                    document.getElementById('otp-error').textContent = data.message;
                } else {
                    showStep(3); // Proceed to next step
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('otp-error').textContent = 'An error occurred while verifying OTP.';
            });
        }
    
        // Show the first step initially
        showStep(1);
    
        document.querySelector('.login-form').addEventListener('submit', function(event) {
            event.preventDefault();
            if (currentStep === 1) {
                sendOtp();
            } else if (currentStep === 2) {
                verifyOtp();
            } else {
                this.submit(); // Submit the form if on the last step
            }
        });
    </script> --}}
    
    
    
    
</body>
</html>
