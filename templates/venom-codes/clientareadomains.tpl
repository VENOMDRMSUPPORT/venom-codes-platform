{* VENOM CODES — Domains List *}

{assign var="breadcrumbs" value=[['label' => 'Domains']]}
{capture assign="page_actions"}
  <div style="display: flex; gap: 0.5rem;">
    <a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer" class="venom-btn-secondary" style="font-size: 0.875rem; padding: 0.5rem 1rem;">Transfer Domain</a>
    <a href="{$WEB_ROOT}/cart.php?a=add&domain=register" class="venom-btn-primary" style="font-size: 0.875rem; padding: 0.5rem 1rem;">
      <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
      Register New
    </a>
  </div>
{/capture}
{include file="$template/includes/client/pageheader.tpl" page_title="My Domains" page_subtitle="Manage your registered domains."}

{* Search & filter *}
{capture assign="filter_html"}
  <select name="status" class="venom-input" style="width: auto; padding: 0.5rem 0.75rem;">
    <option value="">All Statuses</option>
    <option value="Active"{if $smarty.get.status eq 'Active'} selected{/if}>Active</option>
    <option value="Pending"{if $smarty.get.status eq 'Pending'} selected{/if}>Pending</option>
    <option value="Expired"{if $smarty.get.status eq 'Expired'} selected{/if}>Expired</option>
  </select>
{/capture}
{include file="$template/includes/client/searchfilterbar.tpl" search_placeholder="Search domains…"}

{* Domains table *}
{if $domains|@count > 0}
<div style="overflow: hidden; border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
  <div style="overflow-x: auto;">
    <table style="width: 100%; font-size: 0.875rem; border-collapse: collapse;">
      <thead>
        <tr style="border-bottom: 1px solid hsl(var(--border)); background: hsl(var(--muted) / 0.3);">
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Domain</th>
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Registered</th>
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Expires</th>
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Auto Renew</th>
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Status</th>
        </tr>
      </thead>
      <tbody>
        {foreach $domains as $domain}
          <tr style="border-bottom: 1px solid hsl(var(--border)); transition: background 0.15s;" onmouseover="this.style.background='hsl(var(--muted) / 0.2)'" onmouseout="this.style.background='transparent'">
            <td style="padding: 0.75rem 1rem;"><a href="{$WEB_ROOT}/clientarea.php?action=domaindetails&id={$domain.id}" style="font-weight: 500; color: hsl(var(--primary)); text-decoration: none;">{$domain.domain}</a></td>
            <td style="padding: 0.75rem 1rem;" class="text-muted-foreground">{$domain.registrationdate}</td>
            <td style="padding: 0.75rem 1rem;" class="text-muted-foreground">{$domain.nextduedate}</td>
            <td style="padding: 0.75rem 1rem;">
              <span style="font-size: 0.75rem; font-weight: 500; {if $domain.autorenew}color: hsl(160 84% 39%);{else}color: hsl(var(--muted-foreground));{/if}">
                {if $domain.autorenew}On{else}Off{/if}
              </span>
            </td>
            <td style="padding: 0.75rem 1rem;">{include file="$template/includes/client/statusbadge.tpl" status_variant=$domain.statusClass}</td>
          </tr>
        {/foreach}
      </tbody>
    </table>
  </div>
</div>

{include file="$template/includes/client/pagination.tpl"}

{else}
  {include file="$template/includes/client/emptystate.tpl" empty_title="No Domains Found" empty_description="You don't have any registered domains." empty_action="<a href='`$WEB_ROOT`/cart.php?a=add&domain=register' class='venom-btn-primary' style='font-size: 0.875rem; padding: 0.5rem 1rem;'>Register Domain</a>"}
{/if}