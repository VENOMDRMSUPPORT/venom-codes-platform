{* VENOM CODES — Manage Contact *}

{assign var="page_title" value="Manage Contact"}
{assign var="breadcrumbs" value=[["label" => "Contacts", "href" => "{$WEB_ROOT}/clientarea.php?action=contacts"], ["label" => "{if $contactid}Edit{else}New{/if} Contact"]]}
{include file="$template/includes/client/pageheader.tpl"}

{if $errormessage}
  {include file="$template/includes/client/alert.tpl" alert_type="error" alert_content=$errormessage}
{/if}

{assign var="form_title" value="{if $contactid}Edit Contact{else}New Contact{/if}"}

{capture assign="form_content"}
<form method="post" action="{$smarty.server.PHP_SELF}" id="frmContact">
  <input type="hidden" name="token" value="{$token}" />
  <input type="hidden" name="contactid" value="{$contactid}" />

  <div style="display: flex; flex-direction: column; gap: 1.25rem;">
    <div style="display: grid; gap: 1rem; grid-template-columns: repeat(1, 1fr);">
      <style>@media (min-width: 640px) { .contact-grid { grid-template-columns: repeat(2, 1fr) !important; } }</style>
      <div class="contact-grid" style="display: grid; gap: 1rem; grid-template-columns: repeat(1, 1fr);">
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">First Name</label>
          <input type="text" name="firstname" value="{$contact.firstname}" class="venom-input" required />
        </div>
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Last Name</label>
          <input type="text" name="lastname" value="{$contact.lastname}" class="venom-input" required />
        </div>
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Company</label>
          <input type="text" name="companyname" value="{$contact.companyname}" class="venom-input" />
        </div>
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Email</label>
          <input type="email" name="email" value="{$contact.email}" class="venom-input" required />
        </div>
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Phone</label>
          <input type="tel" name="phonenumber" value="{$contact.phonenumber}" class="venom-input" />
        </div>
      </div>
    </div>

    {* Permissions *}
    <div>
      <label style="display: block; margin-bottom: 0.5rem; font-size: 0.875rem; font-weight: 500;">Permissions</label>
      <div style="display: flex; flex-direction: column; gap: 0.5rem;">
        {foreach $contactpermissions as $permission}
          <label style="display: flex; align-items: center; gap: 0.5rem; font-size: 0.875rem; cursor: pointer;">
            <input type="checkbox" name="permissions[]" value="{$permission}" {if in_array($permission, $contact.permissions)}checked{/if} style="accent-color: hsl(var(--primary));" />
            {$permission}
          </label>
        {/foreach}
      </div>
    </div>

    <div style="display: flex; justify-content: flex-end; gap: 0.5rem;">
      <a href="{$WEB_ROOT}/clientarea.php?action=contacts" class="venom-btn-secondary text-sm" style="padding: 0.625rem 1.25rem;">Cancel</a>
      <button type="submit" name="save" class="venom-btn-primary text-sm" style="padding: 0.625rem 1.25rem;">Save Contact</button>
    </div>
  </div>
</form>
{/capture}

{include file="$template/includes/client/formsection.tpl" form_title=$form_title form_content=$form_content}
