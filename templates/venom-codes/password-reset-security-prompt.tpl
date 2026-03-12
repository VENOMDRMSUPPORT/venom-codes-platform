{if $errorMessage}
    {include file="$template/includes/alert.tpl" type="error" msg=$errorMessage textcenter=true}
{/if}

<div class="mb-4 venom-auth-intro">
    <span class="venom-chip">{lang key='forgotpw'}</span>
    <h6 class="h3 mb-2">{lang key='pwreset'}</h6>
    <p class="text-muted mb-0">{lang key='pwresetsecurityquestionrequired'}</p>
</div>

<form method="post" action="{routePath('password-reset-security-verify')}" class="form-stacked mb-0 venom-auth-reset-form">
    <div class="form-group">
        <label for="inputAnswer">{$securityQuestion}</label>
        <input type="text" name="answer" class="form-control" id="inputAnswer" autofocus>
    </div>

    <div class="form-group text-center">
        <button type="submit" class="btn btn-primary">{lang key='pwresetsubmit'}</button>
    </div>
</form>
