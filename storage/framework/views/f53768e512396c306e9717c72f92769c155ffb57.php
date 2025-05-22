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
            <a class="logo <?php echo e((empty($navBtnUrl) and empty($navBtnText)) ? '' : ''); ?>" href="/">
                <?php if(!empty($generalSettings['logo'])): ?>
                    <div class="glitch-wrapper">
                        <img src="<?php echo e($generalSettings['logo']); ?>" class="img-cover" alt="site logo">
                    </div>
                <?php endif; ?>
            </a>

        

<svg width="50" height="200" viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg" aria-label="Horror RGB Glitch Logo with Rotation and Glow">
  <defs>
    <filter id="glitchEffect" x="-100%" y="-100%" width="300%" height="300%">
      <!-- RGB Channels -->
      <feColorMatrix in="SourceGraphic" type="matrix" values="1 0 0 0 0  0 0 0 0 0  0 0 0 0 0  0 0 0 1 0" result="red"/>
      <feOffset in="red" dx="-1" dy="0" result="rShift">
        <animate attributeName="dx" values="-1;1;-2;2;0" dur="0.15s" repeatCount="indefinite"/>
      </feOffset>

      <feColorMatrix in="SourceGraphic" type="matrix" values="0 0 0 0 0  0 1 0 0 0  0 0 0 0 0  0 0 0 1 0" result="green"/>
      <feOffset in="green" dx="1" dy="0" result="gShift">
        <animate attributeName="dx" values="1;-1;2;-2;0" dur="0.17s" repeatCount="indefinite"/>
      </feOffset>

      <feColorMatrix in="SourceGraphic" type="matrix" values="0 0 0 0 0  0 0 0 0 0  0 0 1 0 0  0 0 0 1 0" result="blue"/>
      <feOffset in="blue" dx="0" dy="2" result="bShift">
        <animate attributeName="dy" values="2;-2;1;-1;0" dur="0.13s" repeatCount="indefinite"/>
      </feOffset>

      <!-- Merge RGB shifts -->
      <feMerge result="merged">
        <feMergeNode in="rShift"/>
        <feMergeNode in="gShift"/>
        <feMergeNode in="bShift"/>
      </feMerge>

      <!-- Add glow -->
      <feGaussianBlur in="merged" stdDeviation="1.5" result="blurred"/>
      <feMerge>
        <feMergeNode in="blurred"/>
        <feMergeNode in="merged"/>
      </feMerge>
    </filter>
  </defs>

  <g filter="url(#glitchEffect)">
    <g>
      <animateTransform attributeName="transform" type="rotate"
        dur="0.3s" repeatCount="indefinite"
        values="0 100 100; 3 100 100; -3 100 100; 1 100 100; -1 100 100; 0 100 100"/>

      <circle cx="100" cy="100" r="80" fill="none" stroke="#fff" stroke-width="16"/>
      <circle cx="100" cy="100" r="35" fill="#fff"/>
    </g>
  </g>
</svg>

            <form action="/search" method="get" class="navbar-search position-relative">
                <div class="custom-search-wrapper">
                    <input 
                        type="text" 
                        name="search" 
                        class="custom-search-input" 
                        placeholder="<?php echo e(trans('navbar.search_anything')); ?>" 
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
            <?php if(!empty($categories) and count($categories)): ?>
                <li class="">
                    <div class="menu-category">
                        <ul>
                            <li class="cursor-pointer user-select-none d-flex xs-categories-toggle text-black">
                                <?php echo e(trans('categories.categories')); ?>


                                <ul class="cat-dropdown-menu">
                                    <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <li>
                                            <a href="<?php echo e($category->getUrl()); ?>" class="<?php echo e((!empty($category->subCategories) and count($category->subCategories)) ? 'js-has-subcategory' : ''); ?>">
                                                <div class="d-flex align-items-center">
                                                    <?php if(!empty($category->icon)): ?>
                                                        <img src="<?php echo e($category->icon); ?>" class="cat-dropdown-menu-icon mr-10" alt="<?php echo e($category->title); ?> icon">
                                                    <?php endif; ?>

                                                    <?php echo e($category->title); ?>

                                                </div>

                                                <?php if(!empty($category->subCategories) and count($category->subCategories)): ?>
                                                    <i data-feather="chevron-right" width="20" height="20" class="d-none d-lg-inline-block ml-10"></i>
                                                    <i data-feather="chevron-down" width="20" height="20" class="d-inline-block d-lg-none"></i>
                                                <?php endif; ?>
                                            </a>

                                            <?php if(!empty($category->subCategories) and count($category->subCategories)): ?>
                                                <ul class="sub-menu" data-simplebar <?php if((!empty($isRtl) and $isRtl)): ?> data-simplebar-direction="rtl" <?php endif; ?>>
                                                    <?php $__currentLoopData = $category->subCategories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $subCategory): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <li>
                                                            <a href="<?php echo e($subCategory->getUrl()); ?>">
                                                                <?php if(!empty($subCategory->icon)): ?>
                                                                    <img src="<?php echo e($subCategory->icon); ?>" class="cat-dropdown-menu-icon mr-10" alt="<?php echo e($subCategory->title); ?> icon">
                                                                <?php endif; ?>

                                                                <?php echo e($subCategory->title); ?>

                                                            </a>
                                                        </li>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </ul>
                                            <?php endif; ?>
                                        </li>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </li>
            <?php endif; ?>

            <li class="nav-item">
                <a class="text-black" href="<?php echo e(route('classes.index')); ?>">Top Course</a>
            </li>

            <?php echo $__env->make('web.default.includes.top_nav.user_menu', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

            <?php echo $__env->make(getTemplate().'.includes.shopping-cart-dropdwon', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
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
                placeholder="<?php echo e(trans('navbar.search_anything')); ?>" 
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

<?php $__env->startPush('scripts_bottom'); ?>
    <script src="/assets/default/js/parts/navbar.min.js"></script>
<?php $__env->stopPush(); ?>


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
</script><?php /**PATH C:\laragon\www\spyberrys\resources\views/web/default/includes/header.blade.php ENDPATH**/ ?>