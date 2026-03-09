{* VENOM CODES — Password Reset Request *}

{assign var="auth_title" value="Reset Password"}
{assign var="auth_subtitle" value="Enter your email to receive a password reset link"}
{assign var="auth_icon_svg" value='<svg class="h-6 w-6 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>'}

{capture assign="auth_content"}
<form method="post" action="{$systemurl}pwreset.php" style="display: flex; flex-direction: column; gap: 1.25rem;">
  <input type="hidden" name="token" value="{$token}" />
  <input type="hidden" name="action" value="reset" />

  <div>
    <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Email Address</label>
    <input type="email" name="email" class="venom-input" placeholder="you@example.com" required />
  </div>

  {if $captcha}
    <div>{$captcha}</div>
  {/if}

  <button type="submit" class="venom-btn-primary" style="width: 100%; padding: 0.75rem;">
    <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>
    Send Reset Link
  </button>
</form>

<p style="margin-top: 1.5rem; text-align: center; font-size: 0.875rem; color: hsl(var(--muted-foreground));">
  Remember your password?
  <a href="{$WEB_ROOT}/clientarea.php" class="text-primary" style="font-weight: 500; text-decoration: none;">Sign in</a>
</p>
{/capture}

{include file="$template/includes/authlayout.tpl"}