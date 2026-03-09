{* VENOM CODES — Login Page *}

{* Close the wrapper opened by header.tpl to allow full-page auth layout *}
</div></main>

{assign var="auth_title" value="Welcome Back"}
{assign var="auth_subtitle" value="Sign in to your VENOM CODES account"}
{assign var="auth_icon_svg" value='<svg class="h-6 w-6 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/><polyline points="10 17 15 12 10 7"/><line x1="15" y1="12" x2="3" y2="12"/></svg>'}

{capture assign="auth_content"}
<div class="providerLinkingFeedback"></div>
<form method="post" action="{$systemurl}dologin.php" style="display: flex; flex-direction: column; gap: 1.25rem;">
  <input type="hidden" name="token" value="{$token}" />

  {if $incorrect}
    <div style="border-radius: 0.5rem; padding: 0.75rem; background: hsl(var(--destructive) / 0.1); border: 1px solid hsl(var(--destructive) / 0.2);">
      <p style="margin: 0; font-size: 0.875rem; color: hsl(var(--destructive));">{lang key='loginincorrect'}</p>
    </div>
  {/if}

  <div>
    <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">{lang key='clientareaemail'}</label>
    <input type="email" name="username" class="venom-input" placeholder="you@example.com" required />
  </div>

  <div>
    <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 0.375rem;">
      <label style="font-size: 0.875rem; font-weight: 500;">{lang key='clientareapassword'}</label>
      <a href="{$WEB_ROOT}/pwreset.php" class="text-primary" style="font-size: 0.75rem; text-decoration: none;">{lang key='forgotpw'}</a>
    </div>
    <input type="password" name="password" class="venom-input" placeholder="••••••••" required />
  </div>

  <label style="display: flex; align-items: center; gap: 0.5rem; font-size: 0.875rem;">
    <input type="checkbox" name="rememberme" />
    <span>{lang key='loginrememberme'}</span>
  </label>

  <button type="submit" class="venom-btn-primary" style="width: 100%; padding: 0.75rem;">
    <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/><polyline points="10 17 15 12 10 7"/><line x1="15" y1="12" x2="3" y2="12"/></svg>
    {lang key='loginbutton'}
  </button>
</form>

<p style="margin-top: 1.5rem; text-align: center; font-size: 0.875rem; color: hsl(var(--muted-foreground));">
  Don't have an account?
  <a href="{$WEB_ROOT}/register.php" class="text-primary" style="font-weight: 500; text-decoration: none;">Create one</a>
</p>
{/capture}

{include file="$template/includes/authlayout.tpl"}

{* Re-open the wrapper that footer.tpl expects to close *}
<main style="flex: 1;"><div class="venom-container" style="padding: 2rem 1rem;">
