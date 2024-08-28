<?php
    $socials = getSocials();
    if (!empty($socials) and count($socials)) {
        $socials = collect($socials)->sortBy('order')->toArray();
    }

    $footerColumns = getFooterColumns();
?>

<footer class="footer position-relative user-select-none">
    

    <?php
        $columns = ['first_column','second_column','third_column','forth_column'];
    ?>

    <div class="container">
        <div class="row">

            <div class="col-lg-3 col-md-12 col-12">
                <div class="logo">
                    <img src="./assets/default/img/home/logo.png" alt="" style="width: 160px;">
                    <p>Top learning experiences that create more talent in the world.</p>
                </div>
            </div>

            <div class="col-lg-9 col-md-12 col-12">
                <div class="row">
                    <?php $__currentLoopData = $columns; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $column): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="col-6 col-md-3">
                            <?php if(!empty($footerColumns[$column])): ?>
                                <?php if(!empty($footerColumns[$column]['title'])): ?>
                                    <span class="header d-block text-white font-weight-bold"><?php echo e($footerColumns[$column]['title']); ?></span>
                                <?php endif; ?>

                                <?php if(!empty($footerColumns[$column]['value'])): ?>
                                    <div class="mt-20" style="font-family: 'Montserrat';">
                                        <?php echo $footerColumns[$column]['value']; ?>

                                    </div>
                                <?php endif; ?>
                            <?php endif; ?>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>

        </div>

        
    </div>

    <?php if(getOthersPersonalizationSettings('platform_phone_and_email_position') == 'footer'): ?>
        <div class="footer-copyright-card">
            <div class="container d-flex align-items-center justify-content-between py-15 copyright">
                <div class="font-14 text-white"><?php echo e(trans('update.platform_copyright_hint')); ?></div>

                <div class="d-flex align-items-center justify-content-center contact">
                    <?php if(!empty($generalSettings['site_phone'])): ?>
                        <div class="d-flex align-items-center text-white font-14">
                            <i data-feather="phone" width="20" height="20" class="mr-10"></i>
                            <?php echo e($generalSettings['site_phone']); ?>

                        </div>
                    <?php endif; ?>

                    <?php if(!empty($generalSettings['site_email'])): ?>
                        <div class="border-left mx-5 mx-lg-15 h-100"></div>

                        <div class="d-flex align-items-center text-white font-14">
                            <i data-feather="mail" width="20" height="20" class="mr-10"></i>
                            <?php echo e($generalSettings['site_email']); ?>

                        </div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    <?php endif; ?>

</footer>
<?php /**PATH C:\laragon\www\spyberrys\resources\views/web/default/includes/footer.blade.php ENDPATH**/ ?>