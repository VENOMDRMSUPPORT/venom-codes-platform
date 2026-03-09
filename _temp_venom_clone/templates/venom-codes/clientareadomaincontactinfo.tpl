{* VENOM CODES — Domain Contact Information *}

{assign var="page_title" value="Contact Information"}
{assign var="page_subtitle" value=$domain}
{assign var="breadcrumbs" value=[["label" => "Domains", "href" => "{$WEB_ROOT}/clientarea.php?action=domains"], ["label" => $domain, "href" => "{$WEB_ROOT}/clientarea.php?action=domaindetails&id={$domainid}"], ["label" => "WHOIS"]]}
{include file="$template/includes/client/pageheader.tpl"}

{if $error}
  {include file="$template/includes/client/alert.tpl" alert_type="error" alert_content=$error}
{/if}
{if $successful}
  {include file="$template/includes/client/alert.tpl" alert_type="success" alert_content="Contact information updated successfully."}
{/if}

<form method="post" action="{$smarty.server.PHP_SELF}">
  <input type="hidden" name="domainid" value="{$domainid}" />
  <input type="hidden" name="sub" value="save" />
  <input type="hidden" name="token" value="{$token}" />

  <div style="display: flex; flex-direction: column; gap: 1.5rem;">
    {foreach $contactdetails as $contactType => $contactValues}
      {assign var="ct_title" value=$contactType}
      {capture assign="ct_content"}
        <div style="display: grid; gap: 1rem; grid-template-columns: repeat(1, 1fr);">
          <style>@media (min-width: 640px) { .whois-grid { grid-template-columns: repeat(2, 1fr) !important; } }</style>
          <div class="whois-grid" style="display: grid; gap: 1rem; grid-template-columns: repeat(1, 1fr);">
            {foreach $contactValues as $field => $value}
              <div>
                <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">{$field}</label>
                <input type="text" name="contactdetails[{$contactType}][{$field}]" value="{$value}" class="venom-input" />
              </div>
            {/foreach}
          </div>
        </div>
      {/capture}
      {include file="$template/includes/client/formsection.tpl" form_title=$ct_title form_content=$ct_content}
    {/foreach}

    <div style="display: flex; justify-content: flex-end;">
      <button type="submit" class="venom-btn-primary text-sm" style="padding: 0.625rem 1.25rem;">Save Contact Information</button>
    </div>
  </div>
</form>
