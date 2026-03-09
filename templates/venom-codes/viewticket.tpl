{* VENOM CODES — Ticket Details *}

{assign var="breadcrumbs" value=[['label' => 'Support Tickets', 'href' => "`$WEB_ROOT`/supporttickets.php"], ['label' => "#`$tid`"]]}
{capture assign="page_actions"}
  <div style="display: flex; flex-wrap: wrap; align-items: center; gap: 0.5rem;">
    {if $status ne "Closed"}
      <form method="post" action="{$WEB_ROOT}/viewticket.php?tid={$tid}&c={$c}" style="display: inline;">
        <input type="hidden" name="token" value="{$token}" />
        <input type="hidden" name="closerequest" value="close" />
        <button type="submit" class="venom-btn-secondary" style="font-size: 0.875rem; padding: 0.5rem 0.75rem;">Close Ticket</button>
      </form>
    {/if}
  </div>
{/capture}
{include file="$template/includes/client/pageheader.tpl" page_title=$subject page_subtitle="Ticket #`$tid`"}

<div style="display: grid; grid-template-columns: 1fr; gap: 1.5rem;">
  <style>@media (min-width: 1024px) { .ticket-detail-grid { grid-template-columns: 2fr 1fr !important; } }</style>
  <div class="ticket-detail-grid" style="display: grid; grid-template-columns: 1fr; gap: 1.5rem;">

    {* Conversation + Reply *}
    <div style="display: flex; flex-direction: column; gap: 1.5rem;">

      {* Conversation thread *}
      {include file="$template/includes/client/ticketconversation.tpl" replies=$descreplies}

      {* Reply form *}
      {if $status ne "Closed"}
        <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
          <div style="border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
            <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600;">Post Reply</h3>
          </div>
          <form method="post" action="{$WEB_ROOT}/viewticket.php?tid={$tid}&c={$c}" enctype="multipart/form-data">
            <input type="hidden" name="token" value="{$token}" />
            <div style="padding: 1.25rem; display: flex; flex-direction: column; gap: 1rem;">
              <textarea name="replymessage" rows="5" class="venom-input" style="min-height: 120px; resize: vertical;" placeholder="Type your reply…" required></textarea>
              <div style="display: flex; align-items: center; justify-content: space-between;">
                <label class="venom-btn-secondary" style="font-size: 0.875rem; padding: 0.5rem 0.75rem; cursor: pointer;">
                  <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21.44 11.05l-9.19 9.19a6 6 0 0 1-8.49-8.49l9.19-9.19a4 4 0 0 1 5.66 5.66l-9.2 9.19a2 2 0 0 1-2.83-2.83l8.49-8.48"/></svg>
                  Attach File
                  <input type="file" name="attachments[]" style="display: none;" />
                </label>
                <button type="submit" name="replyticket" value="1" class="venom-btn-primary" style="font-size: 0.875rem; padding: 0.5rem 0.75rem;">
                  <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg>
                  Submit Reply
                </button>
              </div>
            </div>
          </form>
        </div>
      {/if}

    </div>

    {* Sidebar *}
    <div style="display: flex; flex-direction: column; gap: 1rem;">
      {assign var="panel_rows" value=[
        ['label' => 'Ticket ID', 'value' => "<span style='font-family: monospace; font-size: 0.75rem;'>#`$tid`</span>"],
        ['label' => 'Department', 'value' => $department],
        ['label' => 'Priority', 'value' => $priority],
        ['label' => 'Created', 'value' => $date],
        ['label' => 'Last Updated', 'value' => $lastreply]
      ]}
      {include file="$template/includes/client/summarypanel.tpl" panel_title="Ticket Information"}

      {if $service}
        {assign var="panel_rows" value=[
          ['label' => 'Service', 'value' => "<a href='`$WEB_ROOT`/clientarea.php?action=productdetails&id=`$service`' style='font-size: 0.75rem; color: hsl(var(--primary)); text-decoration: none;'>`$servicename`</a>"]
        ]}
        {include file="$template/includes/client/summarypanel.tpl" panel_title="Related Service"}
      {/if}
    </div>

  </div>
</div>