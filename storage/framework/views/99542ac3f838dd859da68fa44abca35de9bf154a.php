

<?php $__env->startSection('css'); ?>
    <style>
        .container {
            display: flex;
            flex-direction: column
        }

        .submit {
            align-self: flex-end;
            margin-top: 25px;
            padding: 10px 20px;
            background-color: #6777EF;
            border: none;
            outline: none;
            border-radius: 25px;
            color: white;
            font-size: 15px;
            font-weight: 600;
        }
    </style>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="container" style="margin-top: 3rem;">
        <form action="<?php echo e(route('sandbox.store')); ?>" method="POST">
            <?php echo csrf_field(); ?>
            <div class="row">
                <div class="col-6">
                    <div class="form-group">
                        <label for="apiKey" class="input-label">API Key</label>
                        <input type="text" class="form-control" id="apiKey" name="apiKey" placeholder="Enter API Key">
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="secretKey" class="input-label">Secret Key</label>
                        <input type="text" class="form-control" id="secretKey" name="secretKey" placeholder="Enter Secret Key">
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="version" class="input-label">Version</label>
                        <input type="text" class="form-control" id="version" name="version" placeholder="Enter Version">
                    </div>
                </div>
            </div>
            <button type="submit" class="submit">Submit</button>
        </form>
        
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\spyberrys\resources\views/admin/sandbox_configuration.blade.php ENDPATH**/ ?>