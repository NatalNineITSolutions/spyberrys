<style>

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

    .logo img {
        width: 90px;
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
        gap: 20px;
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
        gap: 20px;
    }

    @media (max-width: 768px) {
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
        }
    }

</style>

<div class="header">
    <div class="container header-container">
        <div class="left">
            <a class="logo {{ (empty($navBtnUrl) and empty($navBtnText)) ? '' : '' }}" href="/">
                @if(!empty($generalSettings['logo']))
                    <img src="{{ $generalSettings['logo'] }}" class="img-cover" alt="site logo">
                @endif
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

         <!-- Hamburger Button -->
        <button class="hamburger d-md-none" id="hamburgerBtn" aria-label="Toggle menu">
            <i data-feather="menu" width="24" height="24"></i>
        </button>

         <div class="right nav-menu" id="mobileNav">
            @if(!empty($categories) and count($categories))
                <li class="">
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

            <li class="nav-item">
                <a class="text-black" href="{{ route('classes.index') }}">Top Course</a>
            </li>

            @include('web.default.includes.top_nav.user_menu')

            @include(getTemplate().'.includes.shopping-cart-dropdwon')
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        feather.replace();

        const hamburgerBtn = document.getElementById("hamburgerBtn");
        const mobileNav = document.getElementById("mobileNav");

        hamburgerBtn.addEventListener("click", function () {
            mobileNav.classList.toggle("active");
        });
    });
</script>
