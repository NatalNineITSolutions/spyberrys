<style>

    .header {
        width: 100%;
        position: fixed;
        top: 0;
        left: 0;
        z-index: 999;
        background-color: #fff;
        transition: box-shadow 0.3s ease;
        padding: 1rem 3rem;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    .header.scrolled {
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    .header.sticky.sticky-visible {
        transform: translateY(0); /* Slide down into view */
    }

    .header-container {
        width: 100%;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .left {
        display: flex;
        align-items: center;
        gap: 20px;
    }

    .custom-search-wrapper {
        position: relative;
        width: 350px;
    }

    .custom-search-input {
        width: 100%;
        padding-right: 40px;
        padding-left: 12px;
        height: 40px;
        border-radius: 8px;
        border: 1px solid #ccc;
        background-color: #F1F1F1;
    }

    .custom-search-button {
        position: absolute;
        top: 50%;
        right: 10px;
        transform: translateY(-50%);
        border: none;
        background: transparent;
        padding: 0;
        cursor: pointer;
    }

    .right {
        display: flex;
        align-items: center;
        gap: 5px;
    }

    /* Mobile responsive */
    .hamburger {
        background: none;
        border: none;
        cursor: pointer;
    }

    .nav-menu {
        display: flex;
        align-items: center;
    }

    .search-toggle-button {
        display: none;
    }

    .navbar-search {
        display: block;
    }

    /* Seaarch bar mobile overlay */
    .mobile-search-overlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        z-index: 9999;
        width: 100%;
        padding: 10px 15px;
        background: white;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    .mobile-search-overlay.active {
        display: block;
    }

    .overlay-search-form {
        width: 100%;
    }

    .overlay-search-wrapper {
        position: relative;
        width: 100%;
    }

    .overlay-search-input {
        width: 100%;
        height: 42px;
        padding: 0 40px 0 36px;
        border-radius: 8px;
        border: 1px solid #ccc;
        background-color: #F1F1F1;
        font-size: 16px;
    }

    .overlay-search-submit {
        position: absolute;
        left: 10px;
        top: 50%;
        transform: translateY(-50%);
        border: none;
        background: transparent;
        padding: 0;
        cursor: pointer;
    }

    .overlay-search-close {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        border: none;
        background: transparent;
        padding: 0;
        cursor: pointer;
    }

    @media (max-width: 991px) {

        .header {
            padding: 10px 20px;
        }

        .header-container {
            flex-wrap: wrap;
        }

        .nav-menu {
            flex-direction: column;
            width: 100%;
            display: none; /* hidden by default */
            background: white;
            padding: 1rem;
            margin-top: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .nav-menu.active {
            display: flex; /* shown when toggled */
        }

        .navbar-search {
            display: none;
            width: 100%;
            margin-top: 10px;
        }

        .navbar-search.active {
            display: block;
        }

        .search-toggle-button {
            display: block;
            background: none;
            border: none;
            cursor: pointer;
            padding: 0;
        }

        .search-toggle-button.hidden {
            display: none;
        }

        .custom-search-wrapper {
            position: relative;
            width: 100%;
        }

    }

</style>

<div class="header">
    <div class="header-container">
        <div class="left">
            {{-- <a class="logo {{ (empty($navBtnUrl) and empty($navBtnText)) ? '' : '' }}" href="/">
                @if(!empty($generalSettings['logo']))
                    <div class="glitch-wrapper">
                        <img src="{{ $generalSettings['logo'] }}" class="img-cover" alt="site logo">
                    </div>
                @endif
            </a> --}}

            <a href="{{ url('/') }}" class="glitch-link-wrapper">
                <div class="glitch-container">
                    <!-- Glitch Target Disk -->
                    <div class="glitch glitch-disk">
                        <div class="outer-ring"></div>
                        <div class="middle-ring"></div>
                        <div class="center-dot"></div>

                        <!-- Glitch layers -->
                        <span aria-hidden="true" class="glitch-layer"></span>
                        <span aria-hidden="true" class="glitch-layer"></span>
                    </div>

                    <!-- Glitch Text -->
                    <h1 class="glitch">
                        <span aria-hidden="true">SPYBERRYS</span>
                        SPYBERRYS
                        <span aria-hidden="true">SPYBERRYS</span>
                    </h1>
                </div>
            </a>

            <form action="/search" method="get" class="navbar-search position-relative">
                <div class="custom-search-wrapper">
                    <input 
                        type="text" 
                        name="search" 
                        class="custom-search-input" 
                        placeholder="{{ trans('navbar.search_anything') }}" 
                        aria-label="Search"
                    >
                    <button type="submit" class="custom-search-button">
                        <i data-feather="search" width="20" height="20"></i>
                    </button>
                </div>
            </form>
        </div>

        <div class="d-flex align-items-center" style="gap: 20px;">
            <!-- Search Toggle Button (Mobile Only) -->
            <button class="search-toggle-button d-lg-none" id="searchToggleBtn" aria-label="Toggle search">
                <i data-feather="search" width="24" height="24"></i>
            </button>   

            <!-- Hamburger Button -->
            <button class="hamburger d-lg-none" id="hamburgerBtn" aria-label="Toggle menu">
                <i data-feather="menu" width="24" height="24"></i>
            </button>
        </div>

         <div class="right nav-menu" id="mobileNav">
            @if(!empty($categories) and count($categories))
                <li class="nav-item btn-text-primary">
                    <div class="menu-category">
                        <ul>
                            <li class="cursor-pointer user-select-none d-flex xs-categories-toggle text-black">
                                {{ trans('categories.categories') }}

                                <ul class="cat-dropdown-menu">
                                    @foreach($categories as $category)
                                        <li>
                                            <a href="{{ $category->getUrl() }}" class="{{ (!empty($category->subCategories) and count($category->subCategories)) ? 'js-has-subcategory' : '' }}">
                                                <div class="d-flex align-items-center">
                                                    @if(!empty($category->icon))
                                                        <img src="{{ $category->icon }}" class="cat-dropdown-menu-icon mr-10" alt="{{ $category->title }} icon">
                                                    @endif

                                                    {{ $category->title }}
                                                </div>

                                                @if(!empty($category->subCategories) and count($category->subCategories))
                                                    <i data-feather="chevron-right" width="20" height="20" class="d-none d-lg-inline-block ml-10"></i>
                                                    <i data-feather="chevron-down" width="20" height="20" class="d-inline-block d-lg-none"></i>
                                                @endif
                                            </a>

                                            @if(!empty($category->subCategories) and count($category->subCategories))
                                                <ul class="sub-menu" data-simplebar @if((!empty($isRtl) and $isRtl)) data-simplebar-direction="rtl" @endif>
                                                    @foreach($category->subCategories as $subCategory)
                                                        <li>
                                                            <a href="{{ $subCategory->getUrl() }}">
                                                                @if(!empty($subCategory->icon))
                                                                    <img src="{{ $subCategory->icon }}" class="cat-dropdown-menu-icon mr-10" alt="{{ $subCategory->title }} icon">
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

            <li class="nav-item btn-text-primary ">
                <a class="text-black" href="{{ route('classes.index') }}">Top Course</a>
            </li>

            @include(getTemplate().'.includes.shopping-cart-dropdwon')

            @include('web.default.includes.top_nav.user_menu')
        </div>
    </div>
</div>

<!-- Fullscreen Mobile Search Overlay -->
<div class="mobile-search-overlay" id="mobileSearchOverlay">
    <form action="/search" method="get" class="overlay-search-form">
        <div class="overlay-search-wrapper">
            <input 
                type="text" 
                name="search" 
                class="overlay-search-input" 
                placeholder="{{ trans('navbar.search_anything') }}" 
                aria-label="Search"
            >
            <button type="submit" class="overlay-search-submit">
                <i data-feather="search" width="20" height="20"></i>
            </button>
            <button type="button" class="overlay-search-close" id="mobileSearchCloseBtn">
                <i data-feather="x" width="24" height="24"></i>
            </button>
        </div>
    </form>
</div>

@push('scripts_bottom')
    <script src="/assets/default/js/parts/navbar.min.js"></script>
@endpush

{{-- Header sticky --}}
<script>
    document.addEventListener("DOMContentLoaded", function () {
    feather.replace();

    const hamburgerBtn = document.getElementById("hamburgerBtn");
    const mobileNav = document.getElementById("mobileNav");
    const header = document.querySelector(".header");

    const searchToggleBtn = document.getElementById("searchToggleBtn");
    const mobileSearchOverlay = document.getElementById("mobileSearchOverlay");
    const mobileSearchCloseBtn = document.getElementById("mobileSearchCloseBtn");

    if (hamburgerBtn && mobileNav) {
        hamburgerBtn.addEventListener("click", function () {
            mobileNav.classList.toggle("active");
        });
    }

    if (searchToggleBtn && mobileSearchOverlay) {
        searchToggleBtn.addEventListener("click", function () {
            mobileSearchOverlay.classList.add("active");

            // Optional: Focus the input
            const input = mobileSearchOverlay.querySelector('input');
            if (input) input.focus();
        });
    }

    if (mobileSearchCloseBtn) {
        mobileSearchCloseBtn.addEventListener("click", function () {
            mobileSearchOverlay.classList.remove("active");
        });
    }

    window.addEventListener("scroll", function () {
        if (window.scrollY > 10) {
            header.classList.add("scrolled");
        } else {
            header.classList.remove("scrolled");
        }
    });
});
</script>