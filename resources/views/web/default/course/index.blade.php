@extends(getTemplate().'.layouts.app')

@push('styles_top')
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
@endpush


@section('content')
    {{-- <section class="course-cover-container {{ empty($activeSpecialOffer) ? 'not-active-special-offer' : '' }}">
        <img src="{{ $course->getImageCover() }}" class="img-cover course-cover-img" alt="{{ $course->title }}"/>

        <div class="cover-content pt-40">
            <div class="container position-relative">
                @if(!empty($activeSpecialOffer))
                    @include('web.default.course.special_offer')
                @endif
            </div>
        </div>
    </section> --}}

    {{-- Slider --}}
    {{-- <div class="course-slide">
        <div class="container course-slide-container">
            <div class="slide-details">
                <h4>All Courses</h4>
                <div class="address">
                    <p>Home</p>
                    <i class="fa-solid fa-chevron-right"></i>
                    <p>Courses</p>
                    <i class="fa-solid fa-chevron-right"></i>
                    <p>UI/UX Design</p>
                </div>
            </div>
        </div>
        <img src="./assets/default/img/course/shape-1.png" class="one" alt="">
        <img src="./assets/default/img/course/shape-2.png" class="two" alt="">
        <img src="./assets/default/img/course/shape-3.png" class="three" alt="">
    </div> --}}

    {{-- Main Section --}}
    <div class="container main-container">
        <div class="row">
            <div class="col-lg-9 col-md-12 col-12 mt-4">
                <div class="course-img {{ $course->video_demo ? 'has-video' :'' }}">
                    <img src="{{ $course->getImage() }}" class="img-cover" alt="">
                    @if($course->video_demo)
                        <div id="webinarDemoVideoBtn"
                             data-video-path="{{ $course->video_demo_source == 'upload' ?  url($course->video_demo) : $course->video_demo }}"
                             data-video-source="{{ $course->video_demo_source }}"
                             class="course-video-icon cursor-pointer d-flex align-items-center justify-content-center">
                            <i data-feather="play" width="25" height="25" style="color: white;"></i>
                        </div>
                    @endif
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
                    <h4>{{ $course->title }}</h4>
                </div>
                <div class="d-flex align-items-center mt-20" style="gap: 13px; flex-wrap:wrap;">
                    <div class="course-details">
                        <img class="instructor" src="/assets/default/img/home/ment-1.png" alt="">
                        <p>By <span>{{ $course->teacher->full_name }}</span></p>
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
                            @if($course->description)
                                <p>{!! nl2br($course->description) !!}</p>
                            @endif

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
                            @include(getTemplate().'.course.tabs.content')
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
                                        <h4>{{ $course->teacher->full_name }}</h4>
                                        <p>{{ $course->teacher->bio }}</p>
                                        <div class="instructor-ratings">
                                            <i class="fa-solid fa-star"></i>
                                            <p>(4.8 Ratings)</p>
                                        </div>
                                        <div class="social-icons">
                                            <a href="{{ $course->getShareLink('telegram') }}" target="_blank" class="icon">
                                                <i class="fa-brands fa-telegram"></i>
                                            </a>
                
                                            <a href="{{ $course->getShareLink('whatsapp') }}" target="_blank" class="icon">
                                                <i class="fa-brands fa-whatsapp"></i>
                                            </a>
                                
                                            <a href="{{ $course->getShareLink('facebook') }}" target="_blank" class="icon">
                                                <i class="fa-brands fa-facebook-f"></i>
                                            </a>
                                
                                            <a href="{{ $course->getShareLink('twitter') }}" target="_blank" class="icon">
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
                        @if($course->creator_id != $course->teacher_id)
                            @include('web.default.course.sidebar_instructor_profile', ['courseTeacher' => $course->creator])
                        @endif
               
                        @include('web.default.course.sidebar_instructor_profile', ['courseTeacher' => $course->teacher])

                        @if($course->webinarPartnerTeacher->count() > 0)
                            @foreach($course->webinarPartnerTeacher as $webinarPartnerTeacher)
                                @include('web.default.course.sidebar_instructor_profile', ['courseTeacher' => $webinarPartnerTeacher->teacher])
                            @endforeach
                        @endif
                    </div>
                    <div class="price">
                        <h5>This course Fee:</h5>
                        <form action="/cart/store" method="post" class="form">
                            {{ csrf_field() }}
                            <input type="hidden" name="item_id" value="{{ $course->id }}">
                            <input type="hidden" name="item_name" value="webinar_id">
        
                            @if(!empty($course->tickets))
                                @foreach($course->tickets as $ticket)
        
                                    <div class="form-check">
                                        <input class="form-check-input" @if(!$ticket->isValid()) disabled @endif type="radio"
                                               data-discount-price="{{ handlePrice($ticket->getPriceWithDiscount($course->price, !empty($activeSpecialOffer) ? $activeSpecialOffer : null)) }}"
                                               value="{{ ($ticket->isValid()) ? $ticket->id : '' }}"
                                               name="ticket_id"
                                               id="courseOff{{ $ticket->id }}">
                                        <label class="form-check-label d-flex flex-column cursor-pointer" for="courseOff{{ $ticket->id }}">
                                            <span class="font-16 font-weight-500 text-dark-blue">{{ $ticket->title }} @if(!empty($ticket->discount))
                                                    ({{ $ticket->discount }}% {{ trans('public.off') }})
                                                @endif</span>
                                            <span class="font-14 text-gray">{{ $ticket->getSubTitle() }}</span>
                                        </label>
                                    </div>
                                @endforeach
                            @endif
        
                            @if($course->price > 0)
                                <div id="priceBox" class="d-flex align-items-center justify-content-center {{ !empty($activeSpecialOffer) ? ' flex-column ' : '' }}">
                                    <div class="text-center">
                                        @php
                                            $realPrice = handleCoursePagePrice($course->price);
                                        @endphp
                                        <span id="realPrice" data-value="{{ $course->price }}"
                                              data-special-offer="{{ !empty($activeSpecialOffer) ? $activeSpecialOffer->percent : ''}}"
                                              class="d-block @if(!empty($activeSpecialOffer)) font-16 text-gray text-decoration-line-through @else font-30 text-primary @endif">
                                            {{ $realPrice['price'] }}
                                        </span>
        
                                        @if(!empty($realPrice['tax']) and empty($activeSpecialOffer))
                                            <span class="d-block font-14 text-gray">+ {{ $realPrice['tax'] }} {{ trans('cart.tax') }}</span>
                                        @endif
                                    </div>
        
                                    @if(!empty($activeSpecialOffer))
                                        <div class="text-center">
                                            @php
                                                $priceWithDiscount = handleCoursePagePrice($course->getPrice());
                                            @endphp
                                            <span id="priceWithDiscount"
                                                  class="d-block font-30 text-primary">
                                                {{ $priceWithDiscount['price'] }}
                                            </span>
        
                                            @if(!empty($priceWithDiscount['tax']))
                                                <span class="d-block font-14 text-gray">+ {{ $priceWithDiscount['tax'] }} {{ trans('cart.tax') }}</span>
                                            @endif
                                        </div>
                                    @endif
                                </div>
                            @else
                                <div class="d-flex">
                                    <span class="">{{ trans('public.free') }}</span>
                                </div>
                            @endif
        
                            @php
                                $canSale = ($course->canSale() and !$hasBought);
                                $authUserJoinedWaitlist = false;
        
                                if (!empty($authUser)) {
                                    $authUserWaitlist = $course->waitlists()->where('user_id', $authUser->id)->first();
                                    $authUserJoinedWaitlist = !empty($authUserWaitlist);
                                }
                            @endphp
                        </form>
                    </div>
                    <div class="" style="margin-top: 12px;">
                        <h3 class="sidebar-title font-16 text-secondary font-weight-bold">{{ trans('webinars.'.$course->type) .' '. trans('webinars.specifications') }}</h3>
    
                        <div class="mt-15">
                            @if($course->isWebinar())
                                <div class="mt-20 d-flex align-items-center justify-content-between text-gray course-spe" style="padding-bottom: 5px; border-bottom:1px solid #D9D9D9;">
                                    <div class="d-flex align-items-center">
                                        <i data-feather="calendar" width="20" height="20"></i>
                                        <span class="ml-5 font-14 font-weight-500">{{ trans('public.start_date') }}:</span>
                                    </div>
                                    <span class="font-14">{{ dateTimeFormat($course->start_date, 'j M Y | H:i') }}</span>
                                </div>
                            @endif
    
                            <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                <div class="d-flex align-items-center">
                                    <i data-feather="user" width="20" height="20"></i>
                                    <span class="ml-5 font-14 font-weight-500">{{ trans('public.capacity') }}:</span>
                                </div>
                                @if(!is_null($course->capacity))
                                    <span class="font-14">{{ $course->capacity }} {{ trans('quiz.students') }}</span>
                                @else
                                    <span class="font-14">{{ trans('update.unlimited') }}</span>
                                @endif
                            </div>
    
                            <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                <div class="d-flex align-items-center">
                                    <i data-feather="clock" width="20" height="20"></i>
                                    <span class="ml-5 font-14 font-weight-500">{{ trans('public.duration') }}:</span>
                                </div>
                                <span class="font-14">{{ convertMinutesToHourAndMinute(!empty($course->duration) ? $course->duration : 0) }} {{ trans('home.hours') }}</span>
                            </div>
    
                            <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                <div class="d-flex align-items-center">
                                    <i data-feather="users" width="20" height="20"></i>
                                    <span class="ml-5 font-14 font-weight-500">{{ trans('quiz.students') }}:</span>
                                </div>
                                <span class="font-14">{{ $course->getSalesCount() }}</span>
                            </div>
    
                            @if($course->isWebinar())
                                <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                    <div class="d-flex align-items-center">
                                        <img src="/assets/default/img/icons/sessions.svg" width="20" alt="">
                                        <span class="ml-5 font-14 font-weight-500">{{ trans('public.sessions') }}:</span>
                                    </div>
                                    <span class="font-14">{{ $course->sessions->count() }}</span>
                                </div>
                            @endif
    
                            @if($course->isTextCourse())
                                <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                    <div class="d-flex align-items-center">
                                        <img src="/assets/default/img/icons/sessions.svg" width="20" alt="">
                                        <span class="ml-5 font-14 font-weight-500">{{ trans('webinars.text_lessons') }}:</span>
                                    </div>
                                    <span class="font-14">{{ $course->textLessons->count() }}</span>
                                </div>
                            @endif
    
                            @if($course->isCourse() or $course->isTextCourse())
                                <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                    <div class="d-flex align-items-center">
                                        <img src="/assets/default/img/icons/sessions.svg" width="20" alt="">
                                        <span class="ml-5 font-14 font-weight-500">{{ trans('public.files') }}:</span>
                                    </div>
                                    <span class="font-14">{{ $course->files->count() }}</span>
                                </div>
    
                                <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                    <div class="d-flex align-items-center">
                                        <img src="/assets/default/img/icons/sessions.svg" width="20" alt="">
                                        <span class="ml-5 font-14 font-weight-500">{{ trans('public.created_at') }}:</span>
                                    </div>
                                    <span class="font-14">{{ dateTimeFormat($course->created_at,'j M Y') }}</span>
                                </div>
                            @endif
    
                            @if(!empty($course->access_days))
                                <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                    <div class="d-flex align-items-center">
                                        <i data-feather="alert-circle" width="20" height="20"></i>
                                        <span class="ml-5 font-14 font-weight-500">{{ trans('update.access_period') }}:</span>
                                    </div>
                                    <span class="font-14">{{ $course->access_days }} {{ trans('public.days') }}</span>
                                </div>
                            @endif
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
                            <a href="{{ $course->getShareLink('telegram') }}" target="_blank" class="icon">
                                <i class="fa-brands fa-telegram"></i>
                            </a>

                            <a href="{{ $course->getShareLink('whatsapp') }}" target="_blank" class="icon">
                                <i class="fa-brands fa-whatsapp"></i>
                            </a>
                
                            <a href="{{ $course->getShareLink('facebook') }}" target="_blank" class="icon">
                                <i class="fa-brands fa-facebook-f"></i>
                            </a>
                
                            <a href="{{ $course->getShareLink('twitter') }}" target="_blank" class="icon">
                                <i class="fa-brands fa-twitter"></i>
                            </a>
                        </div>
                    </div>
                    <div class="mt-20 d-flex flex-column">
                        @if(!$canSale and $course->canJoinToWaitlist())
                            <button type="button" data-slug="{{ $course->slug }}" class="purchase {{ (!$authUserJoinedWaitlist) ? ((!empty($authUser)) ? 'js-join-waitlist-user' : 'js-join-waitlist-guest') : 'disabled' }}" {{ $authUserJoinedWaitlist ? 'disabled' : '' }}>
                                @if($authUserJoinedWaitlist)
                                    {{ trans('update.already_joined') }}
                                @else
                                    {{ trans('update.join_waitlist') }}
                                @endif
                            </button>
                        @elseif($hasBought or !empty($course->getInstallmentOrder()))
                            <a href="{{ $course->getLearningPageUrl() }}" class="purchase">{{ trans('update.go_to_learning_page') }}</a>
                        @elseif(!empty($course->price) and $course->price > 0)
                            <button type="button" class="purchase {{ $canSale ? 'js-course-add-to-cart-btn' : ($course->cantSaleStatus($hasBought) .' disabled ') }}">
                                @if(!$canSale)
                                    @if($course->checkCapacityReached())
                                        {{ trans('update.capacity_reached') }}
                                    @else
                                        {{ trans('update.disabled_add_to_cart') }}
                                    @endif
                                @else
                                    {{ trans('public.add_to_cart') }}
                                @endif
                            </button>

                            @if($canSale and !empty($course->points))
                                <a href="{{ !(auth()->check()) ? '/login' : '#' }}" class="{{ (auth()->check()) ? 'js-buy-with-point' : '' }} btn btn-outline-warning mt-20 {{ (!$canSale) ? 'disabled' : '' }}" rel="nofollow">
                                    {!! trans('update.buy_with_n_points',['points' => $course->points]) !!}
                                </a>
                            @endif

                            @if($canSale and !empty(getFeaturesSettings('direct_classes_payment_button_status')))
                                <button type="button" class="btn btn-outline-danger mt-20 js-course-direct-payment">
                                    {{ trans('update.buy_now') }}
                                </button>
                            @endif

                            @if(!empty($installments) and count($installments) and getInstallmentsSettings('display_installment_button'))
                                <a href="/course/{{ $course->slug }}/installments" class="btn btn-outline-primary mt-20">
                                    {{ trans('update.pay_with_installments') }}
                                </a>
                            @endif
                        @else
                            <a href="{{ $canSale ? '/course/'. $course->slug .'/free' : '#' }}" class="purchase {{ (!$canSale) ? (' disabled ' . $course->cantSaleStatus($hasBought)) : '' }}">
                                @if(!$canSale)
                                    @if($course->checkCapacityReached())
                                        {{ trans('update.capacity_reached') }}
                                    @else
                                        {{ trans('public.disabled') }}
                                    @endif
                                @else
                                    {{ trans('public.enroll_on_webinar') }}
                                @endif
                            </a>
                        @endif

                        @if($canSale and $course->subscribe)
                            <a href="/subscribes/apply/{{ $course->slug }}" class="btn btn-outline-primary btn-subscribe mt-20 @if(!$canSale) disabled @endif">{{ trans('public.subscribe') }}</a>
                        @endif
                    </div>
                </div>
                
            </div>
        </div>
    </div> 

    @php
        $percent = $course->getProgress();
    @endphp

    {{-- <section class="container course-content-section {{ $course->type }} {{ ($hasBought or $percent) ? 'has-progress-bar' : '' }}">
        <div class="row">
            <div class="col-12 col-lg-8">
                <div class="course-content-body user-select-none">
                    <div class="course-body-on-cover text-white">
                        <h1 class="font-30 course-title">
                            {{ $course->title }}
                        </h1>

                        @if(!empty($course->category))
                            <span class="d-block font-16 mt-10">{{ trans('public.in') }} <a href="{{ $course->category->getUrl() }}" target="_blank" class="font-weight-500 text-decoration-underline text-white">{{ $course->category->title }}</a></span>
                        @endif

                        <div class="d-flex align-items-center">
                            @include('web.default.includes.webinar.rate',['rate' => $course->getRate()])
                            <span class="ml-10 mt-15 font-14">({{ $course->reviews->pluck('creator_id')->count() }} {{ trans('public.ratings') }})</span>
                        </div>

                        <div class="mt-15">
                            <span class="font-14">{{ trans('public.created_by') }}</span>
                            <a href="{{ $course->teacher->getProfileUrl() }}" target="_blank" class="text-decoration-underline text-white font-14 font-weight-500">{{ $course->teacher->full_name }}</a>
                        </div>

                        @if($hasBought or $percent)

                            <div class="mt-30 d-flex align-items-center">
                                <div class="progress course-progress flex-grow-1 shadow-xs rounded-sm">
                                    <span class="progress-bar rounded-sm bg-warning" style="width: {{ $percent }}%"></span>
                                </div>

                                <span class="ml-15 font-14 font-weight-500">
                                    @if($hasBought and (!$course->isWebinar() or $course->isProgressing()))
                                        {{ trans('public.course_learning_passed',['percent' => $percent]) }}
                                    @elseif(!is_null($course->capacity))
                                        {{ $course->getSalesCount() }}/{{ $course->capacity }} {{ trans('quiz.students') }}
                                    @else
                                        {{ trans('public.course_learning_passed',['percent' => $percent]) }}
                                    @endif
                                </span>
                            </div>
                        @endif
                    </div>

                    @if(
                            !empty(getFeaturesSettings("frontend_coupons_display_type")) and
                            getFeaturesSettings("frontend_coupons_display_type") == "before_content" and
                            !empty($instructorDiscounts) and
                            count($instructorDiscounts)
                        )
                        @foreach($instructorDiscounts as $instructorDiscount)
                            @include('web.default.includes.discounts.instructor_discounts_card', ['discount' => $instructorDiscount, 'instructorDiscountClassName' => "mt-35"])
                        @endforeach
                    @endif

                    <div class="mt-35">
                        <ul class="nav nav-tabs bg-secondary rounded-sm p-15 d-flex align-items-center justify-content-between" id="tabs-tab" role="tablist">
                            <li class="nav-item">
                                <a class="position-relative font-14 text-white {{ (empty(request()->get('tab','')) or request()->get('tab','') == 'information') ? 'active' : '' }}" id="information-tab"
                                   data-toggle="tab" href="#information" role="tab" aria-controls="information"
                                   aria-selected="true">{{ trans('product.information') }}</a>
                            </li>
                            <li class="nav-item">
                                <a class="position-relative font-14 text-white {{ (request()->get('tab','') == 'content') ? 'active' : '' }}" id="content-tab" data-toggle="tab"
                                   href="#content" role="tab" aria-controls="content"
                                   aria-selected="false">{{ trans('product.content') }} ({{ $webinarContentCount }})</a>
                            </li>
                            <li class="nav-item">
                                <a class="position-relative font-14 text-white {{ (request()->get('tab','') == 'reviews') ? 'active' : '' }}" id="reviews-tab" data-toggle="tab"
                                   href="#reviews" role="tab" aria-controls="reviews"
                                   aria-selected="false">{{ trans('product.reviews') }} ({{ $course->reviews->count() > 0 ? $course->reviews->pluck('creator_id')->count() : 0 }})</a>
                            </li>
                        </ul>

                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade {{ (empty(request()->get('tab','')) or request()->get('tab','') == 'information') ? 'show active' : '' }} " id="information" role="tabpanel"
                                 aria-labelledby="information-tab">
                                @include(getTemplate().'.course.tabs.information')
                            </div>
                            <div class="tab-pane fade {{ (request()->get('tab','') == 'content') ? 'show active' : '' }}" id="content" role="tabpanel" aria-labelledby="content-tab">
                                @include(getTemplate().'.course.tabs.content')
                            </div>
                            <div class="tab-pane fade {{ (request()->get('tab','') == 'reviews') ? 'show active' : '' }}" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                                @include(getTemplate().'.course.tabs.reviews')
                            </div>
                        </div>

                    </div>


                    @if(
                           !empty(getFeaturesSettings("frontend_coupons_display_type")) and
                           getFeaturesSettings("frontend_coupons_display_type") == "after_content" and
                           !empty($instructorDiscounts) and
                           count($instructorDiscounts)
                       )
                        @foreach($instructorDiscounts as $instructorDiscount)
                            @include('web.default.includes.discounts.instructor_discounts_card', ['discount' => $instructorDiscount, 'instructorDiscountClassName' => "mt-35"])
                        @endforeach
                    @endif

                </div>
            </div>

            <div class="course-content-sidebar col-12 col-lg-4 mt-25 mt-lg-0">
                <div class="rounded-lg shadow-sm">
                    <div class="course-img {{ $course->video_demo ? 'has-video' :'' }}">

                        <img src="{{ $course->getImage() }}" class="img-cover" alt="">

                        @if($course->video_demo)
                            <div id="webinarDemoVideoBtn"
                                 data-video-path="{{ $course->video_demo_source == 'upload' ?  url($course->video_demo) : $course->video_demo }}"
                                 data-video-source="{{ $course->video_demo_source }}"
                                 class="course-video-icon cursor-pointer d-flex align-items-center justify-content-center">
                                <i data-feather="play" width="25" height="25"></i>
                            </div>
                        @endif
                    </div>

                    <div class="px-20 pb-30">
                        <form action="/cart/store" method="post">
                            {{ csrf_field() }}
                            <input type="hidden" name="item_id" value="{{ $course->id }}">
                            <input type="hidden" name="item_name" value="webinar_id">

                            @if(!empty($course->tickets))
                                @foreach($course->tickets as $ticket)

                                    <div class="form-check mt-20">
                                        <input class="form-check-input" @if(!$ticket->isValid()) disabled @endif type="radio"
                                               data-discount-price="{{ handlePrice($ticket->getPriceWithDiscount($course->price, !empty($activeSpecialOffer) ? $activeSpecialOffer : null)) }}"
                                               value="{{ ($ticket->isValid()) ? $ticket->id : '' }}"
                                               name="ticket_id"
                                               id="courseOff{{ $ticket->id }}">
                                        <label class="form-check-label d-flex flex-column cursor-pointer" for="courseOff{{ $ticket->id }}">
                                            <span class="font-16 font-weight-500 text-dark-blue">{{ $ticket->title }} @if(!empty($ticket->discount))
                                                    ({{ $ticket->discount }}% {{ trans('public.off') }})
                                                @endif</span>
                                            <span class="font-14 text-gray">{{ $ticket->getSubTitle() }}</span>
                                        </label>
                                    </div>
                                @endforeach
                            @endif

                            @if($course->price > 0)
                                <div id="priceBox" class="d-flex align-items-center justify-content-center mt-20 {{ !empty($activeSpecialOffer) ? ' flex-column ' : '' }}">
                                    <div class="text-center">
                                        @php
                                            $realPrice = handleCoursePagePrice($course->price);
                                        @endphp
                                        <span id="realPrice" data-value="{{ $course->price }}"
                                              data-special-offer="{{ !empty($activeSpecialOffer) ? $activeSpecialOffer->percent : ''}}"
                                              class="d-block @if(!empty($activeSpecialOffer)) font-16 text-gray text-decoration-line-through @else font-30 text-primary @endif">
                                            {{ $realPrice['price'] }}
                                        </span>

                                        @if(!empty($realPrice['tax']) and empty($activeSpecialOffer))
                                            <span class="d-block font-14 text-gray">+ {{ $realPrice['tax'] }} {{ trans('cart.tax') }}</span>
                                        @endif
                                    </div>

                                    @if(!empty($activeSpecialOffer))
                                        <div class="text-center">
                                            @php
                                                $priceWithDiscount = handleCoursePagePrice($course->getPrice());
                                            @endphp
                                            <span id="priceWithDiscount"
                                                  class="d-block font-30 text-primary">
                                                {{ $priceWithDiscount['price'] }}
                                            </span>

                                            @if(!empty($priceWithDiscount['tax']))
                                                <span class="d-block font-14 text-gray">+ {{ $priceWithDiscount['tax'] }} {{ trans('cart.tax') }}</span>
                                            @endif
                                        </div>
                                    @endif
                                </div>
                            @else
                                <div class="d-flex align-items-center justify-content-center mt-20">
                                    <span class="font-36 text-primary">{{ trans('public.free') }}</span>
                                </div>
                            @endif

                            @php
                                $canSale = ($course->canSale() and !$hasBought);
                                $authUserJoinedWaitlist = false;

                                if (!empty($authUser)) {
                                    $authUserWaitlist = $course->waitlists()->where('user_id', $authUser->id)->first();
                                    $authUserJoinedWaitlist = !empty($authUserWaitlist);
                                }
                            @endphp

                            <div class="mt-20 d-flex flex-column">
                                @if(!$canSale and $course->canJoinToWaitlist())
                                    <button type="button" data-slug="{{ $course->slug }}" class="btn btn-primary {{ (!$authUserJoinedWaitlist) ? ((!empty($authUser)) ? 'js-join-waitlist-user' : 'js-join-waitlist-guest') : 'disabled' }}" {{ $authUserJoinedWaitlist ? 'disabled' : '' }}>
                                        @if($authUserJoinedWaitlist)
                                            {{ trans('update.already_joined') }}
                                        @else
                                            {{ trans('update.join_waitlist') }}
                                        @endif
                                    </button>
                                @elseif($hasBought or !empty($course->getInstallmentOrder()))
                                    <a href="{{ $course->getLearningPageUrl() }}" class="btn btn-primary">{{ trans('update.go_to_learning_page') }}</a>
                                @elseif(!empty($course->price) and $course->price > 0)
                                    <button type="button" class="btn btn-primary {{ $canSale ? 'js-course-add-to-cart-btn' : ($course->cantSaleStatus($hasBought) .' disabled ') }}">
                                        @if(!$canSale)
                                            @if($course->checkCapacityReached())
                                                {{ trans('update.capacity_reached') }}
                                            @else
                                                {{ trans('update.disabled_add_to_cart') }}
                                            @endif
                                        @else
                                            {{ trans('public.add_to_cart') }}
                                        @endif
                                    </button>

                                    @if($canSale and !empty($course->points))
                                        <a href="{{ !(auth()->check()) ? '/login' : '#' }}" class="{{ (auth()->check()) ? 'js-buy-with-point' : '' }} btn btn-outline-warning mt-20 {{ (!$canSale) ? 'disabled' : '' }}" rel="nofollow">
                                            {!! trans('update.buy_with_n_points',['points' => $course->points]) !!}
                                        </a>
                                    @endif

                                    @if($canSale and !empty(getFeaturesSettings('direct_classes_payment_button_status')))
                                        <button type="button" class="btn btn-outline-danger mt-20 js-course-direct-payment">
                                            {{ trans('update.buy_now') }}
                                        </button>
                                    @endif

                                    @if(!empty($installments) and count($installments) and getInstallmentsSettings('display_installment_button'))
                                        <a href="/course/{{ $course->slug }}/installments" class="btn btn-outline-primary mt-20">
                                            {{ trans('update.pay_with_installments') }}
                                        </a>
                                    @endif
                                @else
                                    <a href="{{ $canSale ? '/course/'. $course->slug .'/free' : '#' }}" class="btn btn-primary {{ (!$canSale) ? (' disabled ' . $course->cantSaleStatus($hasBought)) : '' }}">
                                        @if(!$canSale)
                                            @if($course->checkCapacityReached())
                                                {{ trans('update.capacity_reached') }}
                                            @else
                                                {{ trans('public.disabled') }}
                                            @endif
                                        @else
                                            {{ trans('public.enroll_on_webinar') }}
                                        @endif
                                    </a>
                                @endif

                                @if($canSale and $course->subscribe)
                                    <a href="/subscribes/apply/{{ $course->slug }}" class="btn btn-outline-primary btn-subscribe mt-20 @if(!$canSale) disabled @endif">{{ trans('public.subscribe') }}</a>
                                @endif

                            </div>

                        </form>

                        @if(!empty(getOthersPersonalizationSettings('show_guarantee_text')) and getOthersPersonalizationSettings('show_guarantee_text'))
                            <div class="mt-20 d-flex align-items-center justify-content-center text-gray">
                                <i data-feather="thumbs-up" width="20" height="20"></i>
                                <span class="ml-5 font-14">{{ trans('product.guarantee_text') }}</span>
                            </div>
                        @endif

                        <div class="mt-35">
                            <strong class="d-block text-secondary font-weight-bold">{{ trans('webinars.this_webinar_includes',['classes' => trans('webinars.'.$course->type)]) }}</strong>
                            @if($course->isDownloadable())
                                <div class="mt-20 d-flex align-items-center text-gray">
                                    <i data-feather="download-cloud" width="20" height="20"></i>
                                    <span class="ml-5 font-14 font-weight-500">{{ trans('webinars.downloadable_content') }}</span>
                                </div>
                            @endif

                            @if($course->certificate or ($course->quizzes->where('certificate', 1)->count() > 0))
                                <div class="mt-20 d-flex align-items-center text-gray">
                                    <i data-feather="award" width="20" height="20"></i>
                                    <span class="ml-5 font-14 font-weight-500">{{ trans('webinars.official_certificate') }}</span>
                                </div>
                            @endif

                            @if($course->quizzes->where('status', \App\models\Quiz::ACTIVE)->count() > 0)
                                <div class="mt-20 d-flex align-items-center text-gray">
                                    <i data-feather="file-text" width="20" height="20"></i>
                                    <span class="ml-5 font-14 font-weight-500">{{ trans('webinars.online_quizzes_count',['quiz_count' => $course->quizzes->where('status', \App\models\Quiz::ACTIVE)->count()]) }}</span>
                                </div>
                            @endif

                            @if($course->support)
                                <div class="mt-20 d-flex align-items-center text-gray">
                                    <i data-feather="headphones" width="20" height="20"></i>
                                    <span class="ml-5 font-14 font-weight-500">{{ trans('webinars.instructor_support') }}</span>
                                </div>
                            @endif
                        </div>

                        <div class="mt-40 p-10 rounded-sm border row align-items-center favorites-share-box">
                            @if($course->isWebinar())
                                <div class="col">
                                    <a href="{{ $course->addToCalendarLink() }}" target="_blank" class="d-flex flex-column align-items-center text-center text-gray">
                                        <i data-feather="calendar" width="20" height="20"></i>
                                        <span class="font-12">{{ trans('public.reminder') }}</span>
                                    </a>
                                </div>
                            @endif

                            <div class="col">
                                <a href="/favorites/{{ $course->slug }}/toggle" id="favoriteToggle" class="d-flex flex-column align-items-center text-gray">
                                    <i data-feather="heart" class="{{ !empty($isFavorite) ? 'favorite-active' : '' }}" width="20" height="20"></i>
                                    <span class="font-12">{{ trans('panel.favorite') }}</span>
                                </a>
                            </div>

                            <div class="col">
                                <a href="#" class="js-share-course d-flex flex-column align-items-center text-gray">
                                    <i data-feather="share-2" width="20" height="20"></i>
                                    <span class="font-12">{{ trans('public.share') }}</span>
                                </a>
                            </div>
                        </div>

                        <div class="mt-30 text-center">
                            <button type="button" id="webinarReportBtn" class="font-14 text-gray btn-transparent">{{ trans('webinars.report_this_webinar') }}</button>
                        </div>
                    </div>
                </div>

                @include('web.default.includes.cashback_alert',['itemPrice' => $course->price])

                @if($course->canSale() and !empty(getGiftsGeneralSettings('status')) and !empty(getGiftsGeneralSettings('allow_sending_gift_for_courses')))
                    <a href="/gift/course/{{ $course->slug }}" class="d-flex align-items-center mt-30 rounded-lg border p-15">
                        <div class="size-40 d-flex-center rounded-circle bg-gray200">
                            <i data-feather="gift" class="text-gray" width="20" height="20"></i>
                        </div>
                        <div class="ml-5">
                            <h4 class="font-14 font-weight-bold text-gray">{{ trans('update.gift_this_course') }}</h4>
                            <p class="font-12 text-gray">{{ trans('update.gift_this_course_hint') }}</p>
                        </div>
                    </a>
                @endif

                @if($course->teacher->offline)
                    <div class="rounded-lg shadow-sm mt-35 d-flex">
                        <div class="offline-icon offline-icon-left d-flex align-items-stretch">
                            <div class="d-flex align-items-center">
                                <img src="/assets/default/img/profile/time-icon.png" alt="offline">
                            </div>
                        </div>

                        <div class="p-15">
                            <h3 class="font-16 text-dark-blue">{{ trans('public.instructor_is_not_available') }}</h3>
                            <p class="font-14 font-weight-500 text-gray mt-15">{{ $course->teacher->offline_message }}</p>
                        </div>
                    </div>
                @endif

                <div class="rounded-lg shadow-sm mt-35 px-25 py-20">
                    <h3 class="sidebar-title font-16 text-secondary font-weight-bold">{{ trans('webinars.'.$course->type) .' '. trans('webinars.specifications') }}</h3>

                    <div class="mt-30">
                        @if($course->isWebinar())
                            <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                <div class="d-flex align-items-center">
                                    <i data-feather="calendar" width="20" height="20"></i>
                                    <span class="ml-5 font-14 font-weight-500">{{ trans('public.start_date') }}:</span>
                                </div>
                                <span class="font-14">{{ dateTimeFormat($course->start_date, 'j M Y | H:i') }}</span>
                            </div>
                        @endif

                        <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                            <div class="d-flex align-items-center">
                                <i data-feather="user" width="20" height="20"></i>
                                <span class="ml-5 font-14 font-weight-500">{{ trans('public.capacity') }}:</span>
                            </div>
                            @if(!is_null($course->capacity))
                                <span class="font-14">{{ $course->capacity }} {{ trans('quiz.students') }}</span>
                            @else
                                <span class="font-14">{{ trans('update.unlimited') }}</span>
                            @endif
                        </div>

                        <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                            <div class="d-flex align-items-center">
                                <i data-feather="clock" width="20" height="20"></i>
                                <span class="ml-5 font-14 font-weight-500">{{ trans('public.duration') }}:</span>
                            </div>
                            <span class="font-14">{{ convertMinutesToHourAndMinute(!empty($course->duration) ? $course->duration : 0) }} {{ trans('home.hours') }}</span>
                        </div>

                        <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                            <div class="d-flex align-items-center">
                                <i data-feather="users" width="20" height="20"></i>
                                <span class="ml-5 font-14 font-weight-500">{{ trans('quiz.students') }}:</span>
                            </div>
                            <span class="font-14">{{ $course->getSalesCount() }}</span>
                        </div>

                        @if($course->isWebinar())
                            <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                <div class="d-flex align-items-center">
                                    <img src="/assets/default/img/icons/sessions.svg" width="20" alt="">
                                    <span class="ml-5 font-14 font-weight-500">{{ trans('public.sessions') }}:</span>
                                </div>
                                <span class="font-14">{{ $course->sessions->count() }}</span>
                            </div>
                        @endif

                        @if($course->isTextCourse())
                            <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                <div class="d-flex align-items-center">
                                    <img src="/assets/default/img/icons/sessions.svg" width="20" alt="">
                                    <span class="ml-5 font-14 font-weight-500">{{ trans('webinars.text_lessons') }}:</span>
                                </div>
                                <span class="font-14">{{ $course->textLessons->count() }}</span>
                            </div>
                        @endif

                        @if($course->isCourse() or $course->isTextCourse())
                            <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                <div class="d-flex align-items-center">
                                    <img src="/assets/default/img/icons/sessions.svg" width="20" alt="">
                                    <span class="ml-5 font-14 font-weight-500">{{ trans('public.files') }}:</span>
                                </div>
                                <span class="font-14">{{ $course->files->count() }}</span>
                            </div>

                            <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                <div class="d-flex align-items-center">
                                    <img src="/assets/default/img/icons/sessions.svg" width="20" alt="">
                                    <span class="ml-5 font-14 font-weight-500">{{ trans('public.created_at') }}:</span>
                                </div>
                                <span class="font-14">{{ dateTimeFormat($course->created_at,'j M Y') }}</span>
                            </div>
                        @endif

                        @if(!empty($course->access_days))
                            <div class="mt-20 d-flex align-items-center justify-content-between text-gray">
                                <div class="d-flex align-items-center">
                                    <i data-feather="alert-circle" width="20" height="20"></i>
                                    <span class="ml-5 font-14 font-weight-500">{{ trans('update.access_period') }}:</span>
                                </div>
                                <span class="font-14">{{ $course->access_days }} {{ trans('public.days') }}</span>
                            </div>
                        @endif
                    </div>
                </div>

               
                @if($course->creator_id != $course->teacher_id)
                    @include('web.default.course.sidebar_instructor_profile', ['courseTeacher' => $course->creator])
                @endif
               
                @include('web.default.course.sidebar_instructor_profile', ['courseTeacher' => $course->teacher])

                @if($course->webinarPartnerTeacher->count() > 0)
                    @foreach($course->webinarPartnerTeacher as $webinarPartnerTeacher)
                        @include('web.default.course.sidebar_instructor_profile', ['courseTeacher' => $webinarPartnerTeacher->teacher])
                    @endforeach
                @endif
          

                @if($course->tags->count() > 0)
                    <div class="rounded-lg tags-card shadow-sm mt-35 px-25 py-20">
                        <h3 class="sidebar-title font-16 text-secondary font-weight-bold">{{ trans('public.tags') }}</h3>

                        <div class="d-flex flex-wrap mt-10">
                            @foreach($course->tags as $tag)
                                <a href="/tags/courses/{{ urlencode($tag->title) }}" class="tag-item bg-gray200 p-5 font-14 text-gray font-weight-500 rounded">{{ $tag->title }}</a>
                            @endforeach
                        </div>
                    </div>
                @endif
             
                @if(!empty($advertisingBannersSidebar) and count($advertisingBannersSidebar))
                    <div class="row">
                        @foreach($advertisingBannersSidebar as $sidebarBanner)
                            <div class="rounded-lg sidebar-ads mt-35 col-{{ $sidebarBanner->size }}">
                                <a href="{{ $sidebarBanner->link }}">
                                    <img src="{{ $sidebarBanner->image }}" class="img-cover rounded-lg" alt="{{ $sidebarBanner->title }}">
                                </a>
                            </div>
                        @endforeach
                    </div>

                @endif
            </div>
        </div>

        @if(!empty($advertisingBanners) and count($advertisingBanners))
            <div class="mt-30 mt-md-50">
                <div class="row">
                    @foreach($advertisingBanners as $banner)
                        <div class="col-{{ $banner->size }}">
                            <a href="{{ $banner->link }}">
                                <img src="{{ $banner->image }}" class="img-cover rounded-sm" alt="{{ $banner->title }}">
                            </a>
                        </div>
                    @endforeach
                </div>
            </div>
        @endif
    </section> --}}

    <div id="webinarReportModal" class="d-none">
        <h3 class="section-title after-line font-20 text-dark-blue">{{ trans('product.report_the_course') }}</h3>

        <form action="/course/{{ $course->id }}/report" method="post" class="mt-25">

            <div class="form-group">
                <label class="text-dark-blue font-14">{{ trans('product.reason') }}</label>
                <select id="reason" name="reason" class="form-control">
                    <option value="" selected disabled>{{ trans('product.select_reason') }}</option>

                    @foreach(getReportReasons() as $reason)
                        <option value="{{ $reason }}">{{ $reason }}</option>
                    @endforeach
                </select>
                <div class="invalid-feedback"></div>
            </div>

            <div class="form-group">
                <label class="text-dark-blue font-14" for="message_to_reviewer">{{ trans('public.message_to_reviewer') }}</label>
                <textarea name="message" id="message_to_reviewer" class="form-control" rows="10"></textarea>
                <div class="invalid-feedback"></div>
            </div>
            <p class="text-gray font-16">{{ trans('product.report_modal_hint') }}</p>

            <div class="mt-30 d-flex align-items-center justify-content-end">
                <button type="button" class="js-course-report-submit btn btn-sm btn-primary">{{ trans('panel.report') }}</button>
                <button type="button" class="btn btn-sm btn-danger ml-10 close-swl">{{ trans('public.close') }}</button>
            </div>
        </form>
    </div>

    @include('web.default.course.share_modal')
    @include('web.default.course.buy_with_point_modal')
