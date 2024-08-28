<div class="webinar-card">
    <figure>
        <div class="image-box">
            <div class="badges-lists">
                <?php if($webinar->bestTicket() < $webinar->price): ?>
                    <span class="badge badge-danger"><?php echo e(trans('public.offer',['off' => $webinar->bestTicket(true)['percent']])); ?></span>
                <?php elseif(empty($isFeature) and !empty($webinar->feature)): ?>
                    <span class="badge badge-warning"><?php echo e(trans('home.featured')); ?></span>
                <?php elseif($webinar->type == 'webinar'): ?>
                    <?php if($webinar->start_date > time()): ?>
                        <span class="badge badge-primary"><?php echo e(trans('panel.not_conducted')); ?></span>
                    <?php elseif($webinar->isProgressing()): ?>
                        <span class="badge badge-secondary"><?php echo e(trans('webinars.in_progress')); ?></span>
                    <?php else: ?>
                        <span class="badge badge-secondary"><?php echo e(trans('public.finished')); ?></span>
                    <?php endif; ?>
                <?php elseif(!empty($webinar->type)): ?>
                    <span class="badge badge-primary"><?php echo e(trans('webinars.'.$webinar->type)); ?></span>
                <?php endif; ?>

                <?php echo $__env->make('web.default.includes.product_custom_badge', ['itemTarget' => $webinar], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </div>

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
            <a href="<?php echo e($webinar->getUrl()); ?>" class="title">
                <h4 class="webinar-title"><?php echo e(clean($webinar->title,'title')); ?></h4>
                <img src="/assets/default/img/classes/arrow-up-right.png" alt="">
            </a>

            <p>"Master the essentials of Cybersecurity and protect sensitive information from cyber threats. Our course covers key concepts like network security, encryption, and risk management, equipping you with the skills to safeguard digital assets in today's interconnected world."</p>

            

            

            <div class="d-flex justify-content-between" style="margin-top: 10px;">
                <div class="d-flex align-items-center" style="gap: 6px;">
                    <i data-feather="clock" width="20" height="20" class="webinar-icon"></i>
                    <span class="duration font-12"><?php echo e(convertMinutesToHourAndMinute($webinar->duration)); ?> <?php echo e(trans('home.hours')); ?></span>
                </div>

                <div class="vertical-line mx-15"></div>

                <div class="d-flex align-items-center" style="gap: 6px;">
                    <i data-feather="calendar" width="20" height="20" class="webinar-icon"></i>
                    <span class="date-published font-12"><?php echo e(dateTimeFormat(!empty($webinar->start_date) ? $webinar->start_date : $webinar->created_at,'j M Y')); ?></span>
                </div>
            </div>

            <div class="user-inline-avatar d-flex align-items-center">
                <div class="avatar bg-gray200">
                    <img src="<?php echo e($webinar->teacher->getAvatar()); ?>" class="img-cover" alt="<?php echo e($webinar->teacher->full_name); ?>">
                </div>
                <a href="<?php echo e($webinar->teacher->getProfileUrl()); ?>" target="_blank" class="user-name ml-5 font-14"><?php echo e($webinar->teacher->full_name); ?></a>
            </div>

            <div class="webinar-price-box mt-25">
                <?php if(!empty($isRewardCourses) and !empty($webinar->points)): ?>
                    <span class="text-warning real font-14"><?php echo e($webinar->points); ?> <?php echo e(trans('update.points')); ?></span>
                <?php elseif(!empty($webinar->price) and $webinar->price > 0): ?>
                    <?php if($webinar->bestTicket() < $webinar->price): ?>
                        <span class="real"><?php echo e(handlePrice($webinar->bestTicket(), true, true, false, null, true)); ?></span>
                        <span class="off ml-10"><?php echo e(handlePrice($webinar->price, true, true, false, null, true)); ?></span>
                    <?php else: ?>
                        <span class="real"><?php echo e(handlePrice($webinar->price, true, true, false, null, true)); ?></span>
                    <?php endif; ?>
                <?php else: ?>
                    <span class="real font-14"><?php echo e(trans('public.free')); ?></span>
                <?php endif; ?>
            </div>
        </figcaption>
    </figure>
</div>
<?php /**PATH C:\laragon\www\spyberrys\resources\views/web/default/includes/webinar/grid-card.blade.php ENDPATH**/ ?>