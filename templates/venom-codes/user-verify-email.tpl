{assign var="authTitle" value=$pagetitle}
{assign var="authSubtitle" value="Confirm your account email status and continue secure access setup."}
{assign var="authBadge" value="Email Verification"}

{capture name="authContent"}
    <div class="card mb-0">
        <div class="card-body px-sm-5 py-5 text-center">
            {if $success}
                <h2>
                    <i class="fas fa-check fa-2x text-success"></i><br>
                    {lang key="emailVerification.success"}
                </h2>
            {elseif $expired}
                <h2>
                    <i class="far fa-clock fa-2x text-warning"></i><br>
                    {lang key="emailVerification.expired"}
                </h2>

                {if $loggedin}
                    <button class="btn btn-default btn-lg btn-resend-verify-email" data-email-sent="{lang key='emailSent'}" data-error-msg="{lang key='error'}" data-uri="{routePath('user-email-verification-resend')}">
                        {lang key='resendEmail'}
                    </button>
                {else}
                    <p>{lang key="emailVerification.loginToRequest"}</p>
                {/if}
            {else}
                <h2>
                    <i class="fas fa-times fa-2x text-danger"></i><br>
                    {lang key="emailVerification.notFound"}
                </h2>

                {if !$loggedin}
                    <p>{lang key="emailVerification.loginToRequest"}</p>
                {/if}
            {/if}

            <a href="{routePath('login-index')}" class="btn btn-primary btn-lg mt-4">
                {lang key="orderForm.continueToClientArea"}
                &nbsp;
                <i class="fa fa-arrow-right"></i>
            </a>
        </div>
    </div>
{/capture}

{capture name="authAside"}
    <div class="venom-plan-card h-100">
        <h2 class="h5 font-weight-bold mb-2">Verification Controls</h2>
        <p class="text-muted small mb-0">Use resend and verification prompts to confirm account ownership before continuing into protected client operations.</p>
    </div>
{/capture}

{include
    file="$template/includes/authlayout.tpl"
    authBadge=$authBadge
    authTitle=$authTitle
    authSubtitle=$authSubtitle
    authContent=$smarty.capture.authContent
    authAside=$smarty.capture.authAside
}
