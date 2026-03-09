{* VENOM CODES — Submit New Ticket *}

{assign var="breadcrumbs" value=[['label' => 'Support Tickets', 'href' => "`$WEB_ROOT`/supporttickets.php"], ['label' => 'New Ticket']]}
{include file="$template/includes/client/pageheader.tpl" page_title="Open New Ticket" page_subtitle="Submit a support request to our team."}

<div style="max-width: 42rem; margin: 0 auto;">

  {include file="$template/includes/client/alert.tpl" alert_type="info" alert_content="Please check the <a href='`$WEB_ROOT`/knowledgebase.php' style='text-decoration: underline; font-weight: 600;'>Knowledge Base</a> before opening a ticket — your question may already be answered."}

  <form method="post" action="{$WEB_ROOT}/submitticket.php" enctype="multipart/form-data" style="margin-top: 1.5rem;">
    <input type="hidden" name="token" value="{$token}" />

    <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
      <div style="border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
        <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600;">Ticket Details</h3>
        <p class="text-muted-foreground" style="margin-top: 0.125rem; font-size: 0.75rem;">Provide as much detail as possible so we can assist you quickly.</p>
      </div>
      <div style="padding: 1.25rem; display: flex; flex-direction: column; gap: 1rem;">

        {* Department & Priority row *}
        <div style="display: grid; grid-template-columns: 1fr; gap: 1rem;">
          <style>@media (min-width: 640px) { .ticket-row-2 { grid-template-columns: repeat(2, 1fr) !important; } }</style>
          <div class="ticket-row-2" style="display: grid; grid-template-columns: 1fr; gap: 1rem;">
            <div>
              <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Department <span class="text-destructive">*</span></label>
              <select name="deptid" class="venom-input" required>
                <option value="">— Select Department —</option>
                {foreach $departments as $dept}
                  <option value="{$dept.id}">{$dept.name}</option>
                {/foreach}
              </select>
            </div>
            <div>
              <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Priority <span class="text-destructive">*</span></label>
              <select name="urgency" class="venom-input" required>
                <option value="Low">Low</option>
                <option value="Medium" selected>Medium</option>
                <option value="High">High</option>
              </select>
            </div>
          </div>
        </div>

        {* Related service *}
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Related Service</label>
          <select name="relatedservice" class="venom-input">
            <option value="">— None —</option>
            {foreach $services as $service}
              <option value="{$service.id}">{$service.product} ({$service.domain})</option>
            {/foreach}
          </select>
          <p class="text-muted-foreground" style="margin-top: 0.25rem; font-size: 0.75rem;">Optional — link this ticket to a specific service.</p>
        </div>

        {* Subject *}
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Subject <span class="text-destructive">*</span></label>
          <input type="text" name="subject" class="venom-input" placeholder="Brief summary of your issue" required />
        </div>

        {* Message *}
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Message <span class="text-destructive">*</span></label>
          <textarea name="message" rows="6" class="venom-input" style="min-height: 150px; resize: vertical;" placeholder="Describe your issue in detail…" required></textarea>
        </div>

        {* Attachments *}
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Attachments</label>
          <div style="display: flex; align-items: center; gap: 0.75rem;">
            <label class="venom-btn-secondary" style="font-size: 0.875rem; padding: 0.5rem 0.75rem; cursor: pointer;">
              <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21.44 11.05l-9.19 9.19a6 6 0 0 1-8.49-8.49l9.19-9.19a4 4 0 0 1 5.66 5.66l-9.2 9.19a2 2 0 0 1-2.83-2.83l8.49-8.48"/></svg>
              Choose File
              <input type="file" name="attachments[]" style="display: none;" />
            </label>
            <span class="text-muted-foreground" style="font-size: 0.75rem;">Max file size: 10MB. Allowed types: jpg, png, pdf, txt, zip.</span>
          </div>
        </div>
      </div>

      {* Submit *}
      <div style="display: flex; justify-content: flex-end; gap: 0.5rem; border-top: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
        <button type="submit" class="venom-btn-primary" style="font-size: 0.875rem; padding: 0.5rem 1rem;">
          <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg>
          Submit Ticket
        </button>
      </div>
    </div>
  </form>

</div>