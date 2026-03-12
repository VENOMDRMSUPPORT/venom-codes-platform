{include file="$template/includes/flashmessage.tpl"}

<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">Account Security</span>
            <h1 class="h3 font-weight-bold mb-2">{lang key='sidebars.viewAccount.changePassword'}</h1>
            <p class="text-muted mb-0">Rotate account credentials with enforced password policy and real-time strength validation.</p>
        </div>
        <div class="col-12 col-lg-4">
            <div class="d-flex flex-wrap justify-content-lg-end">
                <a href="clientarea.php?action=details" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-id-card fa-fw"></i>
                    Profile
                </a>
                <a href="{routePath('account-users')}" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-users-cog fa-fw"></i>
                    Users
                </a>
                <a href="{routePath('user-security')}" class="btn btn-default btn-sm mb-2">
                    <i class="fas fa-shield-alt fa-fw"></i>
                    Security
                </a>
            </div>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-12 col-md-6 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Credential Rotation</h3>
                <i class="fas fa-key text-muted"></i>
            </div>
            <p class="small text-muted mb-0">Use strong, unique credentials and rotate passwords regularly to reduce account takeover exposure.</p>
        </div>
    </div>
    <div class="col-12 col-md-6 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Best Practice</h3>
                <i class="fas fa-user-shield text-muted"></i>
            </div>
            <p class="small text-muted mb-0">Combine password rotation with two-factor authentication from the security settings page.</p>
        </div>
    </div>
</div>

<div class="card mb-4">
    <div class="card-header d-flex flex-column flex-lg-row align-items-lg-center justify-content-lg-between">
        <h3 class="card-title m-0 mb-2 mb-lg-0">
            <i class="fas fa-lock"></i>
            Password Update Form
        </h3>
        <small class="text-muted">Current password validation is required before applying changes.</small>
    </div>
    <div class="card-body">
        <form class="using-password-strength" method="post" action="{routePath('user-password')}" role="form">
            <input type="hidden" name="submit" value="true" />
            <div class="form-group row">
                <label for="inputExistingPassword" class="col-xl-4 col-form-label">{lang key='existingpassword'}</label>
                <div class="col-xl-5">
                    <input type="password" class="form-control" name="existingpw" id="inputExistingPassword" autocomplete="off" />
                </div>
            </div>
            <div id="newPassword1" class="form-group has-feedback row">
                <label for="inputNewPassword1" class="col-xl-4 col-form-label">{lang key='newpassword'}</label>
                <div class="col-xl-5">
                    <input type="password" class="form-control" name="newpw" id="inputNewPassword1" autocomplete="off" />
                    {include file="$template/includes/pwstrength.tpl" maximumPasswordLength=$maximumPasswordLength}
                </div>
                <div class="col-xl-3 mt-3 mt-xl-0">
                    <button type="button" class="btn btn-default btn-block generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
                        {lang key='generatePassword.btnLabel'}
                    </button>
                </div>
            </div>
            <div id="newPassword2" class="form-group has-feedback row">
                <label for="inputNewPassword2" class="col-xl-4 col-form-label">{lang key='confirmnewpassword'}</label>
                <div class="col-xl-5">
                    <input type="password" class="form-control" name="confirmpw" id="inputNewPassword2" autocomplete="off" />
                    <div id="inputNewPassword2Msg"></div>
                </div>
            </div>
            <input class="btn btn-primary" type="submit" value="{lang key='clientareasavechanges'}" />
            <input class="btn btn-default" type="reset" value="{lang key='cancel'}" />
        </form>
    </div>
</div>
