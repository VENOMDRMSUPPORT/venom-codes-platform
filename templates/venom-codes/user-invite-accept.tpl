<script src="{$BASE_PATH_JS}/PasswordStrength.js"></script>
<script>
    window.langPasswordStrength = "{lang key="pwstrength"}";
    window.langPasswordWeak = "{lang key="pwstrengthweak"}";
    window.langPasswordModerate = "{lang key="pwstrengthmoderate"}";
    window.langPasswordStrong = "{lang key="pwstrengthstrong"}";
    jQuery(document).ready(function() {
        jQuery("#inputPassword").keyup(registerFormPasswordStrengthFeedback);
    });
</script>

<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">Identity Access</span>
            <h1 class="h3 font-weight-bold mb-2">
                {if $invite}
                    {if $loggedin}
                        Invitation Ready for Acceptance
                    {else}
                        Invitation Access Setup
                    {/if}
                {else}
                    Invitation Status
                {/if}
            </h1>
            <p class="text-muted mb-0">
                {if $invite}
                    Review invitation details and complete the required access step to join the requested client account.
                {else}
                    The invitation link is unavailable or invalid for this account context.
                {/if}
            </p>
        </div>
        <div class="col-12 col-lg-4">
            <div class="d-flex flex-wrap justify-content-lg-end">
                <a href="{$WEB_ROOT}/index.php" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-home fa-fw"></i>
                    {lang key='returnhome'}
                </a>
                {if !$loggedin}
                    <a href="{$WEB_ROOT}/login.php" class="btn btn-default btn-sm mb-2">
                        <i class="fas fa-sign-in-alt fa-fw"></i>
                        {lang key='login'}
                    </a>
                {/if}
            </div>
        </div>
    </div>
</div>

{if $invite}
    <div class="row mb-4">
        <div class="col-12 col-md-6 mb-3">
            <div class="venom-plan-card h-100">
                <div class="d-flex align-items-center justify-content-between mb-2">
                    <h3 class="h6 font-weight-bold mb-0">Target Account</h3>
                    <i class="fas fa-building text-muted"></i>
                </div>
                <p class="h5 font-weight-bold mb-1">{$invite->getClientName()}</p>
                <p class="small text-muted mb-0">Access will be granted to this client account after invitation validation.</p>
            </div>
        </div>
        <div class="col-12 col-md-6 mb-3">
            <div class="venom-plan-card h-100">
                <div class="d-flex align-items-center justify-content-between mb-2">
                    <h3 class="h6 font-weight-bold mb-0">Invitation Source</h3>
                    <i class="fas fa-user-shield text-muted"></i>
                </div>
                <p class="h5 font-weight-bold mb-1">{$invite->getSenderName()}</p>
                <p class="small text-muted mb-0">Invitation sender associated with this account access request.</p>
            </div>
        </div>
    </div>
{/if}

