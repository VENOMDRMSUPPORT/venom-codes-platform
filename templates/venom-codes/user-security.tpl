{include file="$template/includes/flashmessage.tpl"}

{assign var="linkedProvidersCount" value=0}
{if $linkableProviders}
    {foreach $linkableProviders as $provider}
        {assign var="linkedProvidersCount" value=$linkedProvidersCount+1}
    {/foreach}
{/if}
{assign var="securityQuestionCount" value=$securityQuestions->count()}

<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">Account Security</span>
            <h1 class="h3 font-weight-bold mb-2">{lang key='userManagement.settings'}</h1>
            <p class="text-muted mb-0">Manage identity linkage, security verification controls, and two-factor enforcement for your account.</p>
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
                <a href="{routePath('user-password')}" class="btn btn-default btn-sm mb-2">
                    <i class="fas fa-key fa-fw"></i>
                    Password
                </a>
            </div>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-12 col-sm-6 col-lg-4 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Linked Identities</h3>
                <i class="fas fa-link text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$linkedProvidersCount}</p>
            <p class="small text-muted mb-0">External authentication providers currently available for secure sign-in linking.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-4 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Security Questions</h3>
                <i class="fas fa-question-circle text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$securityQuestionCount}</p>
            <p class="small text-muted mb-0">Configured challenge questions available for account recovery checks.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-4 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Two-Factor Status</h3>
                <span class="label status {if $twoFactorAuthEnabled}status-active{else}status-pending{/if}">{if $twoFactorAuthEnabled}{lang key='enabled'}{else}{lang key='disabled'}{/if}</span>
            </div>
            <p class="small text-muted mb-0">Secondary verification for access hardening and privileged account protection.</p>
        </div>
    </div>
</div>

{if $linkableProviders}
    <div class="card mb-4">
        <div class="card-header">
            <h3 class="card-title m-0">{lang key='remoteAuthn.titleLinkedAccounts'}</h3>
        </div>
        <div class="card-body">

            {include file="$template/includes/linkedaccounts.tpl" linkContext="clientsecurity" }

            <br />

            {include file="$template/includes/linkedaccounts.tpl" linkContext="linktable" }

            <br />
        </div>
    </div>
{/if}

{if $securityQuestions->count() > 0}
    <div class="card mb-4">
        <div class="card-header">
            <h3 class="card-title m-0">{lang key='clientareanavsecurityquestions'}</h3>
        </div>
        <div class="card-body">

            <form method="post" action="{routePath('user-security-question')}">
                {if $user->hasSecurityQuestion()}
                    <div class="form-group">
                        <label for="inputCurrentAns" class="col-form-label">{$user->getSecurityQuestion()}</label>
                        <input type="password" name="currentsecurityqans" id="inputCurrentAns" class="form-control" autocomplete="off" />
                    </div>
                {/if}

                <div class="form-group">
                    <label for="inputSecurityQid" class="col-form-label">{lang key='clientareasecurityquestion'}</label>
                    <select name="securityqid" id="inputSecurityQid" class="form-control custom-select">
                        {foreach $securityQuestions as $question}
                            <option value="{$question->id}">
                                {$question->question}
                            </option>
                        {/foreach}
                    </select>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="inputSecurityAns1" class="col-form-label">{lang key='clientareasecurityanswer'}</label>
                            <input type="password" name="securityqans" id="inputSecurityAns1" class="form-control" autocomplete="off" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="inputSecurityAns2" class="col-form-label">{lang key='clientareasecurityconfanswer'}</label>
                            <input type="password" name="securityqans2" id="inputSecurityAns2" class="form-control" autocomplete="off" />
                        </div>
                    </div>
                </div>

                <p>
                    <input class="btn btn-primary" type="submit" name="submit" value="{lang key='clientareasavechanges'}" />
                    <input class="btn btn-default" type="reset" value="{lang key='cancel'}" />
                </p>
            </form>
        </div>
    </div>
{/if}

{if $twoFactorAuthAvailable}
    <div class="card mb-4">
        <div class="card-header d-flex flex-column flex-lg-row align-items-lg-center justify-content-lg-between">
            <h3 class="card-title m-0 mb-2 mb-lg-0">{lang key='twofactorauth'}</h3>
            <small class="text-muted">Configure and enforce two-factor verification for this account.</small>
        </div>
        <div class="card-body">

            <p class="twofa-config-link disable{if !$twoFactorAuthEnabled} w-hidden{/if}">
                {lang key='twofacurrently'} <strong>{lang key='enabled'|strtolower}</strong>
            </p>
            <p class="twofa-config-link enable{if $twoFactorAuthEnabled} w-hidden{/if}">
                {lang key='twofacurrently'} <strong>{lang key='disabled'|strtolower}</strong>
            </p>

            {if $twoFactorAuthRequired}
                {include file="$template/includes/alert.tpl" type="warning" msg="{lang key="clientAreaSecurityTwoFactorAuthRequired"}"}
            {else}
                {include file="$template/includes/alert.tpl" type="warning" msg="{lang key="clientAreaSecurityTwoFactorAuthRecommendation"}"}
            {/if}

            <a href="{routePath('account-security-two-factor-disable')}" class="btn btn-danger open-modal twofa-config-link disable{if !$twoFactorAuthEnabled} w-hidden{/if}" data-modal-title="{lang key='twofadisable'}" data-modal-class="twofa-setup" data-btn-submit-label="{lang key='twofadisable'}" data-btn-submit-color="danger" data-btn-submit-id="btnDisable2FA">
                {lang key='twofadisableclickhere'}
            </a>
            <a href="{routePath('account-security-two-factor-enable')}" class="btn btn-success open-modal twofa-config-link enable{if $twoFactorAuthEnabled} w-hidden{/if}" data-modal-title="{lang key='twofaenable'}" data-modal-class="twofa-setup" data-btn-submit-id="btnEnable2FA">
                {lang key='twofaenableclickhere'}
            </a>
        </div>
    </div>
{/if}
