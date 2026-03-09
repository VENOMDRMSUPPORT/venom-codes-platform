{* VENOM CODES — Security Settings *}

{assign var="breadcrumbs" value=[['label' => 'Settings', 'href' => "`$WEB_ROOT`/clientarea.php?action=changesettings"], ['label' => 'Security']]}
{include file="$template/includes/client/pageheader.tpl" page_title="Security Settings" page_subtitle="Manage your password, two-factor authentication, and sessions."}

{capture assign="settings_content"}

  {* Change Password *}
  <form method="post" action="{$WEB_ROOT}/clientarea.php?action=security">
    <input type="hidden" name="token" value="{$token}" />
    <input type="hidden" name="submit" value="1" />

    <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
      <div style="border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
        <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600;">Change Password</h3>
        <p class="text-muted-foreground" style="margin-top: 0.125rem; font-size: 0.75rem;">Use a strong, unique password to protect your account.</p>
      </div>
      <div style="padding: 1.25rem; display: flex; flex-direction: column; gap: 1rem;">
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Current Password <span class="text-destructive">*</span></label>
          <input type="password" name="existingpw" class="venom-input" placeholder="••••••••" required />
        </div>
        <div style="display: grid; grid-template-columns: 1fr; gap: 1rem;">
          <style>@media (min-width: 640px) { .pw-row-2 { grid-template-columns: repeat(2, 1fr) !important; } }</style>
          <div class="pw-row-2" style="display: grid; grid-template-columns: 1fr; gap: 1rem;">
            <div>
              <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">New Password <span class="text-destructive">*</span></label>
              <input type="password" name="newpw" class="venom-input" placeholder="••••••••" required />
            </div>
            <div>
              <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Confirm New Password <span class="text-destructive">*</span></label>
              <input type="password" name="confirmpw" class="venom-input" placeholder="••••••••" required />
            </div>
          </div>
        </div>
      </div>
      <div style="display: flex; justify-content: flex-end; gap: 0.5rem; border-top: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
        <button type="submit" class="venom-btn-primary" style="font-size: 0.875rem; padding: 0.5rem 0.75rem;">Update Password</button>
      </div>
    </div>
  </form>

  {* Two-Factor Authentication *}
  <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
    <div style="border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
      <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600;">Two-Factor Authentication</h3>
      <p class="text-muted-foreground" style="margin-top: 0.125rem; font-size: 0.75rem;">Add an extra layer of security to your account.</p>
    </div>
    <div style="padding: 1.25rem;">
      <div style="display: flex; align-items: center; justify-content: space-between; border-radius: 0.5rem; border: 1px solid hsl(var(--border)); padding: 1rem;">
        <div style="display: flex; align-items: center; gap: 0.75rem;">
          <div style="display: flex; height: 2.5rem; width: 2.5rem; align-items: center; justify-content: center; border-radius: 0.5rem; background: hsl(var(--primary) / 0.1); color: hsl(var(--primary));">
            <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="5" y="2" width="14" height="20" rx="2" ry="2"/><line x1="12" y1="18" x2="12.01" y2="18"/></svg>
          </div>
          <div>
            <p style="font-size: 0.875rem; font-weight: 600;">Authenticator App</p>
            <p class="text-muted-foreground" style="font-size: 0.75rem;">Use an authenticator app for verification codes.</p>
          </div>
        </div>
        {if $twofaenabled}
          {include file="$template/includes/client/statusbadge.tpl" status_variant="active" status_label="Enabled"}
        {else}
          {include file="$template/includes/client/statusbadge.tpl" status_variant="cancelled" status_label="Disabled"}
        {/if}
      </div>
      <div style="margin-top: 1rem;">
        {if $twofaenabled}
          <a href="{$WEB_ROOT}/clientarea.php?action=security&disable2fa=1" class="venom-btn-secondary" style="font-size: 0.875rem; padding: 0.5rem 1rem;">Disable 2FA</a>
        {else}
          <a href="{$WEB_ROOT}/clientarea.php?action=security&enable2fa=1" class="venom-btn-primary" style="font-size: 0.875rem; padding: 0.5rem 1rem;">
            <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 2l-2 2m-7.61 7.61a5.5 5.5 0 1 1-7.778 7.778 5.5 5.5 0 0 1 7.777-7.777zm0 0L15.5 7.5m0 0l3 3L22 7l-3-3m-3.5 3.5L19 4"/></svg>
            Enable 2FA
          </a>
        {/if}
      </div>
    </div>
  </div>

  {* Active Sessions *}
  {assign var="panel_rows" value=[['label' => 'Current session', 'value' => '']]}
  {capture assign="session_footer"}
    <button onclick="if(confirm('Sign out all other sessions?')) location.href='{$WEB_ROOT}/clientarea.php?action=security&invalidatesessions=1'" style="display: flex; align-items: center; gap: 0.5rem; font-size: 0.75rem; color: hsl(var(--destructive)); background: none; border: none; cursor: pointer; text-decoration: underline;">
      <svg class="h-3.5 w-3.5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>
      Sign out all other sessions
    </button>
  {/capture}
  {include file="$template/includes/client/summarypanel.tpl" panel_title="Active Sessions" panel_footer=$session_footer}

  {include file="$template/includes/client/alert.tpl" alert_type="info" alert_content="For additional security, consider using a unique password that you don't use on other websites."}

{/capture}
{include file="$template/includes/client/accountsettingslayout.tpl" settings_active="security"}