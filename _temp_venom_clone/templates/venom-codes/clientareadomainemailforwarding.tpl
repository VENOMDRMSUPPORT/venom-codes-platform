{* VENOM CODES — Domain Email Forwarding *}

{assign var="page_title" value="Email Forwarding"}
{assign var="page_subtitle" value=$domain}
{assign var="breadcrumbs" value=[["label" => "Domains", "href" => "{$WEB_ROOT}/clientarea.php?action=domains"], ["label" => $domain, "href" => "{$WEB_ROOT}/clientarea.php?action=domaindetails&id={$domainid}"], ["label" => "Email Forwarding"]]}
{include file="$template/includes/client/pageheader.tpl"}

{if $error}
  {include file="$template/includes/client/alert.tpl" alert_type="error" alert_content=$error}
{/if}
{if $successful}
  {include file="$template/includes/client/alert.tpl" alert_type="success" alert_content="Email forwarding settings updated successfully."}
{/if}

<form method="post" action="{$smarty.server.PHP_SELF}">
  <input type="hidden" name="domainid" value="{$domainid}" />
  <input type="hidden" name="sub" value="save" />
  <input type="hidden" name="token" value="{$token}" />

  <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); overflow: hidden;">
    <div style="border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
      <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600;">Forwarding Rules</h3>
      <p class="text-muted-foreground" style="margin-top: 0.125rem; font-size: 0.75rem;">Forward emails from your domain to another address</p>
    </div>
    <div style="padding: 1.25rem; display: flex; flex-direction: column; gap: 0.75rem;">
      {foreach $emailforwarders as $i => $forwarder}
        <div style="display: flex; align-items: center; gap: 0.5rem;">
          <input type="text" name="prefix[{$i}]" value="{$forwarder.prefix}" class="venom-input" style="flex: 1;" placeholder="user" />
          <span class="text-sm text-muted-foreground">@{$domain} →</span>
          <input type="text" name="forwardto[{$i}]" value="{$forwarder.forwardto}" class="venom-input" style="flex: 2;" placeholder="user@example.com" />
        </div>
      {/foreach}
      {* New rule *}
      <div style="display: flex; align-items: center; gap: 0.5rem;">
        <input type="text" name="prefix[]" class="venom-input" style="flex: 1;" placeholder="new" />
        <span class="text-sm text-muted-foreground">@{$domain} →</span>
        <input type="text" name="forwardto[]" class="venom-input" style="flex: 2;" placeholder="user@example.com" />
      </div>
    </div>
    <div style="display: flex; justify-content: flex-end; gap: 0.5rem; border-top: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
      <button type="submit" class="venom-btn-primary text-sm" style="padding: 0.625rem 1.25rem;">Save Changes</button>
    </div>
  </div>
</form>