@endsection

@push('scripts_bottom')
    <script src="/assets/default/js/parts/time-counter-down.min.js"></script>
    <script src="/assets/default/vendors/barrating/jquery.barrating.min.js"></script>
    <script src="/assets/default/vendors/video/video.min.js"></script>
    <script src="/assets/default/vendors/video/youtube.min.js"></script>
    <script src="/assets/default/vendors/video/vimeo.js"></script>

    <script>
        var webinarDemoLang = '{{ trans('webinars.webinar_demo') }}';
        var replyLang = '{{ trans('panel.reply') }}';
        var closeLang = '{{ trans('public.close') }}';
        var saveLang = '{{ trans('public.save') }}';
        var reportLang = '{{ trans('panel.report') }}';
        var reportSuccessLang = '{{ trans('panel.report_success') }}';
        var reportFailLang = '{{ trans('panel.report_fail') }}';
        var messageToReviewerLang = '{{ trans('public.message_to_reviewer') }}';
        var copyLang = '{{ trans('public.copy') }}';
        var copiedLang = '{{ trans('public.copied') }}';
        var learningToggleLangSuccess = '{{ trans('public.course_learning_change_status_success') }}';
        var learningToggleLangError = '{{ trans('public.course_learning_change_status_error') }}';
        var notLoginToastTitleLang = '{{ trans('public.not_login_toast_lang') }}';
        var notLoginToastMsgLang = '{{ trans('public.not_login_toast_msg_lang') }}';
        var notAccessToastTitleLang = '{{ trans('public.not_access_toast_lang') }}';
        var notAccessToastMsgLang = '{{ trans('public.not_access_toast_msg_lang') }}';
        var canNotTryAgainQuizToastTitleLang = '{{ trans('public.can_not_try_again_quiz_toast_lang') }}';
        var canNotTryAgainQuizToastMsgLang = '{{ trans('public.can_not_try_again_quiz_toast_msg_lang') }}';
        var canNotDownloadCertificateToastTitleLang = '{{ trans('public.can_not_download_certificate_toast_lang') }}';
        var canNotDownloadCertificateToastMsgLang = '{{ trans('public.can_not_download_certificate_toast_msg_lang') }}';
        var sessionFinishedToastTitleLang = '{{ trans('public.session_finished_toast_title_lang') }}';
        var sessionFinishedToastMsgLang = '{{ trans('public.session_finished_toast_msg_lang') }}';
        var sequenceContentErrorModalTitle = '{{ trans('update.sequence_content_error_modal_title') }}';
        var courseHasBoughtStatusToastTitleLang = '{{ trans('cart.fail_purchase') }}';
        var courseHasBoughtStatusToastMsgLang = '{{ trans('site.you_bought_webinar') }}';
        var courseNotCapacityStatusToastTitleLang = '{{ trans('public.request_failed') }}';
        var courseNotCapacityStatusToastMsgLang = '{{ trans('cart.course_not_capacity') }}';
        var courseHasStartedStatusToastTitleLang = '{{ trans('cart.fail_purchase') }}';
        var courseHasStartedStatusToastMsgLang = '{{ trans('update.class_has_started') }}';
        var joinCourseWaitlistLang = '{{ trans('update.join_course_waitlist') }}';
        var joinCourseWaitlistModalHintLang = "{{ trans('update.join_course_waitlist_modal_hint') }}";
        var joinLang = '{{ trans('footer.join') }}';
        var nameLang = '{{ trans('auth.name') }}';
        var emailLang = '{{ trans('auth.email') }}';
        var phoneLang = '{{ trans('public.phone') }}';
        var captchaLang = '{{ trans('site.captcha') }}';
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

    @if(!empty($course->creator) and !empty($course->creator->getLiveChatJsCode()) and !empty(getFeaturesSettings('show_live_chat_widget')))
        <script>
            (function () {
                "use strict"

                {!! $course->creator->getLiveChatJsCode() !!}
            })(jQuery)
        </script>
    @endif
@endpush
