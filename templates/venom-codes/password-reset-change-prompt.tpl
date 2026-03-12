<div class="mb-4 venom-auth-intro">
    <span class="venom-chip">{lang key='forgotpw'}</span>
    <h6 class="h3 mb-2">{lang key='pwreset'}</h6>
    <p class="text-muted mb-0">{lang key='pwresetenternewpw'}</p>
</div>

<form class="using-password-strength venom-auth-reset-form" method="POST" action="{routePath('password-reset-change-perform')}">
    <input type="hidden" name="answer" id="answer" value="{$securityAnswer}" />

    <div id="newPassword1" class="form-group has-feedback">
        <label class="control-label" for="inputNewPassword1">{lang key='newpassword'}</label>
        <input type="password" name="newpw" id="inputNewPassword1" class="form-control" autocomplete="off" />
    </div>

    <div id="newPassword2" class="form-group has-feedback">
        <label class="control-label" for="inputNewPassword2">{lang key='confirmnewpassword'}</label>
        <input type="password" name="confirmpw" id="inputNewPassword2" class="form-control" autocomplete="off" />
        <div id="inputNewPassword2Msg"></div>
    </div>

    <div class="form-group">
        <label class="control-label">{lang key='pwstrength'}</label>
        {include file="$template/includes/pwstrength.tpl" maximumPasswordLength=$maximumPasswordLength}
    </div>

    <div class="form-group">
        <div class="text-center">
            <input class="btn btn-primary" type="submit" name="submit" value="{lang key='clientareasavechanges'}" />
            <input class="btn btn-default" type="reset" value="{lang key='cancel'}" />
        </div>
    </div>

</form>