<div class="card{if $loggedin || !$invite} mw-750{/if} mb-4">
    <div class="card-body px-sm-5 py-5 text-center">
        {if $invite}
            <h2 class="h3 mb-4">
                <i class="fas fa-info-circle text-primary"></i>
                <span class="d-block mt-3">{lang key="accountInvite.youHaveBeenInvited" clientName=$invite->getClientName()}</span>
            </h2>

            {include file="$template/includes/flashmessage.tpl"}

            <p>{lang key="accountInvite.givenAccess" senderName=$invite->getSenderName() clientName=$invite->getClientName() ot="<strong>" ct="</strong>"}</p>

            {if $loggedin}
                <p>{lang key="accountInvite.inviteAcceptLoggedIn"}</p>
            {else}
                <p>{lang key="accountInvite.inviteAcceptLoggedOut"}</p>
            {/if}

            {if $loggedin}
                <form method="post" action="{routePath('invite-validate', $invite->token)}">
                    <p class="mb-0">
                        <button type="submit" class="btn venom-btn venom-btn--solid">
                            {lang key="accountInvite.accept"}
                        </button>
                    </p>
                </form>
            {else}
                <div class="row">
                    <div class="col-lg-6">
                        <div class="invite-box venom-plan-card h-100 text-left">
                            <h2 class="h4 mb-3">{lang key="login"}</h2>
                            <form method="post" action="{routePath('login-validate')}" class="text-left">
                                <div class="form-group">
                                    <label for="inputLoginEmail">{lang key="loginemail"}</label>
                                    <input type="email" name="username" class="form-control" id="inputLoginEmail" placeholder="{lang key="loginemail"}" value="{$formdata.email}">
                                </div>
                                <div class="form-group">
                                    <label for="inputLoginPassword">{lang key="loginpassword"}</label>
                                    <input type="password" name="password" class="form-control" id="inputLoginPassword" placeholder="{lang key="loginpassword"}">
                                </div>
                                {include file="$template/includes/captcha.tpl" captchaForm=$captchaForm containerClass="form-group row" nocache}
                                <div class="text-center">
                                    <button type="submit" class="btn btn-default{$captcha->getButtonClass($captchaForm)} btn-block">
                                        {lang key="login"}
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="invite-box venom-plan-card h-100 text-left mt-4 mt-lg-0">
                            <h2 class="h4 mb-3">{lang key="register"}</h2>
                            <form method="post" action="{routePath('invite-validate', $invite->token)}" class="text-left">
                                <div class="form-group">
                                    <label for="inputFirstName">{lang key="clientareafirstname"}</label>
                                    <input type="text" class="form-control" name="firstname" id="inputFirstName" placeholder="{lang key="clientareafirstname"}" value="{$formdata.firstname}">
                                </div>
                                <div class="form-group">
                                    <label for="inputLastName">{lang key="clientarealastname"}</label>
                                    <input type="text" class="form-control" name="lastname" id="inputLastName" placeholder="{lang key="clientarealastname"}" value="{$formdata.lastname}">
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail">{lang key="loginemail"}</label>
                                    <input type="email" name="email" class="form-control" id="inputEmail" placeholder="{lang key="loginemail"}" value="{$formdata.email}">
                                </div>
                                <div class="form-group has-feedback">
                                    <label for="inputPassword">{lang key="loginpassword"}</label>
                                    <div class="input-group">
                                        <input type="password" class="form-control" name="password" id="inputPassword" data-error-threshold="{$pwStrengthErrorThreshold}" data-warning-threshold="{$pwStrengthWarningThreshold}" placeholder="{lang key="loginpassword"}" autocomplete="off" />
                                        <div class="input-group-append">
                                            <button type="button" class="btn btn-default generate-password" data-targetfields="inputPassword">
                                                {lang key="generatePassword.btnShort"}
                                            </button>
                                        </div>
                                    </div>

                                    <div class="password-strength-meter">
                                        <div class="progress mt-3" style="height: 10px;">
                                            <div class="progress-bar bg-success bg-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="passwordStrengthMeterBar">
                                            </div>
                                        </div>
                                        <p class="text-center small text-muted" id="passwordStrengthTextLabel">{lang key="pwstrength"}: {lang key="pwstrengthenter"}</p>
                                    </div>
                                </div>
                                {if $accept_tos}
                                    <div class="form-group text-center">
                                        <label class="form-check form-check-inline">
                                            <input type="checkbox" class="form-check-input" name="accept" id="accept" />
                                            &nbsp;
                                            {lang key='ordertosagreement'}
                                            <a href="{$tos_url}" target="_blank">{lang key='ordertos'}</a>
                                        </label>
                                    </div>
                                {/if}
                                {include file="$template/includes/captcha.tpl" captchaForm=$captchaFormRegister containerClass="form-group row" nocache}
                                <div class="text-center">
                                    <button type="submit" class="btn btn-default{$captcha->getButtonClass($captchaFormRegister)} btn-block">
                                        {lang key="register"}
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            {/if}
        {else}
            <h2 class="h3 mb-3">
                <i class="fas fa-times-circle text-danger"></i>
                <span class="d-block mt-3">{lang key="accountInvite.notFound"}</span>
            </h2>

            <p class="pt-3 mb-0">{lang key="accountInvite.contactAdministrator"}</p>
        {/if}
    </div>
</div>
