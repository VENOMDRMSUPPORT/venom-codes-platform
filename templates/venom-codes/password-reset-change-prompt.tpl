{* VENOM CODES — Password Reset Confirmation *}

{* Close the wrapper opened by header.tpl to allow full-page auth layout *}
</div></main>

{assign var="auth_title" value="Set New Password"}
{assign var="auth_subtitle" value="Choose a strong password for your account"}
{assign var="auth_icon_svg" value='<svg class="h-6 w-6 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m21 2-2 2m-7.61 7.61a5.5 5.5 0 1 1-7.778 7.778 5.5 5.5 0 0 1 7.777-7.777zm0 0L15.5 7.5m0 0 3 3L22 7l-3-3m-3.5 3.5L19 4"/></svg>'}

{capture assign="auth_content"}
<form method="post" action="{$systemurl}pwreset.php" class="venom-form" role="form" aria-label="Set new password">
  <input type="hidden" name="token" value="{$token}" />
  <input type="hidden" name="key" value="{$key}" />
  <input type="hidden" name="action" value="setpw" />

  <div class="venom-form-group">
    <label for="newpw" class="venom-label">New Password</label>
    <input type="password" id="newpw" name="newpw" class="venom-input" placeholder="Enter your password" required aria-required="true" autocomplete="new-password" />
  </div>

  <div class="venom-form-group">
    <label for="newpw2" class="venom-label">Confirm New Password</label>
    <input type="password" id="newpw2" name="newpw2" class="venom-input" placeholder="Confirm your password" required aria-required="true" autocomplete="new-password" />
  </div>

  <button type="submit" class="venom-btn-primary venom-btn-block">
    <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m21 2-2 2m-7.61 7.61a5.5 5.5 0 1 1-7.778 7.778 5.5 5.5 0 0 1 7.777-7.777zm0 0L15.5 7.5m0 0 3 3L22 7l-3-3m-3.5 3.5L19 4"/></svg>
    Update Password
  </button>
</form>

<p class="venom-auth-switch">
  <a href="{$WEB_ROOT}/clientarea.php" class="venom-link">Back to Sign In</a>
</p>
{/capture}

{include file="$template/includes/authlayout.tpl"}

{* Re-open the wrapper that footer.tpl expects to close *}
<main style="flex: 1;"><div class="venom-container" style="padding: 2rem 1rem;">