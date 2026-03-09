{* VENOM CODES — Password Reset Confirmation *}

{assign var="auth_title" value="Set New Password"}
{assign var="auth_subtitle" value="Choose a strong password for your account"}
{assign var="auth_icon_svg" value='<svg class="h-6 w-6 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m21 2-2 2m-7.61 7.61a5.5 5.5 0 1 1-7.778 7.778 5.5 5.5 0 0 1 7.777-7.777zm0 0L15.5 7.5m0 0 3 3L22 7l-3-3m-3.5 3.5L19 4"/></svg>'}

{capture assign="auth_content"}
<form method="post" action="{$systemurl}pwreset.php" style="display: flex; flex-direction: column; gap: 1.25rem;">
  <input type="hidden" name="token" value="{$token}" />
  <input type="hidden" name="key" value="{$key}" />
  <input type="hidden" name="action" value="setpw" />

  <div>
    <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">New Password</label>
    <input type="password" name="newpw" class="venom-input" placeholder="Min. 8 characters" required />
  </div>

  <div>
    <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Confirm New Password</label>
    <input type="password" name="newpw2" class="venom-input" placeholder="••••••••" required />
  </div>

  <button type="submit" class="venom-btn-primary" style="width: 100%; padding: 0.75rem;">
    <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m21 2-2 2m-7.61 7.61a5.5 5.5 0 1 1-7.778 7.778 5.5 5.5 0 0 1 7.777-7.777zm0 0L15.5 7.5m0 0 3 3L22 7l-3-3m-3.5 3.5L19 4"/></svg>
    Update Password
  </button>
</form>

<p style="margin-top: 1.5rem; text-align: center; font-size: 0.875rem; color: hsl(var(--muted-foreground));">
  <a href="{$WEB_ROOT}/clientarea.php" class="text-primary" style="font-weight: 500; text-decoration: none;">Back to Sign In</a>
</p>
{/capture}

{include file="$template/includes/authlayout.tpl"}