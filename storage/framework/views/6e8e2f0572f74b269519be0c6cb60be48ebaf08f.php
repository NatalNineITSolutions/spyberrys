<div id="topFilters">
    

    <div class="results">
        <h4 style="font-size: 15px;">
            Showing <?php echo e($coursesCount); ?> 
            <?php if($coursesCount == 1): ?>
                Result
            <?php else: ?>
                Results
            <?php endif; ?>
        </h4>

        <div class="filters">

            <div class="d-flex align-items-center" style="gap: 10px;">
                <label for="sort" class="mb-0 d-lg-block d-md-none d-none" style="font-size: 13px; font-weight:500;">Sort By: </label>
                <select name="sort" id="sort" class="filter">
                    <option disabled selected><?php echo e(trans('public.sort_by')); ?></option>
                    <option value=""><?php echo e(trans('public.all')); ?></option>
                    <option value="newest" <?php if(request()->get('sort', null) == 'newest'): ?> selected="selected" <?php endif; ?>><?php echo e(trans('public.newest')); ?></option>
                    <option value="expensive" <?php if(request()->get('sort', null) == 'expensive'): ?> selected="selected" <?php endif; ?>><?php echo e(trans('public.expensive')); ?></option>
                    <option value="inexpensive" <?php if(request()->get('sort', null) == 'inexpensive'): ?> selected="selected" <?php endif; ?>><?php echo e(trans('public.inexpensive')); ?></option>
                    <option value="bestsellers" <?php if(request()->get('sort', null) == 'bestsellers'): ?> selected="selected" <?php endif; ?>><?php echo e(trans('public.bestsellers')); ?></option>
                    <option value="best_rates" <?php if(request()->get('sort', null) == 'best_rates'): ?> selected="selected" <?php endif; ?>><?php echo e(trans('public.best_rates')); ?></option>
                </select>
            </div>            

            <div class="checkbox-button primary-selected d-lg-block d-md-none d-none">
                <input type="radio" name="card" id="gridView" value="grid" <?php if(empty(request()->get('card')) or request()->get('card') == 'grid'): ?> checked="checked" <?php endif; ?>>
                <label for="gridView" class="bg-white border-0 mb-0">
                    <i data-feather="grid" width="25" height="25" class="<?php if(empty(request()->get('card')) or request()->get('card') == 'grid'): ?> icon <?php endif; ?>"></i>
                </label>
            </div>

            <div class="checkbox-button primary-selected ml-10 d-lg-block d-md-none d-none">
                <input type="radio" name="card" id="listView" value="list" <?php if(!empty(request()->get('card')) and request()->get('card') == 'list'): ?> checked="checked" <?php endif; ?>>
                <label for="listView" class="bg-white border-0 mb-0 p-0">
                    <i data-feather="list" width="25" height="25" class="<?php echo e((!empty(request()->get('card')) and request()->get('card') == 'list') ? 'text-primary' : ''); ?>"></i>
                </label>
            </div>
        </div>
    </div>
</div>
<?php /**PATH C:\laragon\www\spyberrys\resources\views/web/default/pages/includes/top_filters.blade.php ENDPATH**/ ?>