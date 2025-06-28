<style>
    .footer-sub-link {
        color: white;
    }

    a {
        color: white;
    }
</style>

<footer class="custom-footer">
    <div class="custom-footer-container">

        <div class="custom-footer-column custom-footer-brand">
            <a href="/">
                <?php if(!empty($generalSettings['footer_logo'])): ?>
                    <img src="<?php echo e($generalSettings['footer_logo']); ?>" class="mb-3" alt="footer logo">
                <?php endif; ?>
            </a>
            <p>Top learning experiences that create more talent in the world.</p>
        </div>

        <div class="custom-footer-column">
            <h4>Quick Links</h4>
            <ul>
                <li><a href="/classes">Top Course</a></li>
            </ul>
        </div>

        <?php
            $footerColumns = getFooterColumns();
            $columns = ['third_column', 'forth_column'];
            $classes = ['custom-footer-column', 'custom-footer-column custom-footer-legal'];
        ?>

        <?php $__currentLoopData = $columns; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $column): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <?php if(!empty($footerColumns[$column])): ?>
                <div class="<?php echo e($classes[$index]); ?>">
                    <?php if(!empty($footerColumns[$column]['title'])): ?>
                        <h4><?php echo e($footerColumns[$column]['title']); ?></h4>
                    <?php endif; ?>

                    <?php if(!empty($footerColumns[$column]['value'])): ?>
                        <p class="footer-sub-link"><?php echo $footerColumns[$column]['value']; ?></p>
                    <?php endif; ?>
                </div>
            <?php endif; ?>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

    </div>
    
    <?php
        $socials = getSocials();
        if (!empty($socials) and count($socials)) {
            $socials = collect($socials)->sortBy('order')->toArray();
        }
    ?>

    <div class="custom-footer-bottom">
        <p><?php echo e(trans('update.platform_copyright_hint')); ?></p>

        

        <div class="custom-footer-social-icons">
            <a href="https://www.linkedin.com" target="_blank" title="LinkedIn">
                <i class="fab fa-linkedin"></i>
            </a>
        </div>

    </div>

</footer>

<?php /**PATH C:\laragon\www\spyberrys\resources\views/web/default/includes/footer.blade.php ENDPATH**/ ?>