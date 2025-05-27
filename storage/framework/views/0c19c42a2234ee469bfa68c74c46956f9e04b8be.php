<style>
    .custom-login {
        border: 1px solid rgba(234, 235, 239, 1);
        border-radius: 0.4rem;
        margin-right: 0.5rem;
        padding: 10px 15px;
        font-weight: 700;
    }

    .custom-login:hover {
        background-color: black;
        color: white;
    }

    .custom-register {
        border-radius: 0.4rem;
        border: none;
        outline: none;
        color: white;
        padding: 10px 15px;
        font-weight: 700;
    }

    .custom-register:hover {
        color: white;
    }
</style>

<?php if(!empty($authUser)): ?>

    <div class="custom-dropdown navbar-auth-user-dropdown position-relative ml-50">
        <div class="custom-dropdown-toggle d-flex align-items-center navbar-user cursor-pointer user-menu">
            <img src="<?php echo e($authUser->getAvatar()); ?>" class="rounded-circle" alt="<?php echo e($authUser->full_name); ?>">
            <span class="font-16 user-name ml-10 text-dark-blue font-14"><?php echo e($authUser->full_name); ?></span>
        </div>

        <div class="custom-dropdown-body pb-10">

            <div class="dropdown-user-avatar d-flex align-items-center p-15 m-15 mb-10 rounded-sm border">
                <div class="size-40 rounded-circle position-relative">
                    <img src="<?php echo e($authUser->getAvatar()); ?>" class="img-cover rounded-circle" alt="<?php echo e($authUser->full_name); ?>">
                </div>

                <div class="ml-5">
                    <div class="font-14 font-weight-bold text-secondary"><?php echo e($authUser->full_name); ?></div>
                    <span class="mt-5 text-gray font-12"><?php echo e($authUser->role->caption); ?></span>
                </div>
            </div>

            <ul class="my-8">
                <?php if($authUser->isAdmin()): ?>
                    <li class="navbar-auth-user-dropdown-item">
                        <a href="<?php echo e(getAdminPanelUrl()); ?>" class="d-flex align-items-center w-100 px-15 py-10 text-gray font-14 bg-transparent">
                            <img src="/assets/default/img/icons/user_menu/dashboard.svg" class="icons">
                            <span class="ml-5"><?php echo e(trans('panel.dashboard')); ?></span>
                        </a>
                    </li>

                    <li class="navbar-auth-user-dropdown-item">
                        <a href="<?php echo e(getAdminPanelUrl("/settings")); ?>" class="d-flex align-items-center w-100 px-15 py-10 text-gray font-14 bg-transparent">
                            <img src="/assets/default/img/icons/user_menu/settings.svg" class="icons">
                            <span class="ml-5"><?php echo e(trans('panel.settings')); ?></span>
                        </a>
                    </li>
                <?php else: ?>
                    <li class="navbar-auth-user-dropdown-item">
                        <a href="/panel" class="d-flex align-items-center w-100 px-15 py-10 text-gray font-14 bg-transparent">
                            <img src="/assets/default/img/icons/user_menu/dashboard.svg" class="icons">
                            <span class="ml-5"><?php echo e(trans('panel.dashboard')); ?></span>
                        </a>
                    </li>


                    <li class="navbar-auth-user-dropdown-item">
                        <a href="<?php echo e(($authUser->isUser()) ? '/panel/webinars/purchases' : '/panel/webinars'); ?>" class="d-flex align-items-center w-100 px-15 py-10 text-gray font-14 bg-transparent">
                            <img src="/assets/default/img/icons/user_menu/my_courses.svg" class="icons">
                            <span class="ml-5"><?php echo e(trans('update.my_courses')); ?></span>
                        </a>
                    </li>

                    <?php if(!$authUser->isUser()): ?>
                        <li class="navbar-auth-user-dropdown-item">
                            <a href="/panel/financial/sales" class="d-flex align-items-center w-100 px-15 py-10 text-gray font-14 bg-transparent">
                                <img src="/assets/default/img/icons/user_menu/sales_history.svg" class="icons">
                                <span class="ml-5"><?php echo e(trans('financial.sales_history')); ?></span>
                            </a>
                        </li>
                    <?php endif; ?>

                    <li class="navbar-auth-user-dropdown-item">
                        <a href="/panel/support" class="d-flex align-items-center w-100 px-15 py-10 text-gray font-14 bg-transparent">
                            <img src="/assets/default/img/icons/user_menu/support.svg" class="icons">
                            <span class="ml-5"><?php echo e(trans('panel.support')); ?></span>
                        </a>
                    </li>

                    <?php if(!$authUser->isUser() and empty(getFeaturesSettings('mobile_app_status'))): ?>
                        <li class="navbar-auth-user-dropdown-item">
                            <a href="<?php echo e($authUser->getProfileUrl()); ?>" class="d-flex align-items-center w-100 px-15 py-10 text-gray font-14 bg-transparent">
                                <img src="/assets/default/img/icons/user_menu/profile.svg" class="icons">
                                <span class="ml-5"><?php echo e(trans('public.profile')); ?></span>
                            </a>
                        </li>
                    <?php endif; ?>

                    <li class="navbar-auth-user-dropdown-item">
                        <a href="/panel/setting" class="d-flex align-items-center w-100 px-15 py-10 text-gray font-14 bg-transparent">
                            <img src="/assets/default/img/icons/user_menu/settings.svg" class="icons">
                            <span class="ml-5"><?php echo e(trans('panel.settings')); ?></span>
                        </a>
                    </li>
                <?php endif; ?>

                <li class="navbar-auth-user-dropdown-item">
                    <a href="/logout" class="d-flex align-items-center w-100 px-15 py-10 text-danger font-14 bg-transparent">
                        <img src="/assets/default/img/icons/user_menu/logout.svg" class="icons">
                        <span class="ml-5"><?php echo e(trans('auth.logout')); ?></span>
                    </a>
                </li>

            </ul>

        </div>
    </div>
<?php else: ?>
    <div class="d-flex align-items-center">
        <a href="/login" class="text-dark-blue font-14 custom-login"><?php echo e(trans('auth.login')); ?></a>
        <a href="/register" class="text-dark-blue font-14 custom-register btn-primary"><?php echo e(trans('auth.sign_up')); ?></a>
    </div>
<?php endif; ?><?php /**PATH C:\laragon\www\spyberrys\resources\views/web/default/includes/top_nav/user_menu.blade.php ENDPATH**/ ?>