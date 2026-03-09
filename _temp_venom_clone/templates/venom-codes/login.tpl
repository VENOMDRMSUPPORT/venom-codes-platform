{* VENOM CODES — Login Page *}

{assign var="auth_title" value="Welcome Back"}
{assign var="auth_subtitle" value="Sign in to your VENOM CODES account"}
{assign var="auth_icon_svg" value='<svg class="h-6 w-6 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/><polyline points="10 17 15 12 10 7"/><line x1="15" y1="12" x2="3" y2="12"/></svg>'}

{capture assign="auth_content"}
<form method="post" action="{$systemurl}dologin.php" style="display: flex; flex-direction: column; gap: 1.25rem;">
  <input type="hidden" name="token" value="{$token}" />

  <div>
    <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Email Address</label>
    <input type="email" name="username" class="venom-input" placeholder="you@example.com" required />
  </div>

  <div>
    <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 0.375rem;">
      <label style="font-size: 0.875rem; font-weight: 500;">Password</label>
      <a href="{$WEB_ROOT}/pwreset.php" class="text-primary" style="font-size: 0.75rem; text-decoration: none;">Forgot password?</a>
    </div>
    <input type="password" name="password" class="venom-input" placeholder="••••••••" required />
  </div>

  {if $captcha}
    <div>{$captcha}</div>
  {/if}

  <button type="submit" class="venom-btn-primary" style="width: 100%; padding: 0.75rem;">
    <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/><polyline points="10 17 15 12 10 7"/><line x1="15" y1="12" x2="3" y2="12"/></svg>
    Sign In
  </button>
</form>

<p style="margin-top: 1.5rem; text-align: center; font-size: 0.875rem; color: hsl(var(--muted-foreground));">
  Don't have an account?
  <a href="{$WEB_ROOT}/register.php" class="text-primary" style="font-weight: 500; text-decoration: none;">Create one</a>
</p>
{/capture}

{include file="$template/includes/authlayout.tpl"}