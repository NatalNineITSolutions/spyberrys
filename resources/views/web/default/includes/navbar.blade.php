@php
    if (empty($authUser) and auth()->check()) {
        $authUser = auth()->user();
    }

    $navBtnUrl = null;
    $navBtnText = null;

    if (request()->is('forums*')) {
        $navBtnUrl = '/forums/create-topic';
        $navBtnText = trans('update.create_new_topic');
    } else {
        $navbarButton = getNavbarButton(!empty($authUser) ? $authUser->role_id : null, empty($authUser));

        if (!empty($navbarButton)) {
            $navBtnUrl = $navbarButton->url;
            $navBtnText = $navbarButton->title;
        }
    }
@endphp

<div id="navbarVacuum"></div>
<nav id="navbar" class="navbar navbar-expand-lg">
    <div class="w-100 header-container">
        <div class="d-flex align-items-center justify-content-between w-100">

            <a class="navbar-brand navbar-order d-flex align-items-center justify-content-center mr-0 {{ (empty($navBtnUrl) and empty($navBtnText)) ? 'ml-auto' : '' }}" href="/">
                @if (!empty($generalSettings['logo']))
                    <img src="{{ $generalSettings['logo'] }}" class="img-cover" alt="site logo">
                @endif
            </a>

            <button class="navbar-toggler navbar-order" type="button" id="navbarToggle">
                <span class="navbar-toggler-icon" style="background-image: url('data:image/svg+xml;charset=utf8,%3Csvg xmlns=%27http://www.w3.org/2000/svg%27 viewBox=%270 0 30 30%27%3E%3Cpath stroke=%27rgba(255, 255, 255, 1)%27 stroke-width=%272%27 stroke-linecap=%27round%27 stroke-miterlimit=%2710%27 d=%27M4 7h22M4 15h22M4 23h22%27/%3E%3C/svg%3E');"></span>
            </button>

            <div class="d-none d-lg-flex flex-grow-1 navbar-toggle-content " id="navbarContent">
                <div class="navbar-toggle-header text-right d-lg-none">
                    <button class="btn-transparent" id="navbarClose">
                        <i data-feather="x" width="32" height="32"></i>
                    </button>
                </div>

                <ul class="navbar-nav mr-auto d-flex align-items-center justify-content-between">

                    <div class="nav">
                        @if (!empty($navbarPages) and count($navbarPages))
                            @foreach ($navbarPages as $navbarPage)
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ $navbarPage['link'] }}">{{ $navbarPage['title'] }}</a>
                                </li>
                            @endforeach
                        @endif
                    </div>

                    <div class="nav">
                        <div>
                            @if (!empty($categories) and count($categories))
                                <li class="mr-lg-25">
                                    <div class="menu-category">
                                        <ul>
                                            <li class="cursor-pointer user-select-none d-flex xs-categories-toggle">
                                                {{ trans('categories.categories') }}
                                                <i data-feather="chevron-down" width="20" height="20"
                                                    class="ml-2 d-none d-lg-block"></i>

                                                <ul class="cat-dropdown-menu">
                                                    @foreach ($categories as $category)
                                                        <li>
                                                            <a href="{{ $category->getUrl() }}"
                                                                class="{{ (!empty($category->subCategories) and count($category->subCategories)) ? 'js-has-subcategory' : '' }}">
                                                                <div class="d-flex align-items-center">
                                                                    @if (!empty($category->icon))
                                                                        <img src="{{ $category->icon }}"
                                                                            class="cat-dropdown-menu-icon mr-10"
                                                                            alt="{{ $category->title }} icon">
                                                                    @endif
                                                                    {{ $category->title }}
                                                                </div>

                                                                @if (!empty($category->subCategories) and count($category->subCategories))
                                                                    <i data-feather="chevron-right" width="20"
                                                                        height="20"
                                                                        class="d-none d-lg-inline-block ml-10"></i>
                                                                    <i data-feather="chevron-down" width="20"
                                                                        height="20"
                                                                        class="d-inline-block d-lg-none"></i>
                                                                @endif
                                                            </a>

                                                            @if (!empty($category->subCategories) and count($category->subCategories))
                                                                <ul class="sub-menu" data-simplebar
                                                                    @if (!empty($isRtl) and $isRtl) data-simplebar-direction="rtl" @endif>
                                                                    @foreach ($category->subCategories as $subCategory)
                                                                        <li>
                                                                            <a href="{{ $subCategory->getUrl() }}">
                                                                                @if (!empty($subCategory->icon))
                                                                                    <img src="{{ $subCategory->icon }}"
                                                                                        class="cat-dropdown-menu-icon mr-10"
                                                                                        alt="{{ $subCategory->title }} icon">
                                                                                @endif

                                                                                {{ $subCategory->title }}
                                                                            </a>
                                                                        </li>
                                                                    @endforeach
                                                                </ul>
                                                            @endif
                                                        </li>
                                                    @endforeach
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            @endif
                        </div>
                        <div>
                            <form action="/search" method="get" class="form-inline my-2 my-lg-0 navbar-search position-relative">
                                <input class="form-control mr-5 rounded" type="text" name="search" placeholder="{{ trans('navbar.search_anything') }}" aria-label="Search" style="width: 300px;">
            
                                <button type="submit" class="btn-transparent d-flex align-items-center justify-content-center search-icon">
                                    <i data-feather="search" width="20" height="20" class="mr-10"></i>
                                </button>
                            </form>
                        </div>
                    </div>

                    <div>
                        @include('web.default.includes.top_nav.user_menu')
                    </div>
                </ul>
            </div>

            <div class="nav-icons-or-start-live navbar-order d-flex align-items-center justify-content-end">

                @if (!empty($navBtnUrl))
                    <a href="{{ $navBtnUrl }}" class="d-none d-lg-flex btn btn-sm btn-primary nav-start-a-live-btn">
                        {{ $navBtnText }}
                    </a>

                    <a href="{{ $navBtnUrl }}" class="d-flex d-lg-none text-primary nav-start-a-live-btn font-14">
                        {{ $navBtnText }}
                    </a>
                @endif

                @if (!empty($isPanel))
                    @if ($authUser->checkAccessToAIContentFeature())
                        <div class="js-show-ai-content-drawer show-ai-content-drawer-btn d-flex-center mr-40">
                            <div class="d-flex-center size-32 rounded-circle bg-white">
                                <img src="/assets/default/img/ai/ai-chip.svg" alt="ai" class=""
                                    width="16px" height="16px">
                            </div>
                            <span
                                class="ml-5 font-weight-500 text-secondary font-14 d-none d-lg-block">{{ trans('update.ai_content') }}</span>
                        </div>
                    @endif
                @endif

                <div class="d-none nav-notify-cart-dropdown top-navbar">
                    @include('web.default.includes.shopping-cart-dropdwon')

                    <div class="border-left mx-15"></div>

                    @include('web.default.includes.notification-dropdown')
                </div>

            </div>
        </div>
    </div>
</nav>

@push('scripts_bottom')
    <script src="/assets/default/js/parts/navbar.min.js"></script>
@endpush
