{* VENOM CODES — User Password Change *}

{assign var="page_title" value="Change Password"}
{assign var="breadcrumbs" value=[["label" => "Account Settings"], ["label" => "Password"]]}
{include file="$template/includes/client/pageheader.tpl"}

{assign var="form_title" value="Update Password"}
{assign var="form_description" value="Choose a strong password you haven't used before"}

{capture assign="form_content"}
<form method="post" action="{$systemurl}account/password" id="frmChangePassword" style="display: flex; flex-direction: column; gap: 1.25rem;">
  <input type="hidden" name="token" value="{$token}" />

  <div>
    <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Current Password</label>
    <input type="password" name="existingpw" class="venom-input" placeholder="Enter current password" required />
  </div>

  <div>
    <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">New Password</label>
    <input type="password" name="newpw" id="newpw" class="venom-input" placeholder="Min. 8 characters" required />
    {if $pwstrengthaliases}
      <div id="pwstrength" style="margin-top: 0.5rem; height: 0.25rem; border-radius: 9999px; background: hsl(var(--muted));"></div>
    {/if}
  </div>

  <div>
    <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Confirm New Password</label>
    <input type="password" name="confirmpw" class="venom-input" placeholder="Re-enter new password" required />
  </div>

  <div style="display: flex; justify-content: flex-end; gap: 0.5rem; padding-top: 0.5rem;">
    <button type="submit" id="btnChangePassword" class="venom-btn-primary text-sm" style="padding: 0.625rem 1.25rem;">
      <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
      Update Password
    </button>
  </div>
</form>
{/capture}

{include file="$template/includes/client/formsection.tpl" form_title=$form_title form_description=$form_description form_content=$form_content}
