{assign var="authTitle" value=$pagetitle}
{assign var="authSubtitle" value="Store your new backup code securely for account recovery scenarios."}
{assign var="authBadge" value={lang key='twofactorauth'}}

{capture name="authContent"}
    <div class="card mb-0">
        <div class="card-body px-sm-5 py-5">

            <h3 class="card-title">{lang key='twofactorauth'}</h3>

            {include file="$template/includes/alert.tpl" type="success" msg="{lang key='twofabackupcodereset'}" textcenter=true}

            <h5 class="text-center">{lang key='twofanewbackupcodeis'}</h5>

            <div class="alert alert-warning text-center h4">
                {$newBackupCode}
            </div>

            <p class="text-center">{lang key='twofabackupcodeexpl'}</p>

            <p class="text-center">
                <a href="{routePath('clientarea-home')}" class="btn btn-default">
                    {lang key='continue'} &raquo;
                </a>
            </p>

        </div>
    </div>
{/capture}

{capture name="authAside"}
    <div class="venom-plan-card h-100">
        <h2 class="h5 font-weight-bold mb-2">Backup Code Handling</h2>
        <p class="text-muted small mb-0">This recovery code should be stored in a secure offline location and used only when your primary second-factor device is unavailable.</p>
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
