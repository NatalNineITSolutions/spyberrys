

<?php $__env->startPush('styles_top'); ?>
    <link rel="stylesheet" href="/assets/default/vendors/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="/assets/default/vendors/owl-carousel2/owl.carousel.min.css">
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>

    <?php if(!empty($heroSectionData)): ?>

        

        <section class="slider-container  <?php echo e($heroSection == '2' ? 'slider-hero-section2' : ''); ?>"
            <?php if(empty($heroSectionData['is_video_background'])): ?>  <?php endif; ?>>

            

            <?php if($heroSection == '1'): ?>
                <?php if(!empty($heroSectionData['is_video_background'])): ?>
                    <video playsinline autoplay muted loop id="homeHeroVideoBackground" class="img-cover">
                        <source src="<?php echo e($heroSectionData['hero_background']); ?>" type="video/mp4">
                    </video>
                <?php endif; ?>

                <div class="mask"></div>
            <?php endif; ?>

            <div class="container user-select-none">

                <?php if($heroSection == '2'): ?>
                    <div class="d-flex flex-column slider-content align-items-center hero-section2">
                        
                        <h1 class="slide-text">Comprehensive <span>Cybersecurity</span> Strategies for Growth and Resilience
                        </h1>
                        <p class="slide-hint"><?php echo nl2br($heroSectionData['description']); ?></p>

                        
                        <div class="d-flex align-items-center" style="gap: 20px; margin-top:25px;">
                            <a href="#" class="started">Get Started</a>
                            <a href="#" class="reg">Register</a>
                        </div>

                        <div class="col-12 col-md-5 col-lg-6">
                            <?php if(!empty($heroSectionData['has_lottie']) and $heroSectionData['has_lottie'] == '1'): ?>
                                <lottie-player src="<?php echo e($heroSectionData['hero_vector']); ?>" background="transparent"
                                    speed="1" class="w-100" loop autoplay></lottie-player>
                            <?php else: ?>
                                <img src="<?php echo e($heroSectionData['hero_vector']); ?>" alt="<?php echo e($heroSectionData['title']); ?>"
                                    class="img-cover">
                            <?php endif; ?>
                        </div>
                    </div>
                <?php else: ?>
                    <div class="text-center slider-content">
                        <h1><?php echo e($heroSectionData['title']); ?></h1>
                        <div class="row h-100 align-items-center justify-content-center text-center">
                            <div class="col-12 col-md-9 col-lg-7">
                                <p class="mt-30 slide-hint"><?php echo nl2br($heroSectionData['description']); ?></p>

                                <form action="/search" method="get" class="d-inline-flex mt-30 mt-lg-50 w-100">
                                    <div class="form-group d-flex align-items-center m-0 slider-search p-10 bg-white w-100">
                                        <input type="text" name="search" class="form-control border-0 mr-lg-50"
                                            placeholder="<?php echo e(trans('home.slider_search_placeholder')); ?>" />
                                        <button type="submit"
                                            class="btn btn-primary rounded-pill"><?php echo e(trans('home.find')); ?></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                <?php endif; ?>
            </div>
        </section>


        
        <div class="carousel">
            <!-- slider 1 -->
            <div class="slider" style="--width: 150px; --height: 50px; --imageQuantity: 5">
                <div class="list">
                    <?php $__currentLoopData = $categoryData; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="item">
                            <a href="<?php echo e(route('categories.index', ['categoryTitle' => $category['slug']])); ?>">
                                <img src="<?php echo e($category['iconUrl']); ?>" alt="<?php echo e($category['slug']); ?> Icon" style="width: 100%;" />
                                <h4><?php echo e($category['title']); ?></h4>
                            </a>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <!-- Duplicate items for seamless looping -->
                    <?php $__currentLoopData = $categoryData; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="item">
                            <a href="<?php echo e(route('categories.index', ['categoryTitle' => $category['slug']])); ?>">
                                <img src="<?php echo e($category['iconUrl']); ?>" alt="<?php echo e($category['slug']); ?> Icon" style="width: 100%;" />
                                <h4><?php echo e($category['title']); ?></h4>
                            </a>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
            
            <!-- slider 2 -->
            <div class="slider" reverse="true" style="--width: 150px; --height: 50px; --imageQuantity: 5">
                <div class="list">
                    <?php $__currentLoopData = $categoryData; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="item">
                            <a href="<?php echo e(route('categories.index', ['categoryTitle' => $category['slug']])); ?>">
                                <img src="<?php echo e($category['iconUrl']); ?>" alt="<?php echo e($category['slug']); ?> Icon" style="width: 100%;" />
                                <h4><?php echo e($category['title']); ?></h4>
                            </a>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <!-- Duplicate items for seamless looping -->
                    <?php $__currentLoopData = $categoryData; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="item">
                            <a href="<?php echo e(route('categories.index', ['categoryTitle' => $category['slug']])); ?>">
                                <img src="<?php echo e($category['iconUrl']); ?>" alt="<?php echo e($category['slug']); ?> Icon" style="width: 100%;" />
                                <h4><?php echo e($category['title']); ?></h4>
                            </a>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
        </div>
    <?php endif; ?>

    
    <div class="counter">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-6 mt-3">
                    <div class="count">
                        <div class="image">
                            <img src="./assets/default/img/home/teacher.png" alt="">
                        </div>
                        <div class="num">
                            <h3 id="count1">100</h3>
                            <p>Skillfull Instructors</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-6 mt-3">
                    <div class="count">
                        <div class="image">
                            <img src="./assets/default/img/home/student.png" alt="">
                        </div>
                        <div class="num">
                            <h3 id="count2"></h3>
                            <p>Happy Students</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-6 mt-3">
                    <div class="count">
                        <div class="image">
                            <img src="./assets/default/img/home/video.png" alt="">
                        </div>
                        <div class="num">
                            <h3 id="count3">3+</h3>
                            <p>Live Classes</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-6 mt-3">
                    <div class="count">
                        <div class="image">
                            <img src="./assets/default/img/home/course.png" alt="">
                        </div>
                        <div class="num">
                            <h3 id="count4">100+</h3>
                            <p>Video Courses</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    <div class="container d-flex about-container">
        <div class="row about">
            <div class="col-lg-6 col-md-6 col-12">
                <div class="about-content">
                    <h4>About Spyberry</h4>
                    <p>"Spyberry is your gateway to knowledge, offering a wide range of eLearning courses tailored to your
                    needs. Whether you're looking to enhance your professional skills or pursue a personal passion, our
                    platform provides top-quality content from industry experts. Join a global community of learners and
                    take control of your education journey."</p>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
                <div class="about-image">
                    <img src="./assets/default/img/home/about.png" alt="">
                </div>
            </div>
        </div>
    </div>

    
    <div class="container d-flex goal-container">
        <div class="row goal">
            <div class="col-lg-6 col-md-6 col-12">
                <div class="goal-image">
                    <img src="/assets/default/img/home/goal.png" alt="">
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
                <div class="goal-content">
                    <h4>Spyberry's Main Goal</h4>
                    <p>"Our main goal at Spyberry is to empower individuals with the knowledge and skills they need to
                        succeed in their personal and professional lives. We strive to make high-quality education
                        accessible, flexible, and engaging for everyone, fostering lifelong learning and growth."</p>
                </div>
            </div>
        </div>
    </div>

    
    


    <?php $__currentLoopData = $homeSections; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $homeSection): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <?php if(
            $homeSection->name == \App\Models\HomeSection::$featured_classes and
                !empty($featureWebinars) and
                !$featureWebinars->isEmpty()): ?>
            <section class="home-sections home-sections-swiper container">
                <div class="px-20 px-md-0">
                    <h2 class="section-title"><?php echo e(trans('home.featured_classes')); ?></h2>
                    <p class="section-hint"><?php echo e(trans('home.featured_classes_hint')); ?></p>
                </div>

                <div class="feature-slider-container position-relative d-flex justify-content-center mt-10">
                    <div class="swiper-container features-swiper-container pb-25">
                        <div class="swiper-wrapper py-10">
                            <?php $__currentLoopData = $featureWebinars; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $feature): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="swiper-slide">
                                    <a href="<?php echo e($feature->webinar->getUrl()); ?>">
                                        <div class="feature-slider d-flex h-100"
                                            style="background-image: url('<?php echo e($feature->webinar->getImage()); ?>')">
                                            <div class="mask"></div>
                                            <div class="p-5 p-md-25 feature-slider-card">
                                                <div
                                                    class="d-flex flex-column feature-slider-body position-relative h-100">
                                                    <?php if($feature->webinar->bestTicket() < $feature->webinar->price): ?>
                                                        <span
                                                            class="badge badge-danger mb-2 "><?php echo e(trans('public.offer', ['off' => $feature->webinar->bestTicket(true)['percent']])); ?></span>
                                                    <?php endif; ?>
                                                    <a href="<?php echo e($feature->webinar->getUrl()); ?>">
                                                        <h3 class="card-title mt-1"><?php echo e($feature->webinar->title); ?></h3>
                                                    </a>

                                                    <div class="user-inline-avatar mt-15 d-flex align-items-center">
                                                        <div class="avatar bg-gray200">
                                                            <img src="<?php echo e($feature->webinar->teacher->getAvatar()); ?>"
                                                                class="img-cover"
                                                                alt="<?php echo e($feature->webinar->teacher->full_naem); ?>">
                                                        </div>
                                                        <a href="<?php echo e($feature->webinar->teacher->getProfileUrl()); ?>"
                                                            target="_blank"
                                                            class="user-name font-14 ml-5"><?php echo e($feature->webinar->teacher->full_name); ?></a>
                                                    </div>

                                                    <p class="mt-25 feature-desc text-gray"><?php echo e($feature->description); ?>

                                                    </p>

                                                    <?php echo $__env->make('web.default.includes.webinar.rate', [
                                                        'rate' => $feature->webinar->getRate(),
                                                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

                                                    <div
                                                        class="feature-footer mt-auto d-flex align-items-center justify-content-between">
                                                        <div class="d-flex justify-content-between">
                                                            <div class="d-flex align-items-center">
                                                                <i data-feather="clock" width="20" height="20"
                                                                    class="webinar-icon"></i>
                                                                <span
                                                                    class="duration ml-5 text-dark-blue font-14"><?php echo e(convertMinutesToHourAndMinute($feature->webinar->duration)); ?>

                                                                    <?php echo e(trans('home.hours')); ?></span>
                                                            </div>

                                                            <div class="vertical-line mx-10"></div>

                                                            <div class="d-flex align-items-center">
                                                                <i data-feather="calendar" width="20" height="20"
                                                                    class="webinar-icon"></i>
                                                                <span
                                                                    class="date-published ml-5 text-dark-blue font-14"><?php echo e(dateTimeFormat(!empty($feature->webinar->start_date) ? $feature->webinar->start_date : $feature->webinar->created_at, 'j M Y')); ?></span>
                                                            </div>
                                                        </div>

                                                        <div class="feature-price-box">
                                                            <?php if(!empty($feature->webinar->price) and $feature->webinar->price > 0): ?>
                                                                <?php if($feature->webinar->bestTicket() < $feature->webinar->price): ?>
                                                                    <span
                                                                        class="real"><?php echo e(handlePrice($feature->webinar->bestTicket(), true, true, false, null, true)); ?></span>
                                                                <?php else: ?>
                                                                    <?php echo e(handlePrice($feature->webinar->price, true, true, false, null, true)); ?>

                                                                <?php endif; ?>
                                                            <?php else: ?>
                                                                <?php echo e(trans('public.free')); ?>

                                                            <?php endif; ?>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    </div>

                    <div class="swiper-pagination features-swiper-pagination"></div>
                </div>
            </section>
        <?php endif; ?>

        <?php if(
            $homeSection->name == \App\Models\HomeSection::$latest_bundles and
                !empty($latestBundles) and
                !$latestBundles->isEmpty()): ?>
            <section class="home-sections home-sections-swiper container">
                <div class="d-flex justify-content-between ">
                    <div>
                        <h2 class="section-title"><?php echo e(trans('update.latest_bundles')); ?></h2>
                        <p class="section-hint"><?php echo e(trans('update.latest_bundles_hint')); ?></p>
                    </div>

                    <a href="/classes?type[]=bundle" class="btn btn-border-white"><?php echo e(trans('home.view_all')); ?></a>
                </div>

                <div class="mt-10 position-relative">
                    <div class="swiper-container latest-bundle-swiper px-12">
                        <div class="swiper-wrapper py-20">
                            <?php $__currentLoopData = $latestBundles; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $latestBundle): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="swiper-slide">
                                    <?php echo $__env->make('web.default.includes.webinar.grid-card', [
                                        'webinar' => $latestBundle,
                                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                        </div>
                    </div>

                    <div class="d-flex justify-content-center">
                        <div class="swiper-pagination bundle-webinars-swiper-pagination"></div>
                    </div>
                </div>
            </section>
        <?php endif; ?>

        
        <?php if(
            $homeSection->name == \App\Models\HomeSection::$upcoming_courses and
                !empty($upcomingCourses) and
                !$upcomingCourses->isEmpty()): ?>
            <section class="home-sections home-sections-swiper container">
                <div class="d-flex justify-content-between ">
                    <div>
                        <h2 class="section-title"><?php echo e(trans('update.upcoming_courses')); ?></h2>
                        <p class="section-hint"><?php echo e(trans('update.upcoming_courses_home_section_hint')); ?></p>
                    </div>

                    <a href="/upcoming_courses?sort=newest" class="btn btn-border-white"><?php echo e(trans('home.view_all')); ?></a>
                </div>

                <div class="mt-10 position-relative">
                    <div class="swiper-container upcoming-courses-swiper px-12">
                        <div class="swiper-wrapper py-20">
                            <?php $__currentLoopData = $upcomingCourses; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $upcomingCourse): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="swiper-slide">
                                    <?php echo $__env->make('web.default.includes.webinar.upcoming_course_grid_card', [
                                        'upcomingCourse' => $upcomingCourse,
                                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center">
                        <div class="swiper-pagination upcoming-courses-swiper-pagination"></div>
                    </div>
                </div>
            </section>
        <?php endif; ?>

        <?php if(
            $homeSection->name == \App\Models\HomeSection::$latest_classes and
                !empty($latestWebinars) and
                !$latestWebinars->isEmpty()): ?>
            <section class="home-sections home-sections-swiper container">
                <div class="d-flex justify-content-between ">
                    <div>
                        <h2 class="section-title"><?php echo e(trans('home.latest_classes')); ?></h2>
                        <p class="section-hint"><?php echo e(trans('home.latest_webinars_hint')); ?></p>
                    </div>

                    <a href="/classes?sort=newest" class="btn btn-border-white"><?php echo e(trans('home.view_all')); ?></a>
                </div>

                <div class="mt-10 position-relative">
                    <div class="swiper-container latest-webinars-swiper px-12">
                        <div class="swiper-wrapper py-20">
                            <?php $__currentLoopData = $latestWebinars; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $latestWebinar): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="swiper-slide">
                                    <?php echo $__env->make('web.default.includes.webinar.grid-card', [
                                        'webinar' => $latestWebinar,
                                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                        </div>
                    </div>

                    <div class="d-flex justify-content-center">
                        <div class="swiper-pagination latest-webinars-swiper-pagination"></div>
                    </div>
                </div>
            </section>
        <?php endif; ?>

        <?php if(
            $homeSection->name == \App\Models\HomeSection::$best_rates and
                !empty($bestRateWebinars) and
                !$bestRateWebinars->isEmpty()): ?>
            <section class="home-sections home-sections-swiper container">
                <div class="d-flex justify-content-between">
                    <div>
                        <h2 class="section-title"><?php echo e(trans('home.best_rates')); ?></h2>
                        <p class="section-hint"><?php echo e(trans('home.best_rates_hint')); ?></p>
                    </div>

                    <a href="/classes?sort=best_rates" class="btn btn-border-white"><?php echo e(trans('home.view_all')); ?></a>
                </div>

                <div class="mt-10 position-relative">
                    <div class="swiper-container best-rates-webinars-swiper px-12">
                        <div class="swiper-wrapper py-20">
                            <?php $__currentLoopData = $bestRateWebinars; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $bestRateWebinar): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="swiper-slide">
                                    <?php echo $__env->make('web.default.includes.webinar.grid-card', [
                                        'webinar' => $bestRateWebinar,
                                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center">
                        <div class="swiper-pagination best-rates-webinars-swiper-pagination"></div>
                    </div>
                </div>
            </section>
        <?php endif; ?>

        <?php if(
            $homeSection->name == \App\Models\HomeSection::$trend_categories and
                !empty($trendCategories) and
                !$trendCategories->isEmpty()): ?>
            <section class="home-sections home-sections-swiper container">
                <h2 class="section-title"><?php echo e(trans('home.trending_categories')); ?></h2>
                <p class="section-hint"><?php echo e(trans('home.trending_categories_hint')); ?></p>


                <div class="swiper-container trend-categories-swiper px-12 mt-40">
                    <div class="swiper-wrapper py-20">
                        <?php $__currentLoopData = $trendCategories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $trend): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <div class="swiper-slide">
                                <a href="<?php echo e($trend->category->getUrl()); ?>">
                                    <div class="trending-card d-flex flex-column align-items-center w-100">
                                        <div class="trending-image d-flex align-items-center justify-content-center w-100"
                                            style="background-color: <?php echo e($trend->color); ?>">
                                            <div class="icon mb-3">
                                                <img src="<?php echo e($trend->getIcon()); ?>" width="10" class="img-cover"
                                                    alt="<?php echo e($trend->category->title); ?>">
                                            </div>
                                        </div>

                                        <div class="item-count px-10 px-lg-20 py-5 py-lg-10">
                                            <?php echo e($trend->category->webinars_count); ?> <?php echo e(trans('product.course')); ?></div>

                                        <h3><?php echo e($trend->category->title); ?></h3>
                                    </div>
                                </a>
                            </div>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </div>
                </div>

                <div class="d-flex justify-content-center">
                    <div class="swiper-pagination trend-categories-swiper-pagination"></div>
                </div>
            </section>
        <?php endif; ?>

        
        <?php if(
            $homeSection->name == \App\Models\HomeSection::$full_advertising_banner and
                !empty($advertisingBanners1) and
                count($advertisingBanners1)): ?>
            <div class="home-sections container">
                <div class="row">
                    <?php $__currentLoopData = $advertisingBanners1; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $banner1): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="col-<?php echo e($banner1->size); ?>">
                            <a href="<?php echo e($banner1->link); ?>">
                                <img src="<?php echo e($banner1->image); ?>" class="img-cover rounded-sm"
                                    alt="<?php echo e($banner1->title); ?>">
                            </a>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
        <?php endif; ?>
        

        <?php if(
            $homeSection->name == \App\Models\HomeSection::$best_sellers and
                !empty($bestSaleWebinars) and
                !$bestSaleWebinars->isEmpty()): ?>
            <section class="home-sections container">
                <div class="d-flex justify-content-between">
                    <div>
                        <h2 class="section-title"><?php echo e(trans('home.best_sellers')); ?></h2>
                        <p class="section-hint"><?php echo e(trans('home.best_sellers_hint')); ?></p>
                    </div>

                    <a href="/classes?sort=bestsellers" class="btn btn-border-white"><?php echo e(trans('home.view_all')); ?></a>
                </div>

                <div class="mt-10 position-relative">
                    <div class="swiper-container best-sales-webinars-swiper px-12">
                        <div class="swiper-wrapper py-20">
                            <?php $__currentLoopData = $bestSaleWebinars; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $bestSaleWebinar): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="swiper-slide">
                                    <?php echo $__env->make('web.default.includes.webinar.grid-card', [
                                        'webinar' => $bestSaleWebinar,
                                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center">
                        <div class="swiper-pagination best-sales-webinars-swiper-pagination"></div>
                    </div>
                </div>
            </section>
        <?php endif; ?>

        <?php if(
            $homeSection->name == \App\Models\HomeSection::$discount_classes and
                !empty($hasDiscountWebinars) and
                !$hasDiscountWebinars->isEmpty()): ?>
            <section class="home-sections container">
                <div class="d-flex justify-content-between">
                    <div>
                        <h2 class="section-title"><?php echo e(trans('home.discount_classes')); ?></h2>
                        <p class="section-hint"><?php echo e(trans('home.discount_classes_hint')); ?></p>
                    </div>

                    <a href="/classes?discount=on" class="btn btn-border-white"><?php echo e(trans('home.view_all')); ?></a>
                </div>

                <div class="mt-10 position-relative">
                    <div class="swiper-container has-discount-webinars-swiper px-12">
                        <div class="swiper-wrapper py-20">
                            <?php $__currentLoopData = $hasDiscountWebinars; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $hasDiscountWebinar): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="swiper-slide">
                                    <?php echo $__env->make('web.default.includes.webinar.grid-card', [
                                        'webinar' => $hasDiscountWebinar,
                                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center">
                        <div class="swiper-pagination has-discount-webinars-swiper-pagination"></div>
                    </div>
                </div>
            </section>
        <?php endif; ?>

        <?php if(
            $homeSection->name == \App\Models\HomeSection::$free_classes and
                !empty($freeWebinars) and
                !$freeWebinars->isEmpty()): ?>
            <section class="home-sections home-sections-swiper container">
                <div class="d-flex justify-content-between">
                    <div>
                        <h2 class="section-title"><?php echo e(trans('home.free_classes')); ?></h2>
                        <p class="section-hint"><?php echo e(trans('home.free_classes_hint')); ?></p>
                    </div>

                    <a href="/classes?free=on" class="btn btn-border-white"><?php echo e(trans('home.view_all')); ?></a>
                </div>

                <div class="mt-10 position-relative">
                    <div class="swiper-container free-webinars-swiper px-12">
                        <div class="swiper-wrapper py-20">

                            <?php $__currentLoopData = $freeWebinars; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $freeWebinar): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="swiper-slide">
                                    <?php echo $__env->make('web.default.includes.webinar.grid-card', [
                                        'webinar' => $freeWebinar,
                                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                        </div>
                    </div>

                    <div class="d-flex justify-content-center">
                        <div class="swiper-pagination free-webinars-swiper-pagination"></div>
                    </div>
                </div>
            </section>
        <?php endif; ?>

        <?php if(
            $homeSection->name == \App\Models\HomeSection::$store_products and
                !empty($newProducts) and
                !$newProducts->isEmpty()): ?>
            <section class="home-sections home-sections-swiper container">
                <div class="d-flex justify-content-between">
                    <div>
                        <h2 class="section-title"><?php echo e(trans('update.store_products')); ?></h2>
                        <p class="section-hint"><?php echo e(trans('update.store_products_hint')); ?></p>
                    </div>

                    <a href="/products" class="btn btn-border-white"><?php echo e(trans('update.all_products')); ?></a>
                </div>

                <div class="mt-10 position-relative">
                    <div class="swiper-container new-products-swiper px-12">
                        <div class="swiper-wrapper py-20">

                            <?php $__currentLoopData = $newProducts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $newProduct): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="swiper-slide">
                                    <?php echo $__env->make('web.default.products.includes.card', [
                                        'product' => $newProduct,
                                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                        </div>
                    </div>

                    <div class="d-flex justify-content-center">
                        <div class="swiper-pagination new-products-swiper-pagination"></div>
                    </div>
                </div>
            </section>
        <?php endif; ?>

        <?php if(
            $homeSection->name == \App\Models\HomeSection::$testimonials and
                !empty($testimonials) and
                !$testimonials->isEmpty()): ?>
            <div class="position-relative home-sections testimonials-container">

                <div id="parallax1" class="ltr">
                    <div data-depth="0.2" class="gradient-box left-gradient-box"></div>
                </div>

                <section class="container home-sections home-sections-swiper">
                    <div class="text-center">
                        <h2 class="section-title"><?php echo e(trans('home.testimonials')); ?></h2>
                        <p class="section-hint"><?php echo e(trans('home.testimonials_hint')); ?></p>
                    </div>

                    <div class="position-relative">
                        <div class="swiper-container testimonials-swiper px-12">
                            <div class="swiper-wrapper">

                                <?php $__currentLoopData = $testimonials; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $testimonial): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <div class="swiper-slide">
                                        <div
                                            class="testimonials-card position-relative py-15 py-lg-30 px-10 px-lg-20 rounded-sm shadow bg-white text-center">
                                            <div class="d-flex flex-column align-items-center">
                                                <div class="testimonials-user-avatar">
                                                    <img src="<?php echo e($testimonial->user_avatar); ?>"
                                                        alt="<?php echo e($testimonial->user_name); ?>"
                                                        class="img-cover rounded-circle">
                                                </div>
                                                <h4 class="font-16 font-weight-bold text-secondary mt-30">
                                                    <?php echo e($testimonial->user_name); ?></h4>
                                                <span
                                                    class="d-block font-14 text-gray"><?php echo e($testimonial->user_bio); ?></span>
                                                <?php echo $__env->make('web.default.includes.webinar.rate', [
                                                    'rate' => $testimonial->rate,
                                                    'dontShowRate' => true,
                                                ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                            </div>

                                            <p class="mt-25 text-gray font-14"><?php echo nl2br($testimonial->comment); ?></p>

                                            <div class="bottom-gradient"></div>
                                        </div>
                                    </div>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>

                        </div>

                        <div class="d-flex justify-content-center">
                            <div class="swiper-pagination testimonials-swiper-pagination"></div>
                        </div>
                    </div>
                </section>

                <div id="parallax2" class="ltr">
                    <div data-depth="0.4" class="gradient-box right-gradient-box"></div>
                </div>

                <div id="parallax3" class="ltr">
                    <div data-depth="0.8" class="gradient-box bottom-gradient-box"></div>
                </div>
            </div>
        <?php endif; ?>

        <?php if($homeSection->name == \App\Models\HomeSection::$subscribes and !empty($subscribes) and !$subscribes->isEmpty()): ?>
            <div class="home-sections position-relative subscribes-container pe-none user-select-none">
                <div id="parallax4" class="ltr d-none d-md-block">
                    <div data-depth="0.2" class="gradient-box left-gradient-box"></div>
                </div>

                <section class="container home-sections home-sections-swiper">
                    <div class="text-center">
                        <h2 class="section-title"><?php echo e(trans('home.subscribe_now')); ?></h2>
                        <p class="section-hint"><?php echo e(trans('home.subscribe_now_hint')); ?></p>
                    </div>

                    <div class="position-relative mt-30">
                        <div class="swiper-container subscribes-swiper px-12">
                            <div class="swiper-wrapper py-20">

                                <?php $__currentLoopData = $subscribes; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $subscribe): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php
                                        $subscribeSpecialOffer = $subscribe->activeSpecialOffer();
                                    ?>

                                    <div class="swiper-slide">
                                        <div
                                            class="subscribe-plan position-relative bg-white d-flex flex-column align-items-center rounded-sm shadow pt-50 pb-20 px-20">
                                            <?php if($subscribe->is_popular): ?>
                                                <span
                                                    class="badge badge-primary badge-popular px-15 py-5"><?php echo e(trans('panel.popular')); ?></span>
                                            <?php elseif(!empty($subscribeSpecialOffer)): ?>
                                                <span
                                                    class="badge badge-danger badge-popular px-15 py-5"><?php echo e(trans('update.percent_off', ['percent' => $subscribeSpecialOffer->percent])); ?></span>
                                            <?php endif; ?>

                                            <div class="plan-icon">
                                                <img src="<?php echo e($subscribe->icon); ?>" class="img-cover" alt="">
                                            </div>

                                            <h3 class="mt-20 font-30 text-secondary"><?php echo e($subscribe->title); ?></h3>
                                            <p class="font-weight-500 text-gray mt-10"><?php echo e($subscribe->description); ?></p>

                                            <div class="d-flex align-items-start mt-30">
                                                <?php if(!empty($subscribe->price) and $subscribe->price > 0): ?>
                                                    <?php if(!empty($subscribeSpecialOffer)): ?>
                                                        <div class="d-flex align-items-end line-height-1">
                                                            <span
                                                                class="font-36 text-primary"><?php echo e(handlePrice($subscribe->getPrice(), true, true, false, null, true)); ?></span>
                                                            <span
                                                                class="font-14 text-gray ml-5 text-decoration-line-through"><?php echo e(handlePrice($subscribe->price, true, true, false, null, true)); ?></span>
                                                        </div>
                                                    <?php else: ?>
                                                        <span
                                                            class="font-36 text-primary line-height-1"><?php echo e(handlePrice($subscribe->price, true, true, false, null, true)); ?></span>
                                                    <?php endif; ?>
                                                <?php else: ?>
                                                    <span
                                                        class="font-36 text-primary line-height-1"><?php echo e(trans('public.free')); ?></span>
                                                <?php endif; ?>
                                            </div>

                                            <ul class="mt-20 plan-feature">
                                                <li class="mt-10"><?php echo e($subscribe->days); ?>

                                                    <?php echo e(trans('financial.days_of_subscription')); ?></li>
                                                <li class="mt-10">
                                                    <?php if($subscribe->infinite_use): ?>
                                                        <?php echo e(trans('update.unlimited')); ?>

                                                    <?php else: ?>
                                                        <?php echo e($subscribe->usable_count); ?>

                                                    <?php endif; ?>
                                                    <span class="ml-5"><?php echo e(trans('update.subscribes')); ?></span>
                                                </li>
                                            </ul>

                                            <?php if(auth()->check()): ?>
                                                <form action="/panel/financial/pay-subscribes" method="post"
                                                    class="w-100">
                                                    <?php echo e(csrf_field()); ?>

                                                    <input name="amount" value="<?php echo e($subscribe->price); ?>"
                                                        type="hidden">
                                                    <input name="id" value="<?php echo e($subscribe->id); ?>" type="hidden">

                                                    <div class="d-flex align-items-center mt-50 w-100">
                                                        <button type="submit"
                                                            class="btn btn-primary <?php echo e(!empty($subscribe->has_installment) ? '' : 'btn-block'); ?>"><?php echo e(trans('update.purchase')); ?></button>

                                                        <?php if(!empty($subscribe->has_installment)): ?>
                                                            <a href="/panel/financial/subscribes/<?php echo e($subscribe->id); ?>/installments"
                                                                class="btn btn-outline-primary flex-grow-1 ml-10"><?php echo e(trans('update.installments')); ?></a>
                                                        <?php endif; ?>
                                                    </div>
                                                </form>
                                            <?php else: ?>
                                                <a href="/login"
                                                    class="btn btn-primary btn-block mt-50"><?php echo e(trans('update.purchase')); ?></a>
                                            <?php endif; ?>
                                        </div>
                                    </div>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>

                        </div>
                        <div class="d-flex justify-content-center">
                            <div class="swiper-pagination subscribes-swiper-pagination"></div>
                        </div>

                    </div>
                </section>

                <div id="parallax5" class="ltr d-none d-md-block">
                    <div data-depth="0.4" class="gradient-box right-gradient-box"></div>
                </div>

                <div id="parallax6" class="ltr d-none d-md-block">
                    <div data-depth="0.6" class="gradient-box bottom-gradient-box"></div>
                </div>
            </div>
        <?php endif; ?>

        <?php if($homeSection->name == \App\Models\HomeSection::$find_instructors and !empty($findInstructorSection)): ?>
            <section class="home-sections home-sections-swiper container find-instructor-section position-relative">
                <div class="row align-items-center">
                    <div class="col-12 col-lg-6">
                        <div class="">
                            <h2 class="font-36 font-weight-bold text-dark"><?php echo e($findInstructorSection['title'] ?? ''); ?>

                            </h2>
                            <p class="font-16 font-weight-normal text-gray mt-10">
                                <?php echo e($findInstructorSection['description'] ?? ''); ?></p>

                            <div class="mt-35 d-flex align-items-center">
                                <?php if(
                                    !empty($findInstructorSection['button1']) and
                                        !empty($findInstructorSection['button1']['title']) and
                                        !empty($findInstructorSection['button1']['link'])): ?>
                                    <a href="<?php echo e($findInstructorSection['button1']['link']); ?>"
                                        class="btn btn-primary mr-15"><?php echo e($findInstructorSection['button1']['title']); ?></a>
                                <?php endif; ?>

                                <?php if(
                                    !empty($findInstructorSection['button2']) and
                                        !empty($findInstructorSection['button2']['title']) and
                                        !empty($findInstructorSection['button2']['link'])): ?>
                                    <a href="<?php echo e($findInstructorSection['button2']['link']); ?>"
                                        class="btn btn-outline-primary"><?php echo e($findInstructorSection['button2']['title']); ?></a>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-lg-6 mt-20 mt-lg-0">
                        <div class="position-relative ">
                            <img src="<?php echo e($findInstructorSection['image']); ?>" class="find-instructor-section-hero"
                                alt="<?php echo e($findInstructorSection['title']); ?>">
                            <img src="/assets/default/img/home/circle-4.png" class="find-instructor-section-circle"
                                alt="circle">
                            <img src="/assets/default/img/home/dot.png" class="find-instructor-section-dots"
                                alt="dots">

                            <div
                                class="example-instructor-card bg-white rounded-sm shadow-lg  p-5 p-md-15 d-flex align-items-center">
                                <div class="example-instructor-card-avatar">
                                    <img src="/assets/default/img/home/toutor_finder.svg" class="img-cover rounded-circle"
                                        alt="user name">
                                </div>

                                <div class="flex-grow-1 ml-15">
                                    <span
                                        class="font-14 font-weight-bold text-secondary d-block"><?php echo e(trans('update.looking_for_an_instructor')); ?></span>
                                    <span
                                        class="text-gray font-12 font-weight-500"><?php echo e(trans('update.find_the_best_instructor_now')); ?></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        <?php endif; ?>

        <?php if($homeSection->name == \App\Models\HomeSection::$reward_program and !empty($rewardProgramSection)): ?>
            <section class="home-sections home-sections-swiper container reward-program-section position-relative">
                <div class="row align-items-center">
                    <div class="col-12 col-lg-6">
                        <div class="position-relative reward-program-section-hero-card">
                            <img src="<?php echo e($rewardProgramSection['image']); ?>" class="reward-program-section-hero"
                                alt="<?php echo e($rewardProgramSection['title']); ?>">

                            <div
                                class="example-reward-card bg-white rounded-sm shadow-lg p-5 p-md-15 d-flex align-items-center">
                                <div class="example-reward-card-medal">
                                    <img src="/assets/default/img/rewards/medal.png" class="img-cover rounded-circle"
                                        alt="medal">
                                </div>

                                <div class="flex-grow-1 ml-15">
                                    <span
                                        class="font-14 font-weight-bold text-secondary d-block"><?php echo e(trans('update.you_got_50_points')); ?></span>
                                    <span
                                        class="text-gray font-12 font-weight-500"><?php echo e(trans('update.for_completing_the_course')); ?></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-lg-6 mt-20 mt-lg-0">
                        <div class="">
                            <h2 class="font-36 font-weight-bold text-dark"><?php echo e($rewardProgramSection['title'] ?? ''); ?>

                            </h2>
                            <p class="font-16 font-weight-normal text-gray mt-10">
                                <?php echo e($rewardProgramSection['description'] ?? ''); ?></p>

                            <div class="mt-35 d-flex align-items-center">
                                <?php if(
                                    !empty($rewardProgramSection['button1']) and
                                        !empty($rewardProgramSection['button1']['title']) and
                                        !empty($rewardProgramSection['button1']['link'])): ?>
                                    <a href="<?php echo e($rewardProgramSection['button1']['link']); ?>"
                                        class="btn btn-primary mr-15"><?php echo e($rewardProgramSection['button1']['title']); ?></a>
                                <?php endif; ?>

                                <?php if(
                                    !empty($rewardProgramSection['button2']) and
                                        !empty($rewardProgramSection['button2']['title']) and
                                        !empty($rewardProgramSection['button2']['link'])): ?>
                                    <a href="<?php echo e($rewardProgramSection['button2']['link']); ?>"
                                        class="btn btn-outline-primary"><?php echo e($rewardProgramSection['button2']['title']); ?></a>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        <?php endif; ?>

        <?php if($homeSection->name == \App\Models\HomeSection::$become_instructor and !empty($becomeInstructorSection)): ?>
            <section class="home-sections home-sections-swiper container find-instructor-section position-relative">
                <div class="row align-items-center">
                    <div class="col-12 col-lg-6">
                        <div class="">
                            <h2 class="font-36 font-weight-bold text-dark"><?php echo e($becomeInstructorSection['title'] ?? ''); ?>

                            </h2>
                            <p class="font-16 font-weight-normal text-gray mt-10">
                                <?php echo e($becomeInstructorSection['description'] ?? ''); ?></p>

                            <div class="mt-35 d-flex align-items-center">
                                <?php if(
                                    !empty($becomeInstructorSection['button1']) and
                                        !empty($becomeInstructorSection['button1']['title']) and
                                        !empty($becomeInstructorSection['button1']['link'])): ?>
                                    <a href="<?php echo e(empty($authUser) ? '/login' : ($authUser->isUser() ? $becomeInstructorSection['button1']['link'] : '/panel/financial/registration-packages')); ?>"
                                        class="btn btn-primary mr-15"><?php echo e($becomeInstructorSection['button1']['title']); ?></a>
                                <?php endif; ?>

                                <?php if(
                                    !empty($becomeInstructorSection['button2']) and
                                        !empty($becomeInstructorSection['button2']['title']) and
                                        !empty($becomeInstructorSection['button2']['link'])): ?>
                                    <a href="<?php echo e(empty($authUser) ? '/login' : ($authUser->isUser() ? $becomeInstructorSection['button2']['link'] : '/panel/financial/registration-packages')); ?>"
                                        class="btn btn-outline-primary"><?php echo e($becomeInstructorSection['button2']['title']); ?></a>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-lg-6 mt-20 mt-lg-0">
                        <div class="position-relative ">
                            <img src="<?php echo e($becomeInstructorSection['image']); ?>" class="find-instructor-section-hero"
                                alt="<?php echo e($becomeInstructorSection['title']); ?>">
                            <img src="/assets/default/img/home/circle-4.png" class="find-instructor-section-circle"
                                alt="circle">
                            <img src="/assets/default/img/home/dot.png" class="find-instructor-section-dots"
                                alt="dots">

                            <div
                                class="example-instructor-card bg-white rounded-sm shadow-lg border p-5 p-md-15 d-flex align-items-center">
                                <div class="example-instructor-card-avatar">
                                    <img src="/assets/default/img/home/become_instructor.svg"
                                        class="img-cover rounded-circle" alt="user name">
                                </div>

                                <div class="flex-grow-1 ml-15">
                                    <span
                                        class="font-14 font-weight-bold text-secondary d-block"><?php echo e(trans('update.become_an_instructor')); ?></span>
                                    <span
                                        class="text-gray font-12 font-weight-500"><?php echo e(trans('update.become_instructor_tagline')); ?></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        <?php endif; ?>

        <?php if($homeSection->name == \App\Models\HomeSection::$forum_section and !empty($forumSection)): ?>
            <section class="home-sections home-sections-swiper container find-instructor-section position-relative">
                <div class="row align-items-center">
                    <div class="col-12 col-lg-6 mt-20 mt-lg-0">
                        <div class="position-relative ">
                            <img src="<?php echo e($forumSection['image']); ?>" class="find-instructor-section-hero"
                                alt="<?php echo e($forumSection['title']); ?>">
                            <img src="/assets/default/img/home/circle-4.png" class="find-instructor-section-circle"
                                alt="circle">
                            <img src="/assets/default/img/home/dot.png" class="find-instructor-section-dots"
                                alt="dots">
                        </div>
                    </div>

                    <div class="col-12 col-lg-6">
                        <div class="">
                            <h2 class="font-36 font-weight-bold text-dark"><?php echo e($forumSection['title'] ?? ''); ?></h2>
                            <p class="font-16 font-weight-normal text-gray mt-10">
                                <?php echo e($forumSection['description'] ?? ''); ?></p>

                            <div class="mt-35 d-flex align-items-center">
                                <?php if(
                                    !empty($forumSection['button1']) and
                                        !empty($forumSection['button1']['title']) and
                                        !empty($forumSection['button1']['link'])): ?>
                                    <a href="<?php echo e($forumSection['button1']['link']); ?>"
                                        class="btn btn-primary mr-15"><?php echo e($forumSection['button1']['title']); ?></a>
                                <?php endif; ?>

                                <?php if(
                                    !empty($forumSection['button2']) and
                                        !empty($forumSection['button2']['title']) and
                                        !empty($forumSection['button2']['link'])): ?>
                                    <a href="<?php echo e($forumSection['button2']['link']); ?>"
                                        class="btn btn-outline-primary"><?php echo e($forumSection['button2']['title']); ?></a>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        <?php endif; ?>

        <?php if($homeSection->name == \App\Models\HomeSection::$video_or_image_section and !empty($boxVideoOrImage)): ?>
            <section class="home-sections home-sections-swiper position-relative">
                <div class="home-video-mask"></div>
                <div class="container home-video-container d-flex flex-column align-items-center justify-content-center position-relative"
                    style="background-image: url('<?php echo e($boxVideoOrImage['background'] ?? ''); ?>')">
                    <a href="<?php echo e($boxVideoOrImage['link'] ?? ''); ?>"
                        class="home-video-play-button d-flex align-items-center justify-content-center position-relative">
                        <i data-feather="play" width="36" height="36" class=""></i>
                    </a>

                    <div class="mt-50 pt-10 text-center">
                        <h2 class="home-video-title"><?php echo e($boxVideoOrImage['title'] ?? ''); ?></h2>
                        <p class="home-video-hint mt-10"><?php echo e($boxVideoOrImage['description'] ?? ''); ?></p>
                    </div>
                </div>
            </section>
        <?php endif; ?>

        <?php if($homeSection->name == \App\Models\HomeSection::$instructors and !empty($instructors) and !$instructors->isEmpty()): ?>
            <section class="home-sections container">
                <div class="d-flex justify-content-between">
                    <div>
                        <h2 class="section-title"><?php echo e(trans('home.instructors')); ?></h2>
                        <p class="section-hint"><?php echo e(trans('home.instructors_hint')); ?></p>
                    </div>

                    <a href="/instructors" class="btn btn-border-white"><?php echo e(trans('home.all_instructors')); ?></a>
                </div>

                <div class="position-relative mt-20 ltr">
                    <div class="owl-carousel customers-testimonials instructors-swiper-container">

                        <?php $__currentLoopData = $instructors; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $instructor): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <div class="item">
                                <div class="shadow-effect">
                                    <div
                                        class="instructors-card d-flex flex-column align-items-center justify-content-center">
                                        <div class="instructors-card-avatar">
                                            <img src="<?php echo e($instructor->getAvatar(108)); ?>"
                                                alt="<?php echo e($instructor->full_name); ?>" class="rounded-circle img-cover">
                                        </div>
                                        <div class="instructors-card-info mt-10 text-center">
                                            <a href="<?php echo e($instructor->getProfileUrl()); ?>" target="_blank">
                                                <h3 class="font-16 font-weight-bold text-dark-blue">
                                                    <?php echo e($instructor->full_name); ?></h3>
                                            </a>

                                            <p class="font-14 text-gray mt-5"><?php echo e($instructor->bio); ?></p>
                                            <div class="stars-card d-flex align-items-center justify-content-center mt-10">
                                                <?php
                                                    $i = 5;
                                                ?>
                                                <?php while(--$i >= 5 - $instructor->rates()): ?>
                                                    <i data-feather="star" width="20" height="20"
                                                        class="active"></i>
                                                <?php endwhile; ?>
                                                <?php while($i-- >= 0): ?>
                                                    <i data-feather="star" width="20" height="20"
                                                        class=""></i>
                                                <?php endwhile; ?>
                                            </div>

                                            <?php if(!empty($instructor->hasMeeting())): ?>
                                                <a href="<?php echo e($instructor->getProfileUrl()); ?>?tab=appointments"
                                                    class="btn btn-primary btn-sm rounded-pill mt-15"><?php echo e(trans('home.reserve_a_live_class')); ?></a>
                                            <?php else: ?>
                                                <a href="<?php echo e($instructor->getProfileUrl()); ?>"
                                                    class="btn btn-primary btn-sm rounded-pill mt-15"><?php echo e(trans('public.profile')); ?></a>
                                            <?php endif; ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                    </div>
                </div>
            </section>
        <?php endif; ?>

        
        <?php if(
            $homeSection->name == \App\Models\HomeSection::$half_advertising_banner and
                !empty($advertisingBanners2) and
                count($advertisingBanners2)): ?>
            <div class="home-sections container">
                <div class="row">
                    <?php $__currentLoopData = $advertisingBanners2; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $banner2): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="col-<?php echo e($banner2->size); ?>">
                            <a href="<?php echo e($banner2->link); ?>">
                                <img src="<?php echo e($banner2->image); ?>" class="img-cover rounded-sm"
                                    alt="<?php echo e($banner2->title); ?>">
                            </a>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
        <?php endif; ?>
        

        <?php if(
            $homeSection->name == \App\Models\HomeSection::$organizations and
                !empty($organizations) and
                !$organizations->isEmpty()): ?>
            <section class="home-sections home-sections-swiper container">
                <div class="d-flex justify-content-between">
                    <div>
                        <h2 class="section-title"><?php echo e(trans('home.organizations')); ?></h2>
                        <p class="section-hint"><?php echo e(trans('home.organizations_hint')); ?></p>
                    </div>

                    <a href="/organizations" class="btn btn-border-white"><?php echo e(trans('home.all_organizations')); ?></a>
                </div>

                <div class="position-relative mt-20">
                    <div class="swiper-container organization-swiper-container px-12">
                        <div class="swiper-wrapper py-20">

                            <?php $__currentLoopData = $organizations; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $organization): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="swiper-slide">
                                    <div
                                        class="home-organizations-card d-flex flex-column align-items-center justify-content-center">
                                        <div class="home-organizations-avatar">
                                            <img src="<?php echo e($organization->getAvatar(120)); ?>"
                                                class="img-cover rounded-circle" alt="<?php echo e($organization->full_name); ?>">
                                        </div>
                                        <a href="<?php echo e($organization->getProfileUrl()); ?>"
                                            class="mt-25 d-flex flex-column align-items-center justify-content-center">
                                            <h3 class="home-organizations-title"><?php echo e($organization->full_name); ?></h3>
                                            <p class="home-organizations-desc mt-10"><?php echo e($organization->bio); ?></p>
                                            <span
                                                class="home-organizations-badge badge mt-15"><?php echo e($organization->webinars_count); ?>

                                                <?php echo e(trans('panel.classes')); ?></span>
                                        </a>
                                    </div>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center">
                        <div class="swiper-pagination organization-swiper-pagination"></div>
                    </div>
                </div>
            </section>
        <?php endif; ?>

        <?php if($homeSection->name == \App\Models\HomeSection::$blog and !empty($blog) and !$blog->isEmpty()): ?>
            <section class="home-sections container">
                <div class="d-flex justify-content-between">
                    <div>
                        <h2 class="section-title"><?php echo e(trans('home.blog')); ?></h2>
                        <p class="section-hint"><?php echo e(trans('home.blog_hint')); ?></p>
                    </div>

                    <a href="/blog" class="btn btn-border-white"><?php echo e(trans('home.all_blog')); ?></a>
                </div>

                <div class="row mt-35">

                    <?php $__currentLoopData = $blog; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $post): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="col-12 col-md-4 col-lg-4 mt-20 mt-lg-0">
                            <?php echo $__env->make('web.default.blog.grid-list', ['post' => $post], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                </div>
            </section>
        <?php endif; ?>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

    
    <div class="trending-courses">
        <h3>Our Trending Courses</h3>
        <h4>Our Best Courses Offered and Teach By Best of The Instructors</h4>
        <div class="container course-container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-12 mt-3">
                    <div class="trending-course-box">
                        <img class="course-image" src="/assets/default/img/home/course-image-1.png" alt="img">
                        <div class="trending-course-box-content">
                            <div class="title">
                                <h4>Basics of JAVA</h4>
                                <p class="level">Beginner Level</p>
                            </div>
                            <p class="trending-course-content">Java is a class-based object-oriented simple programming
                                language. Though we can not consider it to be fully ... </p>
                            <h4 class="price">₹200</h4>
                            <div class="buttons">
                                <a href="#" class="view-course">View Course</a>
                                <div class="shop-bag">
                                    <img src="/assets/default/img/home/shop-bag.png" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="wishlist">
                            <img src="./assets/default/img/home/heart.png" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-12 mt-3">
                    <div class="trending-course-box">
                        <img class="course-image" src="/assets/default/img/home/course-image-2.png" alt="img">
                        <div class="trending-course-box-content">
                            <div class="title">
                                <h4>OOP Fundamentals</h4>
                                <p class="level">Beginner Level</p>
                            </div>
                            <p class="trending-course-content">Java is a class-based object-oriented simple programming
                                language. Though we can not consider it to be fully ... </p>
                            <h4 class="price">₹200</h4>
                            <div class="buttons">
                                <a href="#" class="view-course">View Course</a>
                                <div class="shop-bag">
                                    <img src="/assets/default/img/home/shop-bag.png" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="wishlist">
                            <img src="./assets/default/img/home/heart.png" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-12 mt-3">
                    <div class="trending-course-box">
                        <img class="course-image" src="/assets/default/img/home/course-image-3.png" alt="img">
                        <div class="trending-course-box-content">
                            <div class="title">
                                <h4>Intro to UI/UX</h4>
                                <p class="level">Beginner Level</p>
                            </div>
                            <p class="trending-course-content">Java is a class-based object-oriented simple programming
                                language. Though we can not consider it to be fully ... </p>
                            <h4 class="price">₹200</h4>
                            <div class="buttons">
                                <a href="#" class="view-course">View Course</a>
                                <div class="shop-bag">
                                    <img src="/assets/default/img/home/shop-bag.png" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="wishlist">
                            <img src="./assets/default/img/home/heart.png" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-12 mt-3">
                    <div class="trending-course-box">
                        <img class="course-image" src="/assets/default/img/home/course-image-4.png" alt="img">
                        <div class="trending-course-box-content">
                            <div class="title">
                                <h4>UI Certification</h4>
                                <p class="level">Beginner Level</p>
                            </div>
                            <p class="trending-course-content">Java is a class-based object-oriented simple programming
                                language. Though we can not consider it to be fully ... </p>
                            <h4 class="price">₹200</h4>
                            <div class="buttons">
                                <a href="#" class="view-course">View Course</a>
                                <div class="shop-bag">
                                    <img src="/assets/default/img/home/shop-bag.png" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="wishlist">
                            <img src="./assets/default/img/home/heart.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="view-courses">
                <p>View All Courses</p>
                <p class="line"></p>
                <a href="#" class="all-course">
                    <p>All Courses</p>
                    <i class="fa-solid fa-arrow-right"></i>
                </a>
            </div>
        </div>
    </div>

    
    <div class="container benefits-container">
        <h3>Our Benefits</h3>
        <h4>By Joining eLearning Platform, One Can Avail a Lot Of Benefits.</h4>
        <div class="row benefits">
            <div class="col-lg-4 col-md-6 col-12 mt-3">
                <div class="benefits-box blue">
                    <h3>01</h3>
                    <h4>Standardization</h4>
                    <p>ust like learners aren’t one-size-fits-all, learning is not a one-size-fits-all experience. By using different ...<span><a href="#">Read More</a></span></p>
                    <img class="ellipse-one" src="./assets/default/img/home/ellipse-1.png" alt="">
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-12 mt-3">
                <div class="benefits-box">
                    <h3>02</h3>
                    <h4>Reduced Costs</h4>
                    <p>ust like learners aren’t one-size-fits-all, learning is not a one-size-fits-all experience. By using different ...<span><a href="#">Read More</a></span></p>
                    <img class="ellipse-two" src="./assets/default/img/home/ellipse-2.png" alt="">
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-12 mt-3">
                <div class="benefits-box blue">
                    <h3>03</h3>
                    <h4>More Customization</h4>
                    <p>ust like learners aren’t one-size-fits-all, learning is not a one-size-fits-all experience. By using
                        different ...<span><a href="#">Read More</a></span></p>
                    <img class="ellipse-one" src="./assets/default/img/home/ellipse-1.png" alt="">
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-12 mt-3">
                <div class="benefits-box">
                    <h3>04</h3>
                    <h4>Reduced Costs</h4>
                    <p>With eLearning, there’s no cost to reproduce materials and, thanks to mobile learning, learners can
                        ...<span><a href="#">Read More</a></span></p>
                    <img class="ellipse-two" src="./assets/default/img/home/ellipse-2.png" alt="">
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-12 mt-3">
                <div class="benefits-box blue">
                    <h3>05</h3>
                    <h4>Learner Satisfaction</h4>
                    <p>If you really want students to retain what they learn, you’ll need to aim for high satisfaction
                        rates...<span><a href="#">Read More</a></span></p>
                    <img class="ellipse-one" src="./assets/default/img/home/ellipse-1.png" alt="">
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-12 mt-3">
                <div class="benefits-box">
                    <h3>06</h3>
                    <h4>Multimedia Materials</h4>
                    <p>One of the main reasons why custom eLearning is effective is that it’s the perfect delivery method
                        for ...<span><a href="#">Read More</a></span></p>
                    <img class="ellipse-two" src="./assets/default/img/home/ellipse-2.png" alt="">
                </div>
            </div>
        </div>
        <div class="view-features">
            <p>View All Features</p>
            <p class="line"></p>
            <a href="#" class="all-feature">
                <p>All Features</p>
                <i class="fa-solid fa-arrow-right"></i>
            </a>
        </div>
    </div>

    
    <div class="mentor">
        <h3>Mentor</h3>
        <h4>Our Top Mentor At Spyberrys</h4>
        <div class="container">
            <div class="row mentors">
                <div class="col-lg-4 col-md-4 col-12">
                    <div class="mentor-box">
                        <img src="/assets/default/img/home/ment-1.png" alt="">
                        <div class="mentor-box-content">
                            <h4>Rizqi Assegaf</h4>
                            <p>SD-SMA Mentor</p>
                            <div class="exp">
                                <img src="./assets/default/img/home/clock.png" alt="">
                                <p>7 Years</p>
                            </div>
                            <div class="rating">
                                <div class="star" id="star-container"></div>
                                <p class="num mb-0">(200)</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-12">
                    <div class="mentor-box">
                        <img src="/assets/default/img/home/ment-2.png" alt="">
                        <div class="mentor-box-content">
                            <h4>Rifky Surya</h4>
                            <p>SD-SMA Mentor</p>
                            <div class="exp">
                                <img src="./assets/default/img/home/clock.png" alt="">
                                <p>10 Years</p>
                            </div>
                            <div class="rating">
                                <div class="star" id="star-container"></div>
                                <p class="num mb-0">(200)</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-12">
                    <div class="mentor-box">
                        <img src="/assets/default/img/home/ment-3.png" alt="">
                        <div class="mentor-box-content">
                            <h4>Louis Cahya</h4>
                            <p>SD-SMA Mentor</p>
                            <div class="exp">
                                <img src="./assets/default/img/home/clock.png" alt="">
                                <p>5 Years</p>
                            </div>
                            <div class="rating">
                                <div class="star" id="star-container"></div>
                                <p class="num mb-0">(200)</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    <div class="container faq-container">
        <h3>FAQs</h3>
        <h4>Frequently Asked Questions</h4>
        <div class="row">
            <div class="col-ld-6 col-md-6 col-12 mt-3">
                <div class="faq-box">
                    <h4>What is dropshipping?</h4>
                    <p>Over 350,000 online businesses and entrepreneurs have used Modalyst. It's the easiest way to find the
                        best print on demand companies</p>
                </div>
            </div>
            <div class="col-ld-6 col-md-6 col-12 mt-3">
                <div class="faq-box">
                    <h4>What is refund policy?</h4>
                    <p>Over 350,000 online businesses and entrepreneurs have used Modalyst. It's the easiest way to find the
                        best print on demand companies</p>
                </div>
            </div>
            <div class="col-ld-6 col-md-6 col-12 mt-3">
                <div class="faq-box">
                    <h4>Who are your suppliers?</h4>
                    <p>Over 350,000 online businesses and entrepreneurs have used Modalyst. It's the easiest way to find the
                        best print on demand companies</p>
                </div>
            </div>
            <div class="col-ld-6 col-md-6 col-12 mt-3">
                <div class="faq-box">
                    <h4>Why choose us?</h4>
                    <p>Over 350,000 online businesses and entrepreneurs have used Modalyst. It's the easiest way to find the
                        best print on demand companies</p>
                </div>
            </div>
            <div class="col-ld-6 col-md-6 col-12 mt-3">
                <div class="faq-box">
                    <h4>What is the shipping cost?</h4>
                    <p>Over 350,000 online businesses and entrepreneurs have used Modalyst. It's the easiest way to find the
                        best print on demand companies</p>
                </div>
            </div>
            <div class="col-ld-6 col-md-6 col-12 mt-3">
                <div class="faq-box">
                    <h4>What is dropshipping?</h4>
                    <p>Over 350,000 online businesses and entrepreneurs have used Modalyst. It's the easiest way to find the
                        best print on demand companies</p>
                </div>
            </div>
        </div>
    </div>

    
    <div class="testimonial-container">
        <div class="container">
            <h3>Testimonial</h3>
            <h4>Student Testimonial</h4>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-12">
                    <div class="testimonial-box">
                        <div class="details">
                            <img src="./assets/default/img/home/testi-1.png" alt="">
                            <div class="user-details">
                                <h5>Michael Wong</h5>
                                <p>UI/UX Design Student</p>
                                <div class="user-rating">
                                    <i class="fa-solid fa-star"></i>
                                    <p>4.9</p>
                                </div>
                            </div>
                        </div>
                        <div class="desp">
                            <p>Empower yourself with the knowledge and skills gained through online education! Empower yourself with the knowledge and skills gained through online education!</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-12">
                    <div class="testimonial-box">
                        <div class="details">
                            <img src="./assets/default/img/home/testi-1.png" alt="">
                            <div class="user-details">
                                <h5>Michael Wong</h5>
                                <p>UI/UX Design Student</p>
                                <div class="user-rating">
                                    <i class="fa-solid fa-star"></i>
                                    <p>4.9</p>
                                </div>
                            </div>
                        </div>
                        <div class="desp">
                            <p>Empower yourself with the knowledge and skills gained through online education! Empower yourself with the knowledge and skills gained through online education!</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-12">
                    <div class="testimonial-box">
                        <div class="details">
                            <img src="./assets/default/img/home/testi-1.png" alt="">
                            <div class="user-details">
                                <h5>Michael Wong</h5>
                                <p>UI/UX Design Student</p>
                                <div class="user-rating">
                                    <i class="fa-solid fa-star"></i>
                                    <p>4.9</p>
                                </div>
                            </div>
                        </div>
                        <div class="desp">
                            <p>Empower yourself with the knowledge and skills gained through online education! Empower yourself with the knowledge and skills gained through online education!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    
    <div class="container subscription-container" style="margin-bottom: 35px;">
        <div class="subscription-box">
            <div class="subscription-text">
                <h4>Join us today</h4>
                <p>#We will send the best deals and offers to your email.</p>
            </div>
            <div class="subscribe-input bg-white p-10 flex-grow-1">
                <form action="/newsletters" method="post">
                    <?php echo e(csrf_field()); ?>


                    <div class="form-group d-flex align-items-center m-0">
                        <div class="w-100">
                            <input type="text" name="newsletter_email" class="form-control border-0 <?php $__errorArgs = ['newsletter_email'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" placeholder="<?php echo e(trans('footer.enter_email_here')); ?>" style="font-size: 15px; font-weight:500;"/>
                            <?php $__errorArgs = ['newsletter_email'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                            <div class="invalid-feedback"><?php echo e($message); ?></div>
                            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                        </div>
                        <button type="submit" class="btn btn-primary rounded-pill join"><?php echo e(trans('footer.join')); ?></button>
                    </div>
                </form>
            </div>
        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts_bottom'); ?>
    <script src="/assets/default/vendors/swiper/swiper-bundle.min.js"></script>
    <script src="/assets/default/vendors/owl-carousel2/owl.carousel.min.js"></script>
    <script src="/assets/default/vendors/parallax/parallax.min.js"></script>
    <script src="/assets/default/js/parts/home.min.js"></script>

    <script>
        document.addEventListener("DOMContentLoaded", () => {
            function counter(id, start, end, duration) {
                let obj = document.getElementById(id),
                    current = start,
                    range = end - start,
                    increment = end > start ? 1 : -1,
                    step = Math.abs(Math.floor(duration / range)),
                    timer = setInterval(() => {
                        current += increment;
                        obj.textContent = current;
                        if (current == end) {
                            clearInterval(timer);
                        }
                    }, step);
            }
            counter("count1", 50, 107, 1000);
            counter("count2", 9911, 10000, 1000);
            counter("count3", 0, 21, 1000);
            counter("count4", 10, 56, 1000);
        });
    </script>

    <script>
        const rating = 4; // Example rating
        const starContainer = document.getElementById('star-container');

        for (let i = 1; i <= 5; i++) {
            const img = document.createElement('img');
            img.src = i <= rating ? './assets/default/img/home/Star.png' : './assets/default/img/home/star-1.png';
            img.alt = 'Star';
            starContainer.appendChild(img);
        }
    </script>

    <script>
        var copy = document.querySelector(".logos-slide").cloneNode(true);
        document.querySelector(".logo-slider").appendChild(copy);
    </script>

    <script>
        var clone = document.querySelector(".brand-slide-track").cloneNode(true);
        document.querySelector(".brand-slider").appendChild(clone);
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const contentElements = document.querySelectorAll('.content');

            contentElements.forEach(content => {
                const fullText = content.textContent.trim();
                const words = fullText.split(' ');
                const wordLimit = 20;

                if (words.length > wordLimit) {
                    const truncatedText = words.slice(0, wordLimit).join(' ') + '...';
                    const remainingText = words.slice(wordLimit).join(' ');

                    content.innerHTML = `
                        ${truncatedText}
                        <span class="more-text" style="display: none;">${remainingText}</span>
                        <span class="read-more"><a href="#">Read More</a></span>
                        <span class="read-less" style="display: none;"><a href="#">Read Less</a></span>
                    `;

                    content.querySelector('.read-more a').addEventListener('click', function (event) {
                        event.preventDefault();
                        content.querySelector('.more-text').style.display = 'inline';
                        content.querySelector('.read-more').style.display = 'none';
                        content.querySelector('.read-less').style.display = 'inline';
                    });

                    content.querySelector('.read-less a').addEventListener('click', function (event) {
                        event.preventDefault();
                        content.querySelector('.more-text').style.display = 'none';
                        content.querySelector('.read-more').style.display = 'inline';
                        content.querySelector('.read-less').style.display = 'none';
                    });
                }
            });
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make(getTemplate() . '.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\spyberrys\resources\views/web/default/pages/home.blade.php ENDPATH**/ ?>