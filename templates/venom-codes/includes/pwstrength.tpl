{* VENOM CODES — Password Strength Meter Component *}

<br />

<div class="progress mb-3" id="passwordStrengthBar" style="height: 0.5rem; border-radius: 0.5rem; background: var(--gray-200, #e5e7eb); overflow: hidden;">
    <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="transition: width 0.3s ease, background-color 0.3s ease;">
        <span class="sr-only">{lang key='pwstrengthrating'}: 0%</span>
    </div>
</div>

<div class="alert alert-info" style="position: relative; border-radius: 0.75rem; border: 1px solid; padding: 1rem; background: #eff6ff; border-color: #bfdbfe; color: #1e40af;">
    <div style="display: flex; gap: 0.75rem;">
        <div style="flex-shrink: 0; margin-top: 0.125rem;">
            <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="16" x2="12" y2="12"/><line x1="12" y1="8" x2="12.01" y2="8"/></svg>
        </div>
        <div style="flex: 1; font-size: 0.875rem;">
            <small>{lang key='passwordtips' maximum_length=$maximumPasswordLength}</small>
        </div>
    </div>
</div>

<script>
    jQuery("#inputNewPassword1").keyup(function() {
        var pwStrengthErrorThreshold = {if isset($pwStrengthErrorThreshold)}{$pwStrengthErrorThreshold}{else}50{/if},
            pwStrengthWarningThreshold = {if isset($pwStrengthWarningThreshold)}{$pwStrengthWarningThreshold}{else}75{/if},
            progressBar = jQuery("#passwordStrengthBar .progress-bar"),
            pw = jQuery("#inputNewPassword1").val(),
            pwlength = (pw.length),
            maximumPasswordLength = {$maximumPasswordLength};
        if (pwlength > 5) {
            pwlength = 5;
        }
        var numnumeric = pw.replace(/[0-9]/g,""),
            numeric = (pw.length - numnumeric.length);
        if (numeric > 3) {
            numeric = 3;
        }
        var symbols = pw.replace(/\W/g,""),
            numsymbols = (pw.length-symbols.length);
        if (numsymbols > 3) {
            numsymbols = 3;
        }
        var numupper = pw.replace(/[A-Z]/g,""),
            upper = (pw.length - numupper.length);
        if (upper > 3) {
            upper = 3;
        }
        var pwstrength = ((pwlength * 10) - 20) + (numeric * 10) + (numsymbols * 15) + (upper * 10);
        if (pwstrength < 0) {
            pwstrength = 0;
        }
        if (pwstrength > 100) {
            pwstrength = 100;
        }

        jQuery(this).removeClass('is-invalid is-warning is-valid');
        progressBar.removeClass("bg-danger bg-warning bg-success").css("width", pwstrength + "%").attr('aria-valuenow', pwstrength);
        jQuery("#passwordStrengthBar .progress-bar .sr-only").html('{lang|addslashes key='pwstrengthrating'}: ' + pwstrength + '%');
        if ((pwstrength < pwStrengthErrorThreshold) || pw.length > maximumPasswordLength) {
            jQuery(this).addClass('is-invalid').css({
                'border-color': '#dc2626',
                'box-shadow': '0 0 0 3px rgba(220, 38, 38, 0.1)'
            });
            progressBar.addClass("bg-danger").css('background', 'linear-gradient(90deg, #dc2626 0%, #991b1b 100%)');
        } else if (pwstrength < pwStrengthWarningThreshold) {
            jQuery(this).addClass('is-warning').css({
                'border-color': '#f59e0b',
                'box-shadow': '0 0 0 3px rgba(245, 158, 11, 0.1)'
            });
            progressBar.addClass("bg-warning").css('background', 'linear-gradient(90deg, #f59e0b 0%, #d97706 100%)');
        } else {
            jQuery(this).addClass('is-valid').css({
                'border-color': '#10b981',
                'box-shadow': '0 0 0 3px rgba(16, 185, 129, 0.1)'
            });
            progressBar.addClass("bg-success").css('background', 'linear-gradient(90deg, #10b981 0%, #059669 100%)');
        }
        validatePassword2();
});

function validatePassword2() {
    var password1 = jQuery("#inputNewPassword1").val(),
        password2Input = jQuery("#inputNewPassword2"),
        password2 = password2Input.val(),
        maximumPasswordLength = {$maximumPasswordLength};
    if (password2 && password1 !== password2) {
        password2Input.removeClass('is-valid')
            .addClass('is-invalid')
            .css({
                'border-color': '#dc2626',
                'box-shadow': '0 0 0 3px rgba(220, 38, 38, 0.1)'
            });
        jQuery("#inputNewPassword2Msg").html(
            '<p class="form-text text-muted" id="nonMatchingPasswordResult" style="color: #dc2626; font-size: 0.875rem; margin-top: 0.5rem;">{"{lang key='pwdoesnotmatch'}"|escape}</p>'
        );
        {if !isset($noDisable)}
            jQuery('input[type="submit"]').attr('disabled', 'disabled');
        {/if}
    } else {
        if (password2 && password1.length <= maximumPasswordLength) {
            password2Input.removeClass('is-invalid')
                .addClass('is-valid')
                .css({
                    'border-color': '#10b981',
                    'box-shadow': '0 0 0 3px rgba(16, 185, 129, 0.1)'
                });
            {if !isset($noDisable)}jQuery('.primary-content input[type="submit"]').removeAttr('disabled');{/if}
        } else {
            password2Input.removeClass('is-valid is-invalid').css({
                'border-color': '',
                'box-shadow': ''
            });
        }
        jQuery("#inputNewPassword2Msg").html('');
    }
}

    jQuery(document).ready(function() {
        {if !isset($noDisable)}
        jQuery('.using-password-strength input[type="submit"]').attr('disabled', 'disabled');
        {/if}
        jQuery("#inputNewPassword2").keyup(function() {
            validatePassword2();
        });
    });
</script>
