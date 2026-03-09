{* VENOM CODES — Login Page *}

{* Close the wrapper opened by header.tpl to allow full-page auth layout *}
</div></main>

{assign var="auth_title" value="Welcome Back"}
{assign var="auth_subtitle" value="Sign in to your VENOM CODES account"}
{assign var="auth_icon_svg" value='<svg class="h-6 w-6 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/><polyline points="10 17 15 12 10 7"/><line x1="15" y1="12" x2="3" y2="12"/></svg>'}

{capture assign="auth_content"}
<div class="providerLinkingFeedback"></div>
<form method="post" action="{$systemurl}dologin.php" class="venom-form" role="form" aria-label="{lang key='loginbutton'}">
  <input type="hidden" name="token" value="{$token}" />

  {if $incorrect}
    <div class="venom-alert venom-alert-error" role="alert">
      <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
      <span>{lang key='loginincorrect'}</span>
    </div>
  {/if}

  <div class="venom-form-group">
    <label for="username" class="venom-label">{lang key='clientareaemail'}</label>
    <input type="email" id="username" name="username" class="venom-input" placeholder="you@example.com" required aria-required="true" autocomplete="email" />
  </div>

  <div class="venom-form-group">
    <label for="password" class="venom-label">{lang key='clientareapassword'}</label>
    <input type="password" id="password" name="password" class="venom-input" placeholder="Enter your password" required aria-required="true" autocomplete="current-password" />
    <div class="venom-form-footer">
      <a href="{$WEB_ROOT}/pwreset.php" class="venom-link">{lang key='forgotpw'}</a>
    </div>
  </div>

  <div class="venom-form-group">
    <label class="venom-checkbox-label">
      <input type="checkbox" name="rememberme" class="venom-checkbox" />
      <span class="venom-checkbox-custom" aria-hidden="true"></span>
      <span>{lang key='loginrememberme'}</span>
    </label>
  </div>

  <button type="submit" class="venom-btn-primary venom-btn-block">
    <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/><polyline points="10 17 15 12 10 7"/><line x1="15" y1="12" x2="3" y2="12"/></svg>
    {lang key='loginbutton'}
  </button>
</form>

<p class="venom-auth-switch">
  Don't have an account?
  <a href="{$WEB_ROOT}/register.php" class="venom-link">Create one</a>
</p>
{/capture}

{include file="$template/includes/authlayout.tpl"}

{* Re-open the wrapper that footer.tpl expects to close *}
<main style="flex: 1;"><div class="venom-container" style="padding: 2rem 1rem;">
