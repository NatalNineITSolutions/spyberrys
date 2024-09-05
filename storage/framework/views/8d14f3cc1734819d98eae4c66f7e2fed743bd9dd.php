

<?php $__env->startPush('styles_top'); ?>
    <link rel="stylesheet" href="/assets/default/vendors/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="/assets/default/vendors/select2/select2.min.css">
    <link rel="stylesheet" href="/assets/default/css/classes.css">


    <style>
        .custom-control-label::after {
            width: 1rem;
            height: 1rem;
        }

        .custom-control-label::before {
            width: 1rem;
            height: 1rem;
        }

        .custom-control-input:not(:disabled):active ~ .custom-control-label:before, .custom-control-input:checked ~ .custom-control-label:before {
            color: var(--primary-btn-color);
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            box-shadow: none;
        }

        .filter-box label {
            font-size: 13px;
        }

        .form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .description {
            display: -webkit-box;
            -webkit-line-clamp: 4;
            -webkit-box-orient: vertical;  
            overflow: hidden;
            text-overflow: ellipsis;
            max-height: 6em; /* Adjust according to line height */
            line-height: 1.5em; /* Adjust the line height if needed */
            white-space: normal;
        }
    </style>
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
    

    
    <div class="course-slide">
        <div class="container course-slide-container">
            <div class="slide-details">
                <h4>All Courses</h4>
                <div class="address">
                    <p>Home</p>
                    <i class="fa-solid fa-chevron-right"></i>
                    <p>Courses</p>
                </div>
            </div>
        </div>
        <img src="./assets/default/img/course/shape-1.png" class="one" alt="">
        <img src="./assets/default/img/course/shape-2.png" class="two" alt="">
        <img src="./assets/default/img/course/shape-3.png" class="three" alt="">
    </div>

    

    <div class="container course-container">
            <form action="/classes" method="get" id="filtersForm" class="w-100 form">

                <div class="row w-100">
                    <div class="col-lg-3 col-md-12 col-12 mt-5">
                        <div class="filters-container">
    
                            <div class="filter-box">
                                <h3 class="category-filter-title font-20 font-weight-bold text-dark-blue"><?php echo e(trans('public.type')); ?></h3>
    
                                <div class="pt-10 mt-10">
                                    <?php $__currentLoopData = ['bundle','webinar','course','text_lesson']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $typeOption): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <div class="d-flex align-items-center justify-content-between">
                                            <label class="cursor-pointer" for="filterLanguage<?php echo e($typeOption); ?>">
                                                <?php if($typeOption == 'bundle'): ?>
                                                    <?php echo e(trans('update.bundle')); ?>

                                                <?php else: ?>
                                                    <?php echo e(trans('webinars.'.$typeOption)); ?>

                                                <?php endif; ?>
                                            </label>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" name="type[]" id="filterLanguage<?php echo e($typeOption); ?>" value="<?php echo e($typeOption); ?>" <?php if(in_array($typeOption, request()->get('type', []))): ?> checked="checked" <?php endif; ?> class="custom-control-input">
                                                <label class="custom-control-label" for="filterLanguage<?php echo e($typeOption); ?>"></label>
                                            </div>
                                        </div>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </div>
                            </div>
    
                            <div class="border-top border-gray300 filter-box">
                                <h3 class="category-filter-title font-20 font-weight-bold text-dark-blue"><?php echo e(trans('site.more_options')); ?></h3>
    
                                <div class="pt-10">
                                    <?php $__currentLoopData = ['subscribe','certificate_included','with_quiz','featured']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $moreOption): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <div class="d-flex align-items-center justify-content-between">
                                            <label class="cursor-pointer" for="filterLanguage<?php echo e($moreOption); ?>"><?php echo e(trans('webinars.show_only_'.$moreOption)); ?></label>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" name="moreOptions[]" id="filterLanguage<?php echo e($moreOption); ?>" value="<?php echo e($moreOption); ?>" <?php if(in_array($moreOption, request()->get('moreOptions', []))): ?> checked="checked" <?php endif; ?> class="custom-control-input">
                                                <label class="custom-control-label" for="filterLanguage<?php echo e($moreOption); ?>"></label>
                                            </div>
                                        </div>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-sm btn-primary btn-block"><?php echo e(trans('site.filter_items')); ?></button>
                        </div>
                    </div>
    
                    <div class="col-lg-9 col-12 result mt-sm-20">
                        <?php echo $__env->make('web.default.pages.includes.top_filters', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    
                        <div class="row">
                            <div class="col-12 col-lg-8">
                                <?php if(empty(request()->get('card')) or request()->get('card') == 'grid'): ?>
                                    <div class="row">
                                        <?php $__currentLoopData = $webinars; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $webinar): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <div class="col-12 col-lg-6 mt-20">
                                                <?php echo $__env->make('web.default.includes.webinar.grid-card',['webinar' => $webinar], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                            </div>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </div>
    
                                <?php elseif(!empty(request()->get('card')) and request()->get('card') == 'list'): ?>
    
                                    <?php $__currentLoopData = $webinars; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $webinar): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <?php echo $__env->make('web.default.includes.webinar.list-card',['webinar' => $webinar], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                <?php endif; ?>
                            </div>
    
                            
                        </div>
                    </div>
                </div>
            </form>
        <div class="mt-50 pt-30">
            <?php echo e($webinars->appends(request()->input())->links('vendor.pagination.panel')); ?>

        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts_bottom'); ?>
    <script src="/assets/default/vendors/select2/select2.min.js"></script>
    <script src="/assets/default/vendors/swiper/swiper-bundle.min.js"></script>

    <script src="/assets/default/js/parts/categories.min.js"></script>

    
    <script>
        const categoriesShowMore = document.getElementById('categories-show-more');
        const categoriesItems = document.querySelectorAll('.categories li');
        const categoriesFilterBox = document.getElementById('categories-filter-box');

        categoriesShowMore.addEventListener('click', () => {
            const hiddenCategories = Array.from(categoriesItems).filter((item, index) => index >= 6);
            const isExpanding = hiddenCategories[0].style.display === 'none' || hiddenCategories[0].style.display === '';
            
            hiddenCategories.forEach(item => {
                item.style.display = isExpanding ? 'flex' : 'none';
            });

            // Adjust the filter box height
            categoriesFilterBox.style.height = isExpanding ? categoriesFilterBox.scrollHeight + 'px' : 'auto';
            categoriesShowMore.textContent = isExpanding ? 'Show Less -' : 'Show More +';
        });

        // Set the initial height of the categories filter box
        window.addEventListener('DOMContentLoaded', () => {
            categoriesFilterBox.style.height = categoriesFilterBox.scrollHeight + 'px';
        });
    </script>

    
    <script>
        const languagesShowMore = document.getElementById('languages-show-more');
        const languagesItems = document.querySelectorAll('.languages li');
        const languagesFilterBox = document.getElementById('languages-filter-box');
    
        // Initially hide all languages except the first 6
        window.addEventListener('DOMContentLoaded', () => {
            languagesItems.forEach((item, index) => {
                if (index >= 6) {
                    item.style.display = 'none';
                }
            });
            languagesFilterBox.style.height = languagesFilterBox.scrollHeight + 'px';
        });
    
        languagesShowMore.addEventListener('click', () => {
            const hiddenLanguages = Array.from(languagesItems).filter((item, index) => index >= 6);
            const isExpanding = hiddenLanguages[0].style.display === 'none' || hiddenLanguages[0].style.display === '';
    
            hiddenLanguages.forEach(item => {
                item.style.display = isExpanding ? 'flex' : 'none';
            });
    
            // Adjust the filter box height
            languagesFilterBox.style.height = isExpanding ? languagesFilterBox.scrollHeight + 'px' : 'auto';
            languagesShowMore.textContent = isExpanding ? 'Show Less -' : 'Show More +';
        });
    </script>

    
    <script>
        const instructorsShowMore = document.getElementById('instructors-show-more');
        const instructorsItems = document.querySelectorAll('.instructors li');
        const instructorsFilterBox = document.getElementById('instructors-filter-box');
    
        // Initially hide all languages except the first 6
        window.addEventListener('DOMContentLoaded', () => {
            instructorsItems.forEach((item, index) => {
                if (index >= 6) {
                    item.style.display = 'none';
                }
            });
            instructorsFilterBox.style.height = instructorsFilterBox.scrollHeight + 'px';
        });
    
        instructorsShowMore.addEventListener('click', () => {
            const hiddenLanguages = Array.from(instructorsItems).filter((item, index) => index >= 6);
            const isExpanding = hiddenLanguages[0].style.display === 'none' || hiddenLanguages[0].style.display === '';
    
            hiddenLanguages.forEach(item => {
                item.style.display = isExpanding ? 'flex' : 'none';
            });
    
            // Adjust the filter box height
            instructorsFilterBox.style.height = isExpanding ? instructorsFilterBox.scrollHeight + 'px' : 'auto';
            instructorsShowMore.textContent = isExpanding ? 'Show Less -' : 'Show More +';
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make(getTemplate().'.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\spyberrys\resources\views/web/default/pages/classes.blade.php ENDPATH**/ ?>