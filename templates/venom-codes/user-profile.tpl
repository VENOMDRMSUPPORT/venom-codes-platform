{* VENOM CODES — General / Notification Settings *}

{assign var="breadcrumbs" value=[['label' => 'Settings']]}
{include file="$template/includes/client/pageheader.tpl" page_title="General Settings" page_subtitle="Manage your notification and display preferences."}

{capture assign="settings_content"}

  {* Notification Preferences *}
  <form method="post" action="{$WEB_ROOT}/clientarea.php?action=changesettings">
    <input type="hidden" name="token" value="{$token}" />
    <input type="hidden" name="save" value="true" />

    <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
      <div style="border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
        <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600;">Notification Preferences</h3>
        <p class="text-muted-foreground" style="margin-top: 0.125rem; font-size: 0.75rem;">Choose how and when you'd like to be notified.</p>
      </div>
      <div style="padding: 1.25rem;">
        <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Email Notifications</label>
        <div style="display: flex; flex-direction: column; gap: 0.5rem;">
          <label style="display: flex; align-items: center; gap: 0.625rem; font-size: 0.875rem; cursor: pointer;">
            <input type="checkbox" name="notify_invoice" checked style="border-radius: 0.25rem;" /> Invoice reminders
          </label>
          <label style="display: flex; align-items: center; gap: 0.625rem; font-size: 0.875rem; cursor: pointer;">
            <input type="checkbox" name="notify_ticket" checked style="border-radius: 0.25rem;" /> Support ticket updates
          </label>
          <label style="display: flex; align-items: center; gap: 0.625rem; font-size: 0.875rem; cursor: pointer;">
            <input type="checkbox" name="notify_service" checked style="border-radius: 0.25rem;" /> Service status alerts
          </label>
          <label style="display: flex; align-items: center; gap: 0.625rem; font-size: 0.875rem; cursor: pointer;">
            <input type="checkbox" name="notify_promo" checked style="border-radius: 0.25rem;" /> Promotional offers
          </label>
        </div>
      </div>
      <div style="display: flex; justify-content: flex-end; gap: 0.5rem; border-top: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
        <button type="submit" class="venom-btn-primary" style="font-size: 0.875rem; padding: 0.5rem 0.75rem;">Save Preferences</button>
      </div>
    </div>
  </form>

  {* Display Settings *}
  <form method="post" action="{$WEB_ROOT}/clientarea.php?action=changesettings">
    <input type="hidden" name="token" value="{$token}" />
    <input type="hidden" name="save" value="true" />

    <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
      <div style="border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
        <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600;">Display Settings</h3>
        <p class="text-muted-foreground" style="margin-top: 0.125rem; font-size: 0.75rem;">Customize your client area experience.</p>
      </div>
      <div style="padding: 1.25rem; display: flex; flex-direction: column; gap: 1rem;">
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Language</label>
          <select name="language" class="venom-input">
            {foreach $languages as $language}
              <option value="{$language}"{if $clientsdetails.language eq $language} selected{/if}>{$language}</option>
            {/foreach}
          </select>
        </div>
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Date Format</label>
          <select name="dateformat" class="venom-input">
            <option>YYYY-MM-DD</option>
            <option>DD/MM/YYYY</option>
            <option>MM/DD/YYYY</option>
          </select>
        </div>
      </div>
      <div style="display: flex; justify-content: flex-end; gap: 0.5rem; border-top: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
        <button type="submit" class="venom-btn-primary" style="font-size: 0.875rem; padding: 0.5rem 0.75rem;">Save Settings</button>
      </div>
    </div>
  </form>

  {* Account Actions *}
  <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
    <div style="border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
      <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600;">Account Actions</h3>
      <p class="text-muted-foreground" style="margin-top: 0.125rem; font-size: 0.75rem;">Manage your account status.</p>
    </div>
    <div style="padding: 1.25rem;">
      <div style="display: flex; align-items: center; justify-content: space-between; border-radius: 0.5rem; border: 1px solid hsl(var(--destructive) / 0.2); padding: 1rem;">
        <div>
          <p style="font-size: 0.875rem; font-weight: 600;">Close Account</p>
          <p class="text-muted-foreground" style="font-size: 0.75rem;">Permanently close your account and cancel all services.</p>
        </div>
        <a href="{$WEB_ROOT}/clientarea.php?action=requestcancellation" style="border-radius: 0.5rem; border: 1px solid hsl(var(--destructive)); padding: 0.375rem 0.75rem; font-size: 0.75rem; font-weight: 600; color: hsl(var(--destructive)); text-decoration: none; transition: background 0.15s;">
          Request Closure
        </a>
      </div>
    </div>
  </div>

{/capture}
{include file="$template/includes/client/accountsettingslayout.tpl" settings_active="settings"}