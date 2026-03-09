{* VENOM CODES — Profile Settings *}

{assign var="breadcrumbs" value=[['label' => 'Settings', 'href' => "`$WEB_ROOT`/clientarea.php?action=changesettings"], ['label' => 'Profile']]}
{include file="$template/includes/client/pageheader.tpl" page_title="Profile Settings" page_subtitle="Manage your personal information and contact details."}

{* Settings layout with nav *}
{capture assign="settings_content"}

  {include file="$template/includes/client/alert.tpl" alert_type="info" alert_content="Changes to your profile may require verification. Keep your contact details up to date."}

  {* Personal Information *}
  <form method="post" action="{$WEB_ROOT}/clientarea.php?action=details">
    <input type="hidden" name="token" value="{$token}" />
    <input type="hidden" name="save" value="true" />

    <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
      <div style="border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
        <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600;">Personal Information</h3>
        <p class="text-muted-foreground" style="margin-top: 0.125rem; font-size: 0.75rem;">Your basic account details.</p>
      </div>
      <div style="padding: 1.25rem; display: flex; flex-direction: column; gap: 1rem;">
        <div style="display: grid; grid-template-columns: 1fr; gap: 1rem;">
          <style>@media (min-width: 640px) { .profile-row-2 { grid-template-columns: repeat(2, 1fr) !important; } }</style>
          <div class="profile-row-2" style="display: grid; grid-template-columns: 1fr; gap: 1rem;">
            <div>
              <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">First Name <span class="text-destructive">*</span></label>
              <input type="text" name="firstname" value="{$clientsdetails.firstname}" class="venom-input" required />
            </div>
            <div>
              <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Last Name <span class="text-destructive">*</span></label>
              <input type="text" name="lastname" value="{$clientsdetails.lastname}" class="venom-input" required />
            </div>
          </div>
        </div>
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Company Name</label>
          <input type="text" name="companyname" value="{$clientsdetails.companyname}" class="venom-input" />
        </div>
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Email Address <span class="text-destructive">*</span></label>
          <input type="email" name="email" value="{$clientsdetails.email}" class="venom-input" required />
          <p class="text-muted-foreground" style="margin-top: 0.25rem; font-size: 0.75rem;">We'll send important notifications to this address.</p>
        </div>
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Phone Number</label>
          <input type="tel" name="phonenumber" value="{$clientsdetails.phonenumber}" class="venom-input" />
        </div>
      </div>
      <div style="display: flex; justify-content: flex-end; gap: 0.5rem; border-top: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
        <button type="button" onclick="history.back()" class="venom-btn-secondary" style="font-size: 0.875rem; padding: 0.5rem 0.75rem;">Cancel</button>
        <button type="submit" class="venom-btn-primary" style="font-size: 0.875rem; padding: 0.5rem 0.75rem;">Save Changes</button>
      </div>
    </div>
  </form>

  {* Billing Address *}
  <form method="post" action="{$WEB_ROOT}/clientarea.php?action=details">
    <input type="hidden" name="token" value="{$token}" />
    <input type="hidden" name="save" value="true" />

    <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
      <div style="border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
        <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600;">Billing Address</h3>
        <p class="text-muted-foreground" style="margin-top: 0.125rem; font-size: 0.75rem;">Used for invoicing and tax purposes.</p>
      </div>
      <div style="padding: 1.25rem; display: flex; flex-direction: column; gap: 1rem;">
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Address Line 1 <span class="text-destructive">*</span></label>
          <input type="text" name="address1" value="{$clientsdetails.address1}" class="venom-input" required />
        </div>
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Address Line 2</label>
          <input type="text" name="address2" value="{$clientsdetails.address2}" class="venom-input" />
        </div>
        <div style="display: grid; grid-template-columns: 1fr; gap: 1rem;">
          <style>@media (min-width: 640px) { .addr-row-3 { grid-template-columns: repeat(3, 1fr) !important; } }</style>
          <div class="addr-row-3" style="display: grid; grid-template-columns: 1fr; gap: 1rem;">
            <div>
              <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">City <span class="text-destructive">*</span></label>
              <input type="text" name="city" value="{$clientsdetails.city}" class="venom-input" required />
            </div>
            <div>
              <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">State/Region</label>
              <input type="text" name="state" value="{$clientsdetails.state}" class="venom-input" />
            </div>
            <div>
              <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Postal Code <span class="text-destructive">*</span></label>
              <input type="text" name="postcode" value="{$clientsdetails.postcode}" class="venom-input" required />
            </div>
          </div>
        </div>
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Country <span class="text-destructive">*</span></label>
          <select name="country" class="venom-input" required>
            {foreach $countries as $country}
              <option value="{$country.code}"{if $clientsdetails.country eq $country.code} selected{/if}>{$country.name}</option>
            {/foreach}
          </select>
        </div>
      </div>
      <div style="display: flex; justify-content: flex-end; gap: 0.5rem; border-top: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
        <button type="button" onclick="history.back()" class="venom-btn-secondary" style="font-size: 0.875rem; padding: 0.5rem 0.75rem;">Cancel</button>
        <button type="submit" class="venom-btn-primary" style="font-size: 0.875rem; padding: 0.5rem 0.75rem;">Save Address</button>
      </div>
    </div>
  </form>

{/capture}
{include file="$template/includes/client/accountsettingslayout.tpl" settings_active="profile"}