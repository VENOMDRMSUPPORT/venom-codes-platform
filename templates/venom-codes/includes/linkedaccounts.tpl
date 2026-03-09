{* VENOM CODES — Linked Accounts (OAuth) Component *}

{if ($linkableProviders || $hasLinkedProvidersEnabled) && $linkContext == 'linktable'}
    <table id="tableLinkedAccounts" class="table display data-driven"
           data-ajax-url="{$linkedAccountsUrl}"
           data-on-draw-rebind-confirmation-modal="true"
           data-lang-empty-table="{lang key='remoteAuthn.noLinkedAccounts'}"
           style="border-radius: 0.75rem; overflow: hidden; border: 1px solid var(--gray-200, #e5e7eb);">
        <thead style="background: var(--gray-50, #f9fafb);">
        <tr class="text-center" style="color: var(--gray-700, #374151); font-weight: 600;">
            <th style="padding: 1rem;">{lang key='remoteAuthn.provider'}</th>
            <th style="padding: 1rem;">{lang key='remoteAuthn.name'}</th>
            <th style="padding: 1rem;">{lang key='remoteAuthn.emailAddress'}</th>
            <th style="padding: 1rem;">{lang key='remoteAuthn.actions'}</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td colspan="4" class="text-center" style="padding: 3rem; color: var(--gray-500, #6b7280);">{lang key='remoteAuthn.noLinkedAccounts'}</td>
        </tr>
        </tbody>
    </table>
{elseif $linkableProviders}

    <div id="providerLinkingMessages" class="w-hidden">
        <p class="providerLinkingMsg-preLink-init_failed">
            <span class="provider-name"></span> {lang key='remoteAuthn.unavailable'}
        </p>
        <p class="providerLinkingMsg-preLink-connect_error">
            <strong>{lang key='remoteAuthn.error'}</strong> {lang key='remoteAuthn.connectError'}
        </p>
        <p class="providerLinkingMsg-preLink-complete_sign_in">
            {lang key='remoteAuthn.completeSignIn'}
        </p>
        <p class="providerLinkingMsg-preLink-2fa_needed">
            {lang key='remoteAuthn.redirecting'}
        </p>
        <p class="providerLinkingMsg-preLink-linking_complete">
            <strong>{lang key='remoteAuthn.success'}</strong> {lang key='remoteAuthn.accountNowLinked'}
        </p>
        <p class="providerLinkingMsg-preLink-login_to_link-signin-required">
            <strong>{lang key='remoteAuthn.linkInitiated'}</strong> {lang key='remoteAuthn.oneTimeAuthRequired'}
        </p>
        <p class="providerLinkingMsg-preLink-login_to_link-registration-required">
            <strong>{lang key='remoteAuthn.linkInitiated'}</strong> {lang key='remoteAuthn.completeRegistrationForm'}
        </p>
        <p class="providerLinkingMsg-preLink-checkout-new">
            <strong>{lang key='remoteAuthn.linkInitiated'}</strong> {lang key='remoteAuthn.completeNewAccountForm'}
        </p>
        <p class="providerLinkingMsg-preLink-other_user_exists">
            <strong>{lang key='remoteAuthn.error'}</strong> {lang key='remoteAuthn.linkedToAnotherClient'}
        </p>
        <p class="providerLinkingMsg-preLink-already_linked">
            <strong>{lang key='remoteAuthn.error'}</strong> {lang key='remoteAuthn.alreadyLinkedToYou'}
        </p>
        <p class="providerLinkingMsg-preLink-default">
            <strong>{lang key='remoteAuthn.error'}</strong> {lang key='remoteAuthn.connectError'}
        </p>
    </div>

    {if $linkContext == 'registration'}
        <div class="sub-heading" style="text-align: center; margin: 2rem 0 1.5rem; position: relative;">
            <span style="background: white; padding: 0 1rem; position: relative; z-index: 1; font-weight: 600; color: var(--gray-700, #374151);">{lang key='remoteAuthn.titleSignUpVerb'}</span>
            <div style="position: absolute; top: 50%; left: 0; right: 0; height: 1px; background: var(--gray-200, #e5e7eb); z-index: 0;"></div>
        </div>
    {elseif $linkContext == 'checkout-existing'}
        <div class="sub-heading-borderless" style="text-align: center; margin: 2rem 0 1rem; position: relative;">
            <span style="background: white; padding: 0 1rem; position: relative; z-index: 1; font-weight: 600; color: var(--gray-700, #374151);">{lang key='remoteAuthn.titleOr'}</span>
            <div style="position: absolute; top: 50%; left: 0; right: 0; height: 1px; background: var(--gray-200, #e5e7eb); z-index: 0;"></div>
        </div>
        <p class="small text-center text-muted" style="color: var(--gray-500, #6b7280); font-size: 0.875rem; margin-bottom: 1.5rem;">{lang key='remoteAuthn.saveTimeByLinking'}</p>
    {elseif $linkContext == 'checkout-new'}
        <div class="sub-heading" style="text-align: center; margin: 2rem 0 1.5rem; position: relative;">
            <span style="background: white; padding: 0 1rem; position: relative; z-index: 1; font-weight: 600; color: var(--gray-700, #374151);">{lang key='remoteAuthn.titleSignUpVerb'}</span>
            <div style="position: absolute; top: 50%; left: 0; right: 0; height: 1px; background: var(--gray-200, #e5e7eb); z-index: 0;"></div>
        </div>
        <p class="small text-center text-muted" style="color: var(--gray-500, #6b7280); font-size: 0.875rem; margin-bottom: 1.5rem;">{lang key='remoteAuthn.saveTimeByLinking'}</p>
    {elseif $linkContext == 'clientsecurity'}
        <p style="margin-bottom: 1.5rem; color: var(--gray-600, #4b5563);">{lang key='remoteAuthn.mayHaveMultipleLinks'}</p>
    {/if}

    <div class="providerPreLinking" data-link-context="{$linkContext}"
         data-hide-on-prelink={if in_array($linkContext, ['clientsecurity','login'])}0{else}1{/if}
         data-disable-on-prelink=0>
        <div class="social-signin-btns" style="display: flex; flex-direction: column; gap: 0.75rem; margin: 1rem 0;">
            {foreach $linkableProviders as $provider }
                {if in_array($linkContext, ['checkout-existing'])}
                    {$provider.login_button}
                {else}
                    {$provider.code}
                {/if}
            {/foreach}
        </div>
    </div>

    {if !isset($customFeedback) || !$customFeedback}
        <div class="providerLinkingFeedback"></div>
    {/if}

{/if}

<style>
/* VENOM CODES OAuth Button Styling */
.social-signin-btns button,
.social-signin-btns a.btn {
    border-radius: 0.5rem;
    padding: 0.75rem 1.5rem;
    font-weight: 500;
    transition: all 0.2s;
    border: 1px solid var(--gray-300, #d1d5db);
    background: white;
    color: var(--gray-700, #374151);
    width: 100%;
    text-align: center;
}
.social-signin-btns button:hover,
.social-signin-btns a.btn:hover {
    background: var(--gray-50, #f9fafb);
    border-color: var(--gray-400, #9ca3af);
    transform: translateY(-1px);
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
}
</style>
