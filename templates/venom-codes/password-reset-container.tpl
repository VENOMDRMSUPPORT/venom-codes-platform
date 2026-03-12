{assign var="authTitle" value={lang key='pwreset'}}
{assign var="authSubtitle" value={lang key='pwresetemailneeded'}}
{assign var="authBadge" value={lang key='forgotpw'}}

{capture name="authContent"}
    {if $loggedin && $innerTemplate}
        {include file="$template/includes/alert.tpl" type="error" msg="{lang key='noPasswordResetWhenLoggedIn'}" textcenter=true}
    {else}
        {if $successMessage}
            {include file="$template/includes/alert.tpl" type="success" msg=$successTitle textcenter=true}
            <p class="text-muted mb-0">{$successMessage}</p>
        {else}
            {if $errorMessage}
                {include file="$template/includes/alert.tpl" type="error" msg=$errorMessage textcenter=true}
            {/if}
            {if $innerTemplate}
                {include file="$template/password-reset-$innerTemplate.tpl"}
            {/if}
        {/if}
    {/if}
{/capture}

{capture name="authAside"}
    <div class="venom-plan-card h-100">
        <h2 class="h5 font-weight-bold mb-2">Recovery Steps</h2>
        <p class="text-muted small mb-0">Validate your account identity, pass verification prompts, and set a new secure password to restore client-area access.</p>
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
