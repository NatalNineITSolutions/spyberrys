<?php
    $registerMethod = getGeneralSettings('register_method') ?? 'mobile';
    $showOtherRegisterMethod = getFeaturesSettings('show_other_register_method') ?? false;
?>

<?php if($showOtherRegisterMethod): ?>
<p>"Please fill the form below to receive a OTP. Feel free to add as much details as need."</p>
    <div class="step-content" id="email-step">
        <div class="js-email-fields form-group <?php echo e((($registerMethod == 'email' and empty(old('type'))) or old('type') == "email") ? '' : 'd-none'); ?>">
            <label class="input-label" for="email"><?php echo e(trans('public.email')); ?>:</label>
            <input name="email" type="email" placeholder="Enter Your Email" class="form-control form <?php $__errorArgs = ['email'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="email" value="<?php echo e(old('email')); ?>" aria-describedby="emailHelp">
            <?php $__errorArgs = ['email'];
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
        <?php $__errorArgs = ['aadhar-number'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
        <div class="invalid-feedback">
            <?php echo e($message.$message); ?>

        </div>
        <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
    </div>

    <div class="js-mobile-fields <?php echo e((($registerMethod == 'mobile' and empty(old('type'))) or old('type') == "mobile") ? '' : 'd-none'); ?>">
        <?php echo $__env->make('web.default.auth.register_includes.mobile_field', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    </div>

<?php else: ?>
    <?php if($registerMethod == 'mobile'): ?>
        <input type="hidden" name="type" value="mobile">
        <div class="">
            <?php echo $__env->make('web.default.auth.register_includes.mobile_field', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        </div>

    <?php else: ?>
        <input type="hidden" name="type" value="email">

        <div class=" form-group">
            <label class="input-label" for="email"><?php echo e(trans('public.email')); ?>:</label>
            <input name="email" type="email" class="form-control <?php $__errorArgs = ['email'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="email"
                   value="<?php echo e(old('email')); ?>" aria-describedby="emailHelp">
            <?php $__errorArgs = ['email'];
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
    <?php endif; ?>
<?php endif; ?>
<?php /**PATH C:\laragon\www\spyberrys\resources\views/web/default/auth/includes/signup.blade.php ENDPATH**/ ?>