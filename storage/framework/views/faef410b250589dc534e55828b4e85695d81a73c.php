

<?php $__env->startPush('styles_top'); ?>
    <link rel="stylesheet" href="/assets/default/css/css-stars.css">
    <link rel="stylesheet" href="/assets/default/vendors/video/video-js.min.css">

    <style>
        .course-slide {
            width: 100%;
            background-image: url(/assets/default/img/classes/course-bg.png);
            display: flex;
            position: relative;
        }

        .course-slide-container {
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .slide-details{
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            justify-content: center;
            padding: 60px 0;
        }

        .slide-details h4 {
            font-size: 25px;
            font-weight: 600;
            margin-bottom: 7px;
        }

        .address {
            display: flex;
            align-items: center;
            gap: 7px;
        }

        .address i {
            font-size: 12px;
        }

        .address p {
            font-size: 14px;
            font-weight: 500;
        }

        .address p:last-child {
            color: #5751E1;
        }

        .course-slide .one {
            width: 50px;
            position: absolute;
            top: 50px;
            left: 60px;
        }

        .course-slide .two {
            width: 50px;
            position: absolute;
            top: 50px;
            right: 450px;
        }

        .course-slide .three {
            width: 50px;
            position: absolute;
            top: 50px;
            right: 0px;
        }

        .course-img {
            position: relative;
            height: 350px;
        }

        .course-img.has-video .course-video-icon {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            box-shadow: 0 20px 12px 0 rgba(0, 0, 0, 0.1);
            border: 2px solid white;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            z-index: 2;
        }

        .rightbar {
            border: 1px solid #DFDFDF;
        }

        .course-teacher-card .teacher-avatar {
            width: 100%;
            height: 100%;
            border-radius: 0;
        }

        .course-teacher-card .teacher-avatar img {
            border-radius: 8px;
            margin-bottom: 12px;
        }

        .exp {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 9px;
            margin-top: 10px;
            color: #828282;
            font-size: 13px;
        }

        .price {
            padding: 10px 12px;
            border-radius: 8px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            gap: 6px;
            background-color: #5751E1;
            color: white;
        }

        .price h5 {
            font-size: 15px;
            font-weight: 500;
        }

        .form span {
            font-size: 19px;
            font-weight: 600;
            align-self: flex-start;
            color: white;
        }

        .course-spe {
            padding-bottom: 8px;
            border-bottom: 1px solid #D9D9D9;
        }

        .sector {
            background-color: #EFEFF2;
            padding: 8px 10px;
            border-radius: 15px;
        }

        .sector p {
            font-size: 12px;
            font-weight: 700;
        }

        .reviews {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .reviews p {
            color: #7F7E97;
            font-size: 13px;
            line-height: 0;
        }

        .course-title {
            margin-top: 12px;
        }

        .course-title h4 {
            font-size: 20px;
            font-weight: 600;
        }

        .course-details {
            display: flex;
            align-items: center;
            gap: 12px;
            color: #7F7E97;
            font-size: 13px;
            font-weight: 500;
        }

        .course-details span {
            color: black;
        }

        .instructor {
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }

        .dot {
            background-color: #8C9AB4;
            width: 5px;
            height: 5px;
            border-radius: 50%;
        }

        .tab {
            margin-top: 20px;
        }

        .tabs {
            display: flex;
            gap: 10px;
        }

        .tab-btn {
            padding: 10px 15px;
            background-color: #e0e0e0;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 13px;
            font-weight: 600;
        }

        .tab-btn.active {
            background-color: #4A3AFF;
            color: #fff;
        }

        .tab-content {
            margin-top: 20px;
            display: none;
        }

        .tab-content.active {
            display: block;
        }

        .review-options {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 10px;
            margin-bottom: 15px;
            opacity: 0;
            visibility: hidden;
        }

        .review-option-btn {
            padding: 10px 15px;
            background-color: #e0e0e0;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            opacity: 0;
            transform: scale(0);
            transition: opacity 0.3s ease, transform 0.3s ease;
            font-size: 13px;
            font-weight: 600;
        }

        .review-option-btn.animate {
            opacity: 1;
            transform: scale(1);
        }

        .review-option-btn:hover {
            background-color: #d0d0d0;
        }

        .review-option-btn.active {
            background-color: #4A3AFF;
            color: #fff;
        }

        .desp {
            border: 1px solid #DFDFDF;
            padding: 20px 30px;
        }

        .desp p {
            color: #6D6C80;
            font-size: 13px;
        }

        .points {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 15px;
        }

        .point {
            background-color: #FFC224;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .point i {
            font-size: 10px;
            font-weight: 600;
        }

        .points p {
            font-size: 13px;
            font-weight: 600;
            margin-top: 0;
            color: black;
        }

        .last-text {
            color: #6D6C80;
            font-size: 14px;
            font-weight: 500;
            text-align: center;
        }

        .payments {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding-bottom: 15px;
            border-bottom: 1px solid #D9D9D9;
        }

        .payments h4 {
            font-size: 1rem;
            margin-top: 13px;
        }

        .payment-image {
            display: flex;
            align-items: center;
            gap: 7px;
            margin-top: 9px;
        }

        .payment-image img {
            width: 35px;
            cursor: pointer;
        }

        .social-sharing {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding-bottom: 15px;
            border-bottom: 1px solid #D9D9D9;
        }

        .social-sharing h4 {
            font-size: 1rem;
            margin-top: 13px;
        }

        .social-icons {
            margin-top: 9px;
            display: flex;
            align-items: center;
            gap: 7px;
        }

        .icon {
            background-color: #E6E9EF;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .icon i {
            font-size: 14px;
        }

        .purchase {
            padding: 10px 20px;
            background-color: #0089FF;
            color: white;
            border-radius: 25px;
            border: 2px solid #000;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            margin-top: 25px;
            margin-bottom: 30px;
            font-size: 14px;
        }

        .purchase:hover {
            color: white;
        }

        .instructors {
            display: flex;
            flex-direction: row;
            align-items: center;
            gap: 20px;
        }

        .instructor-image img {
            width:150px;
            height: 150px;
            border-radius: 50%
        }

        .instructor-ratings {
            display: flex;
            align-items: center;
            gap: 7px;
        }
        
        .instructor-details {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            gap: 6px;
        }

        .instructor-details h4 {
            font-size: 17px;
            font-weight: 600;
        }

        .instructor-details p {
            font-size: 12px;
            font-weight: 600;
            color: #5751E1;
            margin-top: 0;
        }

        .instructor-ratings p {
            color: #7F7E97;
            margin-top: 0;
            font-weight: 500;
        }

        .review {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .user {
            margin-top: 12px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .user img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
        }

        .review p {
            font-size: 12px;
            font-weight: 500;
            color: black;
            padding-bottom: 15px;
            border-bottom: 1px solid #0000001A;
        }

        .comments {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 15px;
        }

        .comment-icon {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .comment {
            padding: 5px 15px;
            background-color: #0089FF;
            border-radius: 8px;
            color: white;
            font-size: 15px;
            font-weight: 500;
        }

        .comment:hover {
            color: white;
        }

        .img-cover {
            border-radius: 15px;
        }

        @media (max-width:768px) {
            .instructors {
                flex-direction: column;
                align-items: center;
            }

            .desp {
                padding: 20px 15px;
            }

            .point {
                width: 40px;
            }
        }
    </style>
<?php $__env->stopPush(); ?>


<?php $__env->startSection('content'); ?>
    

    
    

    
    <div class="container main-container">
        <div class="row">
            <div class="col-lg-9 col-md-12 col-12 mt-4">
                <div class="course-img <?php echo e($course->video_demo ? 'has-video' :''); ?>">
                    <img src="<?php echo e($course->getImage()); ?>" class="img-cover" alt="">
                    <?php if($course->video_demo): ?>
                        <div id="webinarDemoVideoBtn"
                             data-video-path="<?php echo e($course->video_demo_source == 'upload' ?  url($course->video_demo) : $course->video_demo); ?>"
                             data-video-source="<?php echo e($course->video_demo_source); ?>"
                             class="course-video-icon cursor-pointer d-flex align-items-center justify-content-center">
                            <i data-feather="play" width="25" height="25" style="color: white;"></i>
                        </div>
                    <?php endif; ?>
                </div>
                <div class="d-flex align-items-center mt-3" style="gap: 11px;">
                    <div class="sector">
                        <p>Development</p>
                    </div>
                    <div class="reviews">
                        <i class="fa-solid fa-star"></i>
                        <p>(4.5 Reviews)</p>
                    </div>
                </div>
                <div class="course-title">
                    <h4><?php echo e($course->title); ?></h4>
                </div>
                <div class="d-flex align-items-center mt-20" style="gap: 13px; flex-wrap:wrap;">
                    <div class="course-details">
                        <img class="instructor" src="/assets/default/img/home/ment-1.png" alt="">
                        <p>By <span><?php echo e($course->teacher->full_name); ?></span></p>
                    </div>
                    <p class="dot"></p>
                    <div class="course-details">
                        <img src="/assets/default/img/date.png" alt="">
                        <p>24/07/2024</p>
                    </div>
                    <p class="dot"></p>
                    <div class="course-details">
                        <img src="/assets/default/img/student.png" alt="">
                        <p>2,250 students</p>
                    </div>
                </div>
                <div class="tab">
                    <div class="tabs" style="flex-wrap: wrap;">
                        <button class="tab-btn active" id="overview-tab" onclick="showTabContent('overview')">Overview</button>
                        <button class="tab-btn" id="curriculum-tab" onclick="showTabContent('curriculum')">Curriculum</button>
                        <button class="tab-btn" id="instructors-tab" onclick="showTabContent('instructors')">Instructors</button>
                        <button class="tab-btn" id="reviews-tab" onclick="showTabContent('reviews'); toggleReviewOptions()">Reviews</button>
                    </div>
                    
                    <div class="tab-content active" id="overview-content">
                        <div class="desp rounded shadow">
                            <h4>Course Description</h4>
                            <?php if($course->description): ?>
                                <p><?php echo nl2br($course->description); ?></p>
                            <?php endif; ?>

                            <h4 class="mt-20">What you'll learn in this course?</h4>
                            <div class="points">
                                <div class="point">
                                    <i class="fa-solid fa-chevron-right"></i>
                                </div>
                                <p>Foundations of UI/UX Design: Grasp the basics of user interface and user experience design.</p>
                            </div>
                            <div class="points">
                                <div class="point">
                                    <i class="fa-solid fa-chevron-right"></i>
                                </div>
                                <p>Design Tools Mastery: Get hands-on with industry-standard tools like Figma, Sketch, and Adobe XD.</p>
                            </div>
                            <div class="points">
                                <div class="point">
                                    <i class="fa-solid fa-chevron-right"></i>
                                </div>
                                <p>Wireframing and Prototyping: Learn how to create wireframes, prototypes, and user flows.</p>
                            </div>

                            <p class="last-text mt-35 font-15">Start your journey from beginner to pro with Spyberry's UI/UX Course and shape the digital experiences of tomorrow</p>
                        </div>
                    </div>
                    <div class="tab-content" id="curriculum-content" style="display:none;">
                        <div class="desp rounded shadow">
                            <h4>Curriculum</h4>
                            <h4 class="mt-20">What you'll learn in this course?</h4>
                            <?php echo $__env->make(getTemplate().'.course.tabs.content', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            <div class="points">
                                <div class="point">
                                    <i class="fa-solid fa-chevron-right"></i>
                                </div>
                                <p>Foundations of UI/UX Design: Grasp the basics of user interface and user experience design.</p>
                            </div>
                            <div class="points">
                                <div class="point">
                                    <i class="fa-solid fa-chevron-right"></i>
                                </div>
                                <p>Design Tools Mastery: Get hands-on with industry-standard tools like Figma, Sketch, and Adobe XD.</p>
                            </div>
                            <div class="points">
                                <div class="point">
                                    <i class="fa-solid fa-chevron-right"></i>
                                </div>
                                <p>Wireframing and Prototyping: Learn how to create wireframes, prototypes, and user flows.</p>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content" id="instructors-content" style="display:none;">
                        <div class="desp rounded shadow">
                            <div class="col-lg-6 col-md-12 col-12">
                                <div class="instructors">
                                    <div class="instructor-image">
                                        <img src="/assets/default/img/home/ment-1.png" alt="">
                                    </div>
                                    <div class="instructor-details">
                                        <h4><?php echo e($course->teacher->full_name); ?></h4>
                                        <p><?php echo e($course->teacher->bio); ?></p>
                                        <div class="instructor-ratings">
                                            <i class="fa-solid fa-star"></i>
                                            <p>(4.8 Ratings)</p>
                                        </div>
                                        <div class="social-icons">
                                            <a href="<?php echo e($course->getShareLink('telegram')); ?>" target="_blank" class="icon">
                                                <i class="fa-brands fa-telegram"></i>
                                            </a>
                
                                            <a href="<?php echo e($course->getShareLink('whatsapp')); ?>" target="_blank" class="icon">
                                                <i class="fa-brands fa-whatsapp"></i>
                                            </a>
                                
                                            <a href="<?php echo e($course->getShareLink('facebook')); ?>" target="_blank" class="icon">
                                                <i class="fa-brands fa-facebook-f"></i>
                                            </a>
                                
                                            <a href="<?php echo e($course->getShareLink('twitter')); ?>" target="_blank" class="icon">
                                                <i class="fa-brands fa-twitter"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content" id="reviews-content" style="display:none;">
                        <div class="review-options" id="review-options">
                            <button class="review-option-btn">Newest</button>
                            <button class="review-option-btn">Oldest</button>
                            <button class="review-option-btn">Positive</button>
                        </div>
                        <div>
                            <div class="desp rounded shadow">
                                <h4>Comments</h4>
                                <div class="review">
                                    <div class="user">
                                        <img src="/assets/default/img/home/testi-1.png" alt="">
                                        <h5>John Doe</h5>
                                    </div>
                                    <p>"Spyberry offers an exceptional e-learning experience, blending expert-led courses with a user-friendly platform. The variety of courses and the quality of content are top-notch, making it a go-to destination for anyone looking to upskill. The hands-on projects and real-world applications truly set it apart, helping learners not just understand but excel in their chosen fields. Whether you're a beginner or a seasoned professional, Spyberry provides the tools and knowledge to take your skills to the next level. Highly recommended for anyone serious about learning!"</p>
                                    <div class="comments">
                                        <div class="comment-icon">
                                            <img src="/assets/default/img/course/bold.png" alt="">
                                            <img src="/assets/default/img/course/italic.png" alt="">
                                            <img src="/assets/default/img/course/link.png" alt="">
                                        </div>
                                        <button class="btn comment">Comment</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>            
            </div>
            <div class="col-lg-3 col-md-12 col-12 mt-4">
                <div class="rounded-lg shadow-sm rightbar p-20">
                    <div>
                        <?php if($course->creator_id != $course->teacher_id): ?>
                            <?php echo $__env->make('web.default.course.sidebar_instructor_profile', ['courseTeacher' => $course->creator], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        <?php endif; ?>
               
                        <?php echo $__env->make('web.default.course.sidebar_instructor_profile', ['courseTeacher' => $course->teacher], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

                        <?php if($course->webinarPartnerTeacher->count() > 0): ?>
                            <?php $__currentLoopData = $course->webinarPartnerTeacher; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $webinarPartnerTeacher): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php echo $__env->make('web.default.course.sidebar_instructor_profile', ['courseTeacher' => $webinarPartnerTeacher->teacher], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <?php endif; ?>
                    </div>
                    <div class="price">
                        <h5>This course Fee:</h5>
                        <form action="/cart/store" method="post" class="form">
                            <?php echo e(csrf_field()); ?>

                            <input type="hidden" name="item_id" value="<?php echo e($course->id); ?>">
                            <input type="hidden" name="item_name" value="webinar_id">
        
                            <?php if(!empty($course->tickets)): ?>
                                <?php $__currentLoopData = $course->tickets; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $ticket): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        
                                    <div class="form-check">
                                        <input class="form-check-input" <?php if(!$ticket->isValid()): ?> disabled <?php endif; ?> type="radio"
                                               data-discount-price="<?php echo e(handlePrice($ticket->getPriceWithDiscount($course->price, !empty($activeSpecialOffer) ? $activeSpecialOffer : null))); ?>"
                                               value="<?php echo e(($ticket->isValid()) ? $ticket->id : ''); ?>"
                                               name="ticket_id"
                                               id="courseOff<?php echo e($ticket->id); ?>">
                                        <label class="form-check-label d-flex flex-column cursor-pointer" for="courseOff<?php echo e($ticket->id); ?>">
                                            <span class="font-16 font-weight-500 text-dark-blue"><?php echo e($ticket->title); ?> <?php if(!empty($ticket->discount)): ?>
                                                    (<?php echo e($ticket->discount); ?>% <?php echo e(trans('public.off')); ?>)
                                                <?php endif; ?></span>
                                            <span class="font-14 text-gray"><?php echo e($ticket->getSubTitle()); ?></span>
                                        </label>
                                    </div>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
        
                            <?php if($course->price > 0): ?>
                                <div id="priceBox" class="d-flex align-items-center justify-content-center <?php echo e(!empty($activeSpecialOffer) ? ' flex-column ' : ''); ?>">
                                    <div class="text-center">
                                        <?php
                                            $realPrice = handleCoursePagePrice($course->price);
                                        ?>
                                        <span id="realPrice" data-value="<?php echo e($course->price); ?>"
                                              data-special-offer="<?php echo e(!empty($activeSpecialOffer) ? $activeSpecialOffer->percent : ''); ?>"
                                              class="d-block <?php if(!empty($activeSpecialOffer)): ?> font-16 text-gray text-decoration-line-through <?php else: ?> font-30 text-primary <?php endif; ?>">
                                            <?php echo e($realPrice['price']); ?>

                                        </span>
        
                                        <?php if(!empty($realPrice['tax']) and empty($activeSpecialOffer)): ?>
                                            <span class="d-block font-14 text-gray">+ <?php echo e($realPrice['tax']); ?> <?php echo e(trans('cart.tax')); ?></span>
                                        <?php endif; ?>
                                    </div>
        
                                    <?php if(!empty($activeSpecialOffer)): ?>
                                        <div class="text-center">
                                            <?php
                                                $priceWithDiscount = handleCoursePagePrice($course->getPrice());
                                            ?>
                                            <span id="priceWithDiscount"
                                                  class="d-block font-30 text-primary">
                                                <?php echo e($priceWithDiscount['price']); ?>

                                            </span>
        
                                            <?php if(!empty($priceWithDiscount['tax'])): ?>
                                                <span class="d-block font-14 text-gray">+ <?php echo e($priceWithDiscount['tax']); ?> <?php echo e(trans('cart.tax')); ?></span>
                                            <?php endif; ?>
                                        </div>
                                    <?php endif; ?>
                                </div>
                            <?php else: ?>
                                <div class="d-flex">
                                    <span class=""><?php echo e(trans('public.free')); ?></span>
                                </div>
                            <?php endif; ?>
        
                            <?php
                                $canSale = ($course->canSale() and !$hasBought);
                                $authUserJoinedWaitlist = false;
        
                                if (!empty($authUser)) {
                                    $authUserWaitlist = $course->waitlists()->where('user_id', $authUser->id)->first();
                                    $authUserJoinedWaitlist = !empty($authUserWaitlist);
                                }
                            ?>
                        </form>
                    </div>
                    <div class="" style="margin-top: 12px;">
                        <h3 class="sidebar-title font-16 text-secondary font-weight-bold"><?php echo e(trans('webinars.'.$course->type) .' '. trans('webinars.specifications')); ?></h3>
    
                        <div class="mt-15">
                            <?php if($course->isWebinar()): ?>
                                <div class="mt-20 d-flex align-items-center justify-content-between text-gray course-spe" style="padding-bottom: 5px; border-bottom:1px solid #D9D9D9;">
                                    <div class="d-flex align-items-center">
                                        <i data-feather="calendar" width="20" height="20"></i>
                                        <span class="ml-5 font-14 font-weight-500"><?php echo e(trans('public.start_date')); ?>:</span>
                                    </div>
                                    <span class="font-14"><?php echo e(dateTimeFormat($course->start_date, 'j M Y | H:i')); ?></span>
                                </div>
                            <?php endif; ?>
    
                            <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                <div class="d-flex align-items-center">
                                    <i data-feather="user" width="20" height="20"></i>
                                    <span class="ml-5 font-14 font-weight-500"><?php echo e(trans('public.capacity')); ?>:</span>
                                </div>
                                <?php if(!is_null($course->capacity)): ?>
                                    <span class="font-14"><?php echo e($course->capacity); ?> <?php echo e(trans('quiz.students')); ?></span>
                                <?php else: ?>
                                    <span class="font-14"><?php echo e(trans('update.unlimited')); ?></span>
                                <?php endif; ?>
                            </div>
    
                            <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                <div class="d-flex align-items-center">
                                    <i data-feather="clock" width="20" height="20"></i>
                                    <span class="ml-5 font-14 font-weight-500"><?php echo e(trans('public.duration')); ?>:</span>
                                </div>
                                <span class="font-14"><?php echo e(convertMinutesToHourAndMinute(!empty($course->duration) ? $course->duration : 0)); ?> <?php echo e(trans('home.hours')); ?></span>
                            </div>
    
                            <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                <div class="d-flex align-items-center">
                                    <i data-feather="users" width="20" height="20"></i>
                                    <span class="ml-5 font-14 font-weight-500"><?php echo e(trans('quiz.students')); ?>:</span>
                                </div>
                                <span class="font-14"><?php echo e($course->getSalesCount()); ?></span>
                            </div>
    
                            <?php if($course->isWebinar()): ?>
                                <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                    <div class="d-flex align-items-center">
                                        <img src="/assets/default/img/icons/sessions.svg" width="20" alt="">
                                        <span class="ml-5 font-14 font-weight-500"><?php echo e(trans('public.sessions')); ?>:</span>
                                    </div>
                                    <span class="font-14"><?php echo e($course->sessions->count()); ?></span>
                                </div>
                            <?php endif; ?>
    
                            <?php if($course->isTextCourse()): ?>
                                <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                    <div class="d-flex align-items-center">
                                        <img src="/assets/default/img/icons/sessions.svg" width="20" alt="">
                                        <span class="ml-5 font-14 font-weight-500"><?php echo e(trans('webinars.text_lessons')); ?>:</span>
                                    </div>
                                    <span class="font-14"><?php echo e($course->textLessons->count()); ?></span>
                                </div>
                            <?php endif; ?>
    
                            <?php if($course->isCourse() or $course->isTextCourse()): ?>
                                <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                    <div class="d-flex align-items-center">
                                        <img src="/assets/default/img/icons/sessions.svg" width="20" alt="">
                                        <span class="ml-5 font-14 font-weight-500"><?php echo e(trans('public.files')); ?>:</span>
                                    </div>
                                    <span class="font-14"><?php echo e($course->files->count()); ?></span>
                                </div>
    
                                <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                    <div class="d-flex align-items-center">
                                        <img src="/assets/default/img/icons/sessions.svg" width="20" alt="">
                                        <span class="ml-5 font-14 font-weight-500"><?php echo e(trans('public.created_at')); ?>:</span>
                                    </div>
                                    <span class="font-14"><?php echo e(dateTimeFormat($course->created_at,'j M Y')); ?></span>
                                </div>
                            <?php endif; ?>
    
                            <?php if(!empty($course->access_days)): ?>
                                <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                    <div class="d-flex align-items-center">
                                        <i data-feather="alert-circle" width="20" height="20"></i>
                                        <span class="ml-5 font-14 font-weight-500"><?php echo e(trans('update.access_period')); ?>:</span>
                                    </div>
                                    <span class="font-14"><?php echo e($course->access_days); ?> <?php echo e(trans('public.days')); ?></span>
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                    <div class="payments">
                        <h4>Secure Payment:</h4>
                        <div class="payment-image">
                            <img src="/assets/default/img/course/paypal.png" alt="">
                            <img src="/assets/default/img/course/visa.png" alt="">
                            <img src="/assets/default/img/course/master_card.png" alt="">
                            <img src="/assets/default/img/course/express.png" alt="">
                            <img src="/assets/default/img/course/discover.png" alt="">
                        </div>
                    </div>
                    <div class="social-sharing">
                        <h4>Share this Course:</h4>
                        <div class="social-icons">
                            <a href="<?php echo e($course->getShareLink('telegram')); ?>" target="_blank" class="icon">
                                <i class="fa-brands fa-telegram"></i>
                            </a>

                            <a href="<?php echo e($course->getShareLink('whatsapp')); ?>" target="_blank" class="icon">
                                <i class="fa-brands fa-whatsapp"></i>
                            </a>
                
                            <a href="<?php echo e($course->getShareLink('facebook')); ?>" target="_blank" class="icon">
                                <i class="fa-brands fa-facebook-f"></i>
                            </a>
                
                            <a href="<?php echo e($course->getShareLink('twitter')); ?>" target="_blank" class="icon">
                                <i class="fa-brands fa-twitter"></i>
                            </a>
                        </div>
                    </div>
                    <div class="mt-20 d-flex flex-column">
                        <?php if(!$canSale and $course->canJoinToWaitlist()): ?>
                            <button type="button" data-slug="<?php echo e($course->slug); ?>" class="purchase <?php echo e((!$authUserJoinedWaitlist) ? ((!empty($authUser)) ? 'js-join-waitlist-user' : 'js-join-waitlist-guest') : 'disabled'); ?>" <?php echo e($authUserJoinedWaitlist ? 'disabled' : ''); ?>>
                                <?php if($authUserJoinedWaitlist): ?>
                                    <?php echo e(trans('update.already_joined')); ?>

                                <?php else: ?>
                                    <?php echo e(trans('update.join_waitlist')); ?>

                                <?php endif; ?>
                            </button>
                        <?php elseif($hasBought or !empty($course->getInstallmentOrder())): ?>
                            <a href="<?php echo e($course->getLearningPageUrl()); ?>" class="purchase"><?php echo e(trans('update.go_to_learning_page')); ?></a>
                        <?php elseif(!empty($course->price) and $course->price > 0): ?>
                            <button type="button" class="purchase <?php echo e($canSale ? 'js-course-add-to-cart-btn' : ($course->cantSaleStatus($hasBought) .' disabled ')); ?>">
                                <?php if(!$canSale): ?>
                                    <?php if($course->checkCapacityReached()): ?>
                                        <?php echo e(trans('update.capacity_reached')); ?>

                                    <?php else: ?>
                                        <?php echo e(trans('update.disabled_add_to_cart')); ?>

                                    <?php endif; ?>
                                <?php else: ?>
                                    <?php echo e(trans('public.add_to_cart')); ?>

                                <?php endif; ?>
                            </button>

                            <?php if($canSale and !empty($course->points)): ?>
                                <a href="<?php echo e(!(auth()->check()) ? '/login' : '#'); ?>" class="<?php echo e((auth()->check()) ? 'js-buy-with-point' : ''); ?> btn btn-outline-warning mt-20 <?php echo e((!$canSale) ? 'disabled' : ''); ?>" rel="nofollow">
                                    <?php echo trans('update.buy_with_n_points',['points' => $course->points]); ?>

                                </a>
                            <?php endif; ?>

                            <?php if($canSale and !empty(getFeaturesSettings('direct_classes_payment_button_status'))): ?>
                                <button type="button" class="btn btn-outline-danger mt-20 js-course-direct-payment">
                                    <?php echo e(trans('update.buy_now')); ?>

                                </button>
                            <?php endif; ?>

                            <?php if(!empty($installments) and count($installments) and getInstallmentsSettings('display_installment_button')): ?>
                                <a href="/course/<?php echo e($course->slug); ?>/installments" class="btn btn-outline-primary mt-20">
                                    <?php echo e(trans('update.pay_with_installments')); ?>

                                </a>
                            <?php endif; ?>
                        <?php else: ?>
                            <a href="<?php echo e($canSale ? '/course/'. $course->slug .'/free' : '#'); ?>" class="purchase <?php echo e((!$canSale) ? (' disabled ' . $course->cantSaleStatus($hasBought)) : ''); ?>">
                                <?php if(!$canSale): ?>
                                    <?php if($course->checkCapacityReached()): ?>
                                        <?php echo e(trans('update.capacity_reached')); ?>

                                    <?php else: ?>
                                        <?php echo e(trans('public.disabled')); ?>

                                    <?php endif; ?>
                                <?php else: ?>
                                    <?php echo e(trans('public.enroll_on_webinar')); ?>

                                <?php endif; ?>
                            </a>
                        <?php endif; ?>

                        <?php if($canSale and $course->subscribe): ?>
                            <a href="/subscribes/apply/<?php echo e($course->slug); ?>" class="btn btn-outline-primary btn-subscribe mt-20 <?php if(!$canSale): ?> disabled <?php endif; ?>"><?php echo e(trans('public.subscribe')); ?></a>
                        <?php endif; ?>
                    </div>
                </div>
                
            </div>
        </div>
    </div> 

    <?php
        $percent = $course->getProgress();
    ?>

    

    <div id="webinarReportModal" class="d-none">
        <h3 class="section-title after-line font-20 text-dark-blue"><?php echo e(trans('product.report_the_course')); ?></h3>

        <form action="/course/<?php echo e($course->id); ?>/report" method="post" class="mt-25">

            <div class="form-group">
                <label class="text-dark-blue font-14"><?php echo e(trans('product.reason')); ?></label>
                <select id="reason" name="reason" class="form-control">
                    <option value="" selected disabled><?php echo e(trans('product.select_reason')); ?></option>

                    <?php $__currentLoopData = getReportReasons(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $reason): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <option value="<?php echo e($reason); ?>"><?php echo e($reason); ?></option>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </select>
                <div class="invalid-feedback"></div>
            </div>

            <div class="form-group">
                <label class="text-dark-blue font-14" for="message_to_reviewer"><?php echo e(trans('public.message_to_reviewer')); ?></label>
                <textarea name="message" id="message_to_reviewer" class="form-control" rows="10"></textarea>
                <div class="invalid-feedback"></div>
            </div>
            <p class="text-gray font-16"><?php echo e(trans('product.report_modal_hint')); ?></p>

            <div class="mt-30 d-flex align-items-center justify-content-end">
                <button type="button" class="js-course-report-submit btn btn-sm btn-primary"><?php echo e(trans('panel.report')); ?></button>
                <button type="button" class="btn btn-sm btn-danger ml-10 close-swl"><?php echo e(trans('public.close')); ?></button>
            </div>
        </form>
    </div>

    <?php echo $__env->make('web.default.course.share_modal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <?php echo $__env->make('web.default.course.buy_with_point_modal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts_bottom'); ?>
    <script src="/assets/default/js/parts/time-counter-down.min.js"></script>
    <script src="/assets/default/vendors/barrating/jquery.barrating.min.js"></script>
    <script src="/assets/default/vendors/video/video.min.js"></script>
    <script src="/assets/default/vendors/video/youtube.min.js"></script>
    <script src="/assets/default/vendors/video/vimeo.js"></script>

    <script>
        var webinarDemoLang = '<?php echo e(trans('webinars.webinar_demo')); ?>';
        var replyLang = '<?php echo e(trans('panel.reply')); ?>';
        var closeLang = '<?php echo e(trans('public.close')); ?>';
        var saveLang = '<?php echo e(trans('public.save')); ?>';
        var reportLang = '<?php echo e(trans('panel.report')); ?>';
        var reportSuccessLang = '<?php echo e(trans('panel.report_success')); ?>';
        var reportFailLang = '<?php echo e(trans('panel.report_fail')); ?>';
        var messageToReviewerLang = '<?php echo e(trans('public.message_to_reviewer')); ?>';
        var copyLang = '<?php echo e(trans('public.copy')); ?>';
        var copiedLang = '<?php echo e(trans('public.copied')); ?>';
        var learningToggleLangSuccess = '<?php echo e(trans('public.course_learning_change_status_success')); ?>';
        var learningToggleLangError = '<?php echo e(trans('public.course_learning_change_status_error')); ?>';
        var notLoginToastTitleLang = '<?php echo e(trans('public.not_login_toast_lang')); ?>';
        var notLoginToastMsgLang = '<?php echo e(trans('public.not_login_toast_msg_lang')); ?>';
        var notAccessToastTitleLang = '<?php echo e(trans('public.not_access_toast_lang')); ?>';
        var notAccessToastMsgLang = '<?php echo e(trans('public.not_access_toast_msg_lang')); ?>';
        var canNotTryAgainQuizToastTitleLang = '<?php echo e(trans('public.can_not_try_again_quiz_toast_lang')); ?>';
        var canNotTryAgainQuizToastMsgLang = '<?php echo e(trans('public.can_not_try_again_quiz_toast_msg_lang')); ?>';
        var canNotDownloadCertificateToastTitleLang = '<?php echo e(trans('public.can_not_download_certificate_toast_lang')); ?>';
        var canNotDownloadCertificateToastMsgLang = '<?php echo e(trans('public.can_not_download_certificate_toast_msg_lang')); ?>';
        var sessionFinishedToastTitleLang = '<?php echo e(trans('public.session_finished_toast_title_lang')); ?>';
        var sessionFinishedToastMsgLang = '<?php echo e(trans('public.session_finished_toast_msg_lang')); ?>';
        var sequenceContentErrorModalTitle = '<?php echo e(trans('update.sequence_content_error_modal_title')); ?>';
        var courseHasBoughtStatusToastTitleLang = '<?php echo e(trans('cart.fail_purchase')); ?>';
        var courseHasBoughtStatusToastMsgLang = '<?php echo e(trans('site.you_bought_webinar')); ?>';
        var courseNotCapacityStatusToastTitleLang = '<?php echo e(trans('public.request_failed')); ?>';
        var courseNotCapacityStatusToastMsgLang = '<?php echo e(trans('cart.course_not_capacity')); ?>';
        var courseHasStartedStatusToastTitleLang = '<?php echo e(trans('cart.fail_purchase')); ?>';
        var courseHasStartedStatusToastMsgLang = '<?php echo e(trans('update.class_has_started')); ?>';
        var joinCourseWaitlistLang = '<?php echo e(trans('update.join_course_waitlist')); ?>';
        var joinCourseWaitlistModalHintLang = "<?php echo e(trans('update.join_course_waitlist_modal_hint')); ?>";
        var joinLang = '<?php echo e(trans('footer.join')); ?>';
        var nameLang = '<?php echo e(trans('auth.name')); ?>';
        var emailLang = '<?php echo e(trans('auth.email')); ?>';
        var phoneLang = '<?php echo e(trans('public.phone')); ?>';
        var captchaLang = '<?php echo e(trans('site.captcha')); ?>';
    </script>

    <script src="/assets/default/js/parts/comment.min.js"></script>
    <script src="/assets/default/js/parts/video_player_helpers.min.js"></script>
    <script src="/assets/default/js/parts/webinar_show.min.js"></script>

    <script>
        function showTabContent(tab) {
            // Hide all tab contents
            var tabContents = document.getElementsByClassName('tab-content');
            Array.from(tabContents).forEach(function(content) {
                content.style.display = 'none';
                content.classList.remove('active');
            });

            // Remove active class from all tab buttons
            var tabButtons = document.getElementsByClassName('tab-btn');
            Array.from(tabButtons).forEach(function(btn) {
                btn.classList.remove('active');
            });

            // Show the selected tab content and add active class to the button
            document.getElementById(tab + '-content').style.display = 'block';
            document.getElementById(tab + '-content').classList.add('active');
            document.getElementById(tab + '-tab').classList.add('active');
        }

        function toggleReviewOptions() {
            var reviewOptions = document.getElementById('review-options');
            var reviewOptionButtons = reviewOptions.getElementsByClassName('review-option-btn');
            var reviewsTab = document.getElementById('reviews-tab');

            if (reviewOptions.style.visibility === 'visible') {
                // Hide options
                reviewOptions.style.opacity = 0;
                reviewOptions.style.visibility = 'hidden';
                
                // Remove animation class
                Array.from(reviewOptionButtons).forEach((btn, index) => {
                    btn.classList.remove('animate');
                });
            } else {
                // Show options with animation
                reviewOptions.style.opacity = 1;
                reviewOptions.style.visibility = 'visible';
                
                // Animate each option one by one
                Array.from(reviewOptionButtons).forEach((btn, index) => {
                    setTimeout(() => {
                        btn.classList.add('animate');
                    }, index * 100); // Staggered delay for each button
                });
            }
        }
    </script>

    <?php if(!empty($course->creator) and !empty($course->creator->getLiveChatJsCode()) and !empty(getFeaturesSettings('show_live_chat_widget'))): ?>
        <script>
            (function () {
                "use strict"

                <?php echo $course->creator->getLiveChatJsCode(); ?>

            })(jQuery)
        </script>
    <?php endif; ?>
<?php $__env->stopPush(); ?>

<?php echo $__env->make(getTemplate().'.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\spyberrys\resources\views/web/default/course/index.blade.php ENDPATH**/ ?>