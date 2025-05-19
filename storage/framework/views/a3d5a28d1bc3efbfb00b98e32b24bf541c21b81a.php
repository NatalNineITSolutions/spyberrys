<style>
    .stars-card {
        display: none !important;
    }

    .author-price-details {
        width: 100%;
        display: flex;
        align-items: center;
        justify-content: space-between; 
    }
</style>

<div class="webinar-card">
    <figure>
        <div class="image-box">
            

            <a href="<?php echo e($webinar->getUrl()); ?>">
                <img src="<?php echo e($webinar->getImage()); ?>" class="img-cover" alt="<?php echo e($webinar->title); ?>">
            </a>


            <?php if($webinar->checkShowProgress()): ?>
                <div class="progress">
                    <span class="progress-bar" style="width: <?php echo e($webinar->getProgress()); ?>%"></span>
                </div>
            <?php endif; ?>

            <?php if($webinar->type == 'webinar'): ?>
                <a href="<?php echo e($webinar->addToCalendarLink()); ?>" target="_blank" class="webinar-notify d-flex align-items-center justify-content-center">
                    <i data-feather="bell" width="20" height="20" class="webinar-icon"></i>
                </a>
            <?php endif; ?>
        </div>

        <figcaption class="webinar-card-body">
            

            <a href="<?php echo e($webinar->getUrl()); ?>">
                <h3 class="webinar-title font-weight-bold font-16 text-black"><?php echo e(clean($webinar->title,'title')); ?></h3>
            </a>

            <?php echo $__env->make(getTemplate() . '.includes.webinar.rate',['rate' => $webinar->getRate()], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

            <div class="author-price-details">
                <a href="<?php echo e($webinar->teacher->getProfileUrl()); ?>" target="_blank" class="user-name text-secondary-black font-14"><?php echo e($webinar->teacher->full_name); ?></a>

                <div class="webinar-price-box">
                    <?php if(!empty($isRewardCourses) and !empty($webinar->points)): ?>
                        <span class="text-warning real font-14"><?php echo e($webinar->points); ?> <?php echo e(trans('update.points')); ?></span>
                    <?php elseif(!empty($webinar->price) and $webinar->price > 0): ?>
                        <?php if($webinar->bestTicket() < $webinar->price): ?>
                            <span class="real"><?php echo e(($webinar->bestTicket() > 0) ? handlePrice($webinar->bestTicket(), true, true, false, null, true) : trans('public.free')); ?></span>
                            <span class="off ml-10"><?php echo e(handlePrice($webinar->price, true, true, false, null, true)); ?></span>
                        <?php else: ?>
                            <span class="real text-secondary-black"><?php echo e(handlePrice($webinar->price, true, true, false, null, true)); ?></span>
                        <?php endif; ?>
                    <?php else: ?>
                        <span class="real font-14"><?php echo e(trans('public.free')); ?></span>
                    <?php endif; ?>
                </div>
            </div>
            
        </figcaption>
    </figure>
</div>
<?php /**PATH C:\laragon\www\spyberrys\resources\views/web/default/includes/webinar/grid-card.blade.php ENDPATH**/ ?>