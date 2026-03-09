{* VENOM CODES — Domain DNS Management *}

{assign var="page_title" value="DNS Management"}
{assign var="page_subtitle" value=$domain}
{assign var="breadcrumbs" value=[["label" => "Domains", "href" => "{$WEB_ROOT}/clientarea.php?action=domains"], ["label" => $domain, "href" => "{$WEB_ROOT}/clientarea.php?action=domaindetails&id={$domainid}"], ["label" => "DNS"]]}
{include file="$template/includes/client/pageheader.tpl"}

{if $error}
  {include file="$template/includes/client/alert.tpl" alert_type="error" alert_content=$error}
{/if}
{if $successful}
  {include file="$template/includes/client/alert.tpl" alert_type="success" alert_content="DNS records updated successfully."}
{/if}

<form method="post" action="{$smarty.server.PHP_SELF}">
  <input type="hidden" name="sub" value="save" />
  <input type="hidden" name="domainid" value="{$domainid}" />
  <input type="hidden" name="token" value="{$token}" />

  <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); overflow: hidden;">
    <div style="border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem; display: flex; align-items: center; justify-content: space-between;">
      <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600;">DNS Records</h3>
    </div>
    <div style="overflow-x: auto;">
      <table style="width: 100%; font-size: 0.875rem; border-collapse: collapse;">
        <thead>
          <tr style="border-bottom: 1px solid hsl(var(--border)); background: hsl(var(--muted) / 0.3);">
            <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Hostname</th>
            <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Type</th>
            <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Address</th>
            <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Priority</th>
          </tr>
        </thead>
        <tbody>
          {foreach $dnsrecords as $i => $record}
            <tr style="border-bottom: 1px solid hsl(var(--border));">
              <td style="padding: 0.5rem 1rem;"><input type="text" name="dnsrecordhost[{$i}]" value="{$record.hostname}" class="venom-input" /></td>
              <td style="padding: 0.5rem 1rem;">
                <select name="dnsrecordtype[{$i}]" class="venom-input">
                  {foreach $dnsrecordtypes as $type}<option value="{$type}" {if $record.type eq $type}selected{/if}>{$type}</option>{/foreach}
                </select>
              </td>
              <td style="padding: 0.5rem 1rem;"><input type="text" name="dnsrecordaddress[{$i}]" value="{$record.address}" class="venom-input" /></td>
              <td style="padding: 0.5rem 1rem;"><input type="text" name="dnsrecordpriority[{$i}]" value="{$record.priority}" class="venom-input" style="width: 5rem;" /></td>
            </tr>
          {/foreach}
          {* New record row *}
          <tr style="background: hsl(var(--muted) / 0.1);">
            <td style="padding: 0.5rem 1rem;"><input type="text" name="dnsrecordhost[]" class="venom-input" placeholder="New record" /></td>
            <td style="padding: 0.5rem 1rem;">
              <select name="dnsrecordtype[]" class="venom-input">
                {foreach $dnsrecordtypes as $type}<option value="{$type}">{$type}</option>{/foreach}
              </select>
            </td>
            <td style="padding: 0.5rem 1rem;"><input type="text" name="dnsrecordaddress[]" class="venom-input" placeholder="Address" /></td>
            <td style="padding: 0.5rem 1rem;"><input type="text" name="dnsrecordpriority[]" class="venom-input" style="width: 5rem;" /></td>
          </tr>
        </tbody>
      </table>
    </div>
    <div style="display: flex; justify-content: flex-end; gap: 0.5rem; border-top: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
      <button type="submit" class="venom-btn-primary text-sm" style="padding: 0.625rem 1.25rem;">Save Changes</button>
    </div>
  </div>
</form>
