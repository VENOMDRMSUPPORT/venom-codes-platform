{* VENOM CODES — Support Tickets List *}

{assign var="breadcrumbs" value=[['label' => 'Support Tickets']]}
{capture assign="page_actions"}
  <a href="{$WEB_ROOT}/submitticket.php" class="venom-btn-primary" style="font-size: 0.875rem; padding: 0.5rem 1rem;">
    <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
    Open Ticket
  </a>
{/capture}
{include file="$template/includes/client/pageheader.tpl" page_title="Support Tickets" page_subtitle="View and manage your support requests."}

{* Search & filter *}
{capture assign="filter_html"}
  <select name="status" class="venom-input" style="width: auto; padding: 0.5rem 0.75rem;">
    <option value="">All Statuses</option>
    <option value="Open"{if $smarty.get.status eq 'Open'} selected{/if}>Open</option>
    <option value="Answered"{if $smarty.get.status eq 'Answered'} selected{/if}>Answered</option>
    <option value="Customer-Reply"{if $smarty.get.status eq 'Customer-Reply'} selected{/if}>Pending</option>
    <option value="Closed"{if $smarty.get.status eq 'Closed'} selected{/if}>Closed</option>
  </select>
  <select name="deptid" class="venom-input" style="width: auto; padding: 0.5rem 0.75rem;">
    <option value="">All Departments</option>
    {foreach $departments as $dept}
      <option value="{$dept.id}"{if $smarty.get.deptid eq $dept.id} selected{/if}>{$dept.name}</option>
    {/foreach}
  </select>
{/capture}
{include file="$template/includes/client/searchfilterbar.tpl" search_placeholder="Search tickets…"}

{* Tickets table *}
{if $tickets|@count > 0}
<div style="overflow: hidden; border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
  <div style="overflow-x: auto;">
    <table style="width: 100%; font-size: 0.875rem; border-collapse: collapse;">
      <thead>
        <tr style="border-bottom: 1px solid hsl(var(--border)); background: hsl(var(--muted) / 0.3);">
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Ticket #</th>
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Subject</th>
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Department</th>
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Status</th>
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Last Reply</th>
        </tr>
      </thead>
      <tbody>
        {foreach $tickets as $ticket}
          <tr style="border-bottom: 1px solid hsl(var(--border)); transition: background 0.15s;" onmouseover="this.style.background='hsl(var(--muted) / 0.2)'" onmouseout="this.style.background='transparent'">
            <td style="padding: 0.75rem 1rem;"><a href="{$WEB_ROOT}/viewticket.php?tid={$ticket.tid}&c={$ticket.c}" style="font-family: monospace; font-size: 0.75rem; color: hsl(var(--primary)); text-decoration: none;">#{$ticket.tid}</a></td>
            <td style="padding: 0.75rem 1rem;"><a href="{$WEB_ROOT}/viewticket.php?tid={$ticket.tid}&c={$ticket.c}" style="font-weight: 500; color: inherit; text-decoration: none;">{$ticket.subject}</a></td>
            <td style="padding: 0.75rem 1rem;" class="text-muted-foreground">{$ticket.department}</td>
            <td style="padding: 0.75rem 1rem;"><td style="padding: 0.75rem 1rem;">{include file="$template/includes/client/statusbadge.tpl" status_variant=$ticket.status|lower}</td></td>
            <td style="padding: 0.75rem 1rem;" class="text-muted-foreground">{$ticket.lastreply}</td>
          </tr>
        {/foreach}
      </tbody>
    </table>
  </div>
</div>

{include file="$template/includes/client/pagination.tpl"}

{else}
  {include file="$template/includes/client/emptystate.tpl" empty_title="No Tickets Found" empty_description="You haven't submitted any support tickets yet." empty_action="<a href='`$WEB_ROOT`/submitticket.php' class='venom-btn-primary' style='font-size: 0.875rem; padding: 0.5rem 1rem;'>Open Ticket</a>"}
{/if}