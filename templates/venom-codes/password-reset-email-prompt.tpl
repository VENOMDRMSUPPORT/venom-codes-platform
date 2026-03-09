{* VENOM CODES — Password Reset Request *}

{* Close the wrapper opened by header.tpl to allow full-page auth layout *}
</div></main>

{assign var="auth_title" value="Reset Password"}
{assign var="auth_subtitle" value="Enter your email to receive a password reset link"}
{assign var="auth_icon_svg" value='<svg class="h-6 w-6 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>'}

{capture assign="auth_content"}
<form method="post" action="{$systemurl}pwreset.php" class="venom-form" role="form" aria-label="Reset password">
  <input type="hidden" name="token" value="{$token}" />
  <input type="hidden" name="action" value="reset" />

  <div class="venom-form-group">
    <label for="email" class="venom-label">Email Address</label>
    <input type="email" id="email" name="email" class="venom-input" placeholder="you@example.com" required aria-required="true" autocomplete="email" />
  </div>

  {if $captcha}
    <div class="venom-form-group">{$captcha}</div>
  {/if}

  <button type="submit" class="venom-btn-primary venom-btn-block">
    <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>
    Send Reset Link
  </button>
</form>

<p class="venom-auth-switch">
  Remember your password?
  <a href="{$WEB_ROOT}/clientarea.php" class="venom-link">Sign in</a>
</p>
{/capture}

{include file="$template/includes/authlayout.tpl"}

{* Re-open the wrapper that footer.tpl expects to close *}
<main style="flex: 1;"><div class="venom-container" style="padding: 2rem 1rem;">