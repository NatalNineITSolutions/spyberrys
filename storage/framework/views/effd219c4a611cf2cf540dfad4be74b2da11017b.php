

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">

    
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
                            <i class="far fa-envelope"></i>
                        </div>
                        <div class="text">
                            <h3>Email ID</h3>
                            <p>Enter your Email Id</p>
                        </div>
                    </div>
                </div>
                <div class="step" id="step-2">
                    <div class="circle">2</div>
                    <div class="line"></div>
                    <div class="content">
                        <div class="icon">
                            <i class="fas fa-lock"></i>
                        </div>
                        <div class="text">
                            <h3>Password</h3>
                            <p>Enter your Password</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="designs">
                <img src="./assets/default/img/dots.png" alt="">
                <img src="./assets/default/img/design.png" alt="">
            </div>

            <a href="<?php echo e(route ('home')); ?>" class="home">
                <p>Back to Home</p>
            </a>
        </div>
        <div class="login-form-container">
            <div class="login-form">
                <h4>Welcome Back!</h4>
                <p>"Secure Your Learning Journey: Log in to Spyberry and Unlock Endless Knowledge"</p>

                <form method="Post" action="/login" class="forms">
                    <input type="hidden" name="_token" value="<?php echo e(csrf_token()); ?>">
                
                    <?php echo $__env->make('web.default.auth.includes.register_methods', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                
                    <div class="step-content" id="password-step" style="display: none;">
                        <div class="d-flex align-items-center justify-content-between" style="margin-bottom:10px;">
                            <label class="input-label" for="password"><?php echo e(trans('auth.password')); ?>:</label>
                            <a href="/forget-password" target="_blank" class="forget-password"><?php echo e(trans('auth.forget_your_password')); ?></a>
                        </div>
                        <div class="form-group">
                            <input name="password" type="password" class="form-control form <?php $__errorArgs = ['password'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="password" aria-describedby="passwordHelp">
                            <?php $__errorArgs = ['password'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                            <div class="invalid-feedback">
                                <?php echo e($message); ?>

                            </div>
                            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                        </div>
                    
                        <?php if(!empty(getGeneralSecuritySettings('captcha_for_login'))): ?>
                            <?php echo $__env->make('web.default.includes.captcha_input', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        <?php endif; ?>
                    
                        <div class="mt-20 text-center sign-up">
                            <span><?php echo e(trans('auth.dont_have_account')); ?></span>
                            <a href="/register"><?php echo e(trans('auth.signup')); ?></a>  
                        </div>
                    
                        <button type="button" class="btn btn-block login" onclick="validatePassword()">Login</button>
                    </div>            
                </form>
            </div>

            <a href="<?php echo e(route ('home')); ?>" class="mob-home">
                <p>Back to Home</p>
            </a>
        </div>
    </div>
    <script src="/assets/default/vendors/select2/select2.min.js"></script>
    <script src="/assets/default/js/parts/forgot_password.min.js"></script>

    <script>
        function nextStep() {
            var email = document.getElementById('email').value;

            // Remove any existing client-side error
            document.getElementById('email-error').style.display = 'none';
            document.getElementById('email').classList.remove('is-invalid');

            // Check if the email field is empty
            if (email === '') {
                // Display the client-side error message below the input field
                document.getElementById('email').classList.add('is-invalid');
                document.getElementById('email-error').style.display = 'block';
            } else {
                // If the email field is filled out, proceed to the next step
                document.getElementById('email-step').style.display = 'none';
                document.getElementById('password-step').style.display = 'flex';

                // Update the form step appearance
                document.getElementById('step-1').classList.add('completed'); 
                document.getElementById('step-2').classList.add('active'); 
            }
        }
    
        function validatePassword() {
            var password = document.getElementById('password').value;
    
            if (password === '') {
                document.getElementById('password').classList.add('is-invalid');
                var errorDiv = document.createElement('div');
                errorDiv.classList.add('invalid-feedback');
                errorDiv.innerText = 'Please enter your password.';
                document.getElementById('password').parentNode.appendChild(errorDiv);
            } else {
                document.querySelector('.forms').submit(); // Submit the form if the password is entered
            }
        }
    </script>
</body>
</html>
<?php /**PATH C:\laragon\www\spyberrys\resources\views/web/default/auth/login.blade.php ENDPATH**/ ?>