<div class="providerLinkingFeedback"></div>

{assign var="authTitle" value={lang key='loginbutton'}}
{assign var="authSubtitle" value={lang key='userLogin.signInToContinue'}}
{assign var="authBadge" value={lang key='loginbutton'}}

{capture name="authContent"}
    <form method="post" action="{routePath('login-validate')}" class="login-form venom-auth-login-form" role="form">
        {if isset($token) && $token}
            <input type="hidden" name="token" value="{$token}" />
        {/if}
        {if isset($redirect) && $redirect}
            <input type="hidden" name="redirect" value="{$redirect}" />
        {elseif isset($loginurlredirect) && $loginurlredirect}
            <input type="hidden" name="redirect" value="{$loginurlredirect}" />
        {/if}

        {include file="$template/includes/flashmessage.tpl"}

        <div class="form-group venom-auth-form-group">
            <label for="inputEmail" class="form-control-label font-weight-bold">{lang key='clientareaemail'}</label>
            <div class="input-group input-group-merge venom-auth-input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                </div>
                <input type="email" class="form-control" name="username" id="inputEmail" placeholder="admin@venom.io" autofocus>
            </div>
        </div>

        <div class="form-group mb-4 focused venom-auth-form-group">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <label for="inputPassword" class="form-control-label font-weight-bold mb-0">{lang key='clientareapassword'}</label>
                <a href="{routePath('password-reset-begin')}" class="small font-weight-bold venom-auth-inline-link">{lang key='forgotpw'}</a>
            </div>
            <div class="input-group input-group-merge venom-auth-input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                </div>
                <input type="password" class="form-control pw-input" name="password" id="inputPassword" placeholder="{lang key='clientareapassword'}" autocomplete="off">
                <div class="input-group-append">
                    <button class="btn btn-default btn-reveal-pw" type="button" tabindex="-1">
                        <i class="fas fa-eye"></i>
                    </button>
                </div>
            </div>
        </div>

        {if $captcha->isEnabled()}
            <div class="mb-4">
                {include file="$template/includes/captcha.tpl"}
            </div>
        {/if}

        <div class="d-flex flex-column flex-sm-row align-items-sm-center justify-content-sm-between venom-auth-form-actions">
            <label class="form-check mb-3 mb-sm-0 venom-auth-remember">
                <input type="checkbox" class="form-check-input" name="rememberme" />
                <span class="form-check-label">{lang key='loginrememberme'}</span>
            </label>
            <button id="login" type="submit" class="btn venom-btn venom-btn--solid{$captcha->getButtonClass($captchaForm)}">
                {lang key='loginbutton'}
            </button>
        </div>
    </form>

    <div class="mt-4 pt-3 border-top venom-auth-register">
        <small class="text-muted">{lang key='userLogin.notRegistered'}</small>
        <a href="{$WEB_ROOT}/register.php" class="small font-weight-bold ml-1">{lang key='userLogin.createAccount'}</a>
    </div>
{/capture}

{capture name="linkedAccountsContent"}
    {include file="$template/includes/linkedaccounts.tpl" linkContext="login" customFeedback=true}
{/capture}

{capture name="authAside"}
    <div class="venom-plan-card venom-auth-trust-card">
        <h2 class="h5 font-weight-bold mb-2">Secure Operations Workspace</h2>
        <p class="text-muted small mb-3">Access service controls, billing signals, and support workflows in one authenticated client console.</p>
        <ul class="list-unstyled mb-0">
            <li><i class="fas fa-check-circle fa-fw"></i> Multi-account ready access routing</li>
            <li><i class="fas fa-check-circle fa-fw"></i> License and infrastructure telemetry</li>
            <li><i class="fas fa-check-circle fa-fw"></i> Enterprise support escalation path</li>
        </ul>
        <div class="d-flex flex-wrap mt-3">
            <a href="{$WEB_ROOT}/register.php" class="btn btn-default btn-sm mr-2 mb-2">Create Account</a>
            <a href="{$WEB_ROOT}/contact.php" class="btn btn-default btn-sm mb-2">Contact Team</a>
        </div>
    </div>
    {if $smarty.capture.linkedAccountsContent|trim}
        <div class="venom-plan-card venom-auth-linked-card mt-3">
            <h2 class="h5 font-weight-bold mb-2">{lang key='remoteAuthn.titleLinkedAccounts'}</h2>
            <p class="text-muted small mb-4">{lang key='remoteAuthn.saveTimeByLinking'}</p>
            {$smarty.capture.linkedAccountsContent}
        </div>
    {/if}
{/capture}

{include
    file="$template/includes/authlayout.tpl"
    authBadge=$authBadge
    authTitle=$authTitle
    authSubtitle=$authSubtitle
    authContent=$smarty.capture.authContent
    authAside=$smarty.capture.authAside
}
