{* VENOM CODES — View Single Email *}

{assign var="page_title" value=$email.subject}
{assign var="breadcrumbs" value=[["label" => "Email History", "href" => "{$WEB_ROOT}/clientarea.php?action=emails"], ["label" => "View Email"]]}
{include file="$template/includes/client/pageheader.tpl"}

<div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); overflow: hidden;">

  {* Email header *}
  <div style="border-bottom: 1px solid hsl(var(--border)); padding: 1rem 1.25rem;">
    <h2 class="font-display" style="font-size: 1.125rem; font-weight: 600;">{$email.subject}</h2>
    <div class="text-sm text-muted-foreground" style="margin-top: 0.375rem; display: flex; flex-wrap: wrap; align-items: center; gap: 1rem;">
      <span>Date: {$email.date}</span>
    </div>
  </div>

  {* Email body *}
  <div style="padding: 1.25rem; font-size: 0.9375rem; line-height: 1.75;">
    {$email.message}
  </div>

</div>

<div style="margin-top: 1rem;">
  <a href="{$WEB_ROOT}/clientarea.php?action=emails" class="venom-btn-secondary text-sm" style="padding: 0.5rem 1rem;">
    <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 18 9 12 15 6"/></svg>
    Back to Emails
  </a>
</div>
