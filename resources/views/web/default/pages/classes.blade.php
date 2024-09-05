@extends(getTemplate().'.layouts.app')

@push('styles_top')
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
@endpush

@section('content')
    {{-- <section class="site-top-banner search-top-banner opacity-04 position-relative">
        <img src="{{ getPageBackgroundSettings('categories') }}" class="img-cover" alt=""/>

        <div class="container h-100">
            <div class="row h-100 align-items-center justify-content-center text-center">
                <div class="col-12 col-md-9 col-lg-7">
                    <div class="top-search-categories-form">
                        <h1 class="text-white font-30 mb-15">{{ $pageTitle }}</h1>
                        <span class="course-count-badge py-5 px-10 text-white rounded">{{ $coursesCount }} {{ trans('product.courses') }}</span>

                        <div class="search-input bg-white p-10 flex-grow-1">
                            <form action="/search" method="get">
                                <div class="form-group d-flex align-items-center m-0">
                                    <input type="text" name="search" class="form-control border-0" placeholder="{{ trans('home.slider_search_placeholder') }}"/>
                                    <button type="submit" class="btn btn-primary rounded-pill">{{ trans('home.find') }}</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> --}}

    {{-- Slider --}}
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

    {{-- <div class="container mt-30">
        <section class="mt-lg-50 pt-lg-20 mt-md-40 pt-md-40">
            <form action="/classes" method="get" id="filtersForm">
                @include('web.default.pages.includes.top_filters')

                <div class="row mt-20">
                    <div class="col-12 col-lg-8">
                        @if(empty(request()->get('card')) or request()->get('card') == 'grid')
                            <div class="row">
                                @foreach($webinars as $webinar)
                                    <div class="col-12 col-lg-6 mt-20">
                                        @include('web.default.includes.webinar.grid-card',['webinar' => $webinar])
                                    </div>
                                @endforeach
                            </div>

                        @elseif(!empty(request()->get('card')) and request()->get('card') == 'list')

                            @foreach($webinars as $webinar)
                                @include('web.default.includes.webinar.list-card',['webinar' => $webinar])
                            @endforeach
                        @endif
                    </div>

                    <div class="col-12 col-lg-4">
                        <div class="mt-20 p-20 rounded-sm shadow-lg border border-gray300 filters-container">

                            <div class="">
                                <h3 class="category-filter-title font-20 font-weight-bold text-dark-blue">{{ trans('public.type') }}</h3>

                                <div class="pt-10">
                                    @foreach(['bundle','webinar','course','text_lesson'] as $typeOption)
                                        <div class="d-flex align-items-center justify-content-between mt-20">
                                            <label class="cursor-pointer" for="filterLanguage{{ $typeOption }}">
                                                @if($typeOption == 'bundle')
                                                    {{ trans('update.bundle') }}
                                                @else
                                                    {{ trans('webinars.'.$typeOption) }}
                                                @endif
                                            </label>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" name="type[]" id="filterLanguage{{ $typeOption }}" value="{{ $typeOption }}" @if(in_array($typeOption, request()->get('type', []))) checked="checked" @endif class="custom-control-input">
                                                <label class="custom-control-label" for="filterLanguage{{ $typeOption }}"></label>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>

                            <div class="mt-25 pt-25 border-top border-gray300">
                                <h3 class="category-filter-title font-20 font-weight-bold text-dark-blue">{{ trans('site.more_options') }}</h3>

                                <div class="pt-10">
                                    @foreach(['subscribe','certificate_included','with_quiz','featured'] as $moreOption)
                                        <div class="d-flex align-items-center justify-content-between mt-20">
                                            <label class="cursor-pointer" for="filterLanguage{{ $moreOption }}">{{ trans('webinars.show_only_'.$moreOption) }}</label>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" name="moreOptions[]" id="filterLanguage{{ $moreOption }}" value="{{ $moreOption }}" @if(in_array($moreOption, request()->get('moreOptions', []))) checked="checked" @endif class="custom-control-input">
                                                <label class="custom-control-label" for="filterLanguage{{ $moreOption }}"></label>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                            <button type="submit" class="btn btn-sm btn-primary btn-block mt-30">{{ trans('site.filter_items') }}</button>
                        </div>
                    </div>
                </div>
            </form>
            <div class="mt-50 pt-30">
                {{ $webinars->appends(request()->input())->links('vendor.pagination.panel') }}
            </div>
        </section>
    </div> --}}

    <div class="container course-container">
            <form action="/classes" method="get" id="filtersForm" class="w-100 form">

                <div class="row w-100">
                    <div class="col-lg-3 col-md-12 col-12 mt-5">
                        <div class="filters-container">
    
                            <div class="filter-box">
                                <h3 class="category-filter-title font-20 font-weight-bold text-dark-blue">{{ trans('public.type') }}</h3>
    
                                <div class="pt-10 mt-10">
                                    @foreach(['bundle','webinar','course','text_lesson'] as $typeOption)
                                        <div class="d-flex align-items-center justify-content-between">
                                            <label class="cursor-pointer" for="filterLanguage{{ $typeOption }}">
                                                @if($typeOption == 'bundle')
                                                    {{ trans('update.bundle') }}
                                                @else
                                                    {{ trans('webinars.'.$typeOption) }}
                                                @endif
                                            </label>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" name="type[]" id="filterLanguage{{ $typeOption }}" value="{{ $typeOption }}" @if(in_array($typeOption, request()->get('type', []))) checked="checked" @endif class="custom-control-input">
                                                <label class="custom-control-label" for="filterLanguage{{ $typeOption }}"></label>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
    
                            <div class="border-top border-gray300 filter-box">
                                <h3 class="category-filter-title font-20 font-weight-bold text-dark-blue">{{ trans('site.more_options') }}</h3>
    
                                <div class="pt-10">
                                    @foreach(['subscribe','certificate_included','with_quiz','featured'] as $moreOption)
                                        <div class="d-flex align-items-center justify-content-between">
                                            <label class="cursor-pointer" for="filterLanguage{{ $moreOption }}">{{ trans('webinars.show_only_'.$moreOption) }}</label>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" name="moreOptions[]" id="filterLanguage{{ $moreOption }}" value="{{ $moreOption }}" @if(in_array($moreOption, request()->get('moreOptions', []))) checked="checked" @endif class="custom-control-input">
                                                <label class="custom-control-label" for="filterLanguage{{ $moreOption }}"></label>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                            <button type="submit" class="btn btn-sm btn-primary btn-block">{{ trans('site.filter_items') }}</button>
                        </div>
                    </div>
    
                    <div class="col-lg-9 col-12 result mt-sm-20">
                        @include('web.default.pages.includes.top_filters')
    
                        <div class="row">
                            <div class="col-12 col-lg-8">
                                @if(empty(request()->get('card')) or request()->get('card') == 'grid')
                                    <div class="row">
                                        @foreach($webinars as $webinar)
                                            <div class="col-12 col-lg-6 mt-20">
                                                @include('web.default.includes.webinar.grid-card',['webinar' => $webinar])
                                            </div>
                                        @endforeach
                                    </div>
    
                                @elseif(!empty(request()->get('card')) and request()->get('card') == 'list')
    
                                    @foreach($webinars as $webinar)
                                        @include('web.default.includes.webinar.list-card',['webinar' => $webinar])
                                    @endforeach
                                @endif
                            </div>
    
                            {{-- <div class="col-12 col-lg-4">
                                <div class="mt-20 p-20 rounded-sm shadow-lg border border-gray300 filters-container">
    
                                    <div class="">
                                        <h3 class="category-filter-title font-20 font-weight-bold text-dark-blue">{{ trans('public.type') }}</h3>
    
                                        <div class="pt-10">
                                            @foreach(['bundle','webinar','course','text_lesson'] as $typeOption)
                                                <div class="d-flex align-items-center justify-content-between mt-20">
                                                    <label class="cursor-pointer" for="filterLanguage{{ $typeOption }}">
                                                        @if($typeOption == 'bundle')
                                                            {{ trans('update.bundle') }}
                                                        @else
                                                            {{ trans('webinars.'.$typeOption) }}
                                                        @endif
                                                    </label>
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" name="type[]" id="filterLanguage{{ $typeOption }}" value="{{ $typeOption }}" @if(in_array($typeOption, request()->get('type', []))) checked="checked" @endif class="custom-control-input">
                                                        <label class="custom-control-label" for="filterLanguage{{ $typeOption }}"></label>
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
    
                                    <div class="mt-25 pt-25 border-top border-gray300">
                                        <h3 class="category-filter-title font-20 font-weight-bold text-dark-blue">{{ trans('site.more_options') }}</h3>
    
                                        <div class="pt-10">
                                            @foreach(['subscribe','certificate_included','with_quiz','featured'] as $moreOption)
                                                <div class="d-flex align-items-center justify-content-between mt-20">
                                                    <label class="cursor-pointer" for="filterLanguage{{ $moreOption }}">{{ trans('webinars.show_only_'.$moreOption) }}</label>
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" name="moreOptions[]" id="filterLanguage{{ $moreOption }}" value="{{ $moreOption }}" @if(in_array($moreOption, request()->get('moreOptions', []))) checked="checked" @endif class="custom-control-input">
                                                        <label class="custom-control-label" for="filterLanguage{{ $moreOption }}"></label>
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-sm btn-primary btn-block mt-30">{{ trans('site.filter_items') }}</button>
                                </div>
                            </div> --}}
                        </div>
                    </div>
                </div>
            </form>
        <div class="mt-50 pt-30">
            {{ $webinars->appends(request()->input())->links('vendor.pagination.panel') }}
        </div>
    </div>

@endsection

@push('scripts_bottom')
    <script src="/assets/default/vendors/select2/select2.min.js"></script>
    <script src="/assets/default/vendors/swiper/swiper-bundle.min.js"></script>

    <script src="/assets/default/js/parts/categories.min.js"></script>

    {{-- Categories --}}
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

    {{-- Languages --}}
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

    {{-- Instructors --}}
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
@endpush
