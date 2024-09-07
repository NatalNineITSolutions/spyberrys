<p>"Please fill the form below to receive a OTP. Feel free to add as much details as need."</p>
<div class="step-content" id="aadhar-step">
    <div class="form-group">
        <label for="aadhar_number">Aadhar Number</label>
        <input type="text" name="aadhar_number" id="aadhar_number" class="form-control form" maxlength="12" pattern="\d{12}" required>
        <div id="aadhar-error" class="invalid-feedback" style="display: none;">Please enter a valid 12-digit Aadhar number.</div>
    </div>
    <button type="button" class="btn next" onclick="nextStep()">Next</button>
</div><?php /**PATH C:\laragon\www\spyberrys\resources\views/web/default/auth/includes/aadhar_number.blade.php ENDPATH**/ ?>