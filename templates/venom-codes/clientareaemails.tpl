{* VENOM CODES — Email History *}

{assign var="page_title" value="Email History"}
{assign var="page_subtitle" value="All emails sent to your account"}
{assign var="breadcrumbs" value=[["label" => "Email History"]]}
{include file="$template/includes/client/pageheader.tpl"}

{if $emails}
  <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); overflow: hidden;">
    <div style="overflow-x: auto;">
      <table style="width: 100%; font-size: 0.875rem; border-collapse: collapse;">
        <thead>
          <tr style="border-bottom: 1px solid hsl(var(--border)); background: hsl(var(--muted) / 0.3);">
            <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Subject</th>
            <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Date</th>
          </tr>
        </thead>
        <tbody>
          {foreach $emails as $email}
            <tr style="{if !$email@last}border-bottom: 1px solid hsl(var(--border));{/if} cursor: pointer;" onclick="window.location='{$WEB_ROOT}/clientarea.php?action=emails&id={$email.id}'">
              <td style="padding: 0.75rem 1rem;">
                <span style="font-weight: 500;">{$email.subject}</span>
              </td>
              <td style="padding: 0.75rem 1rem; color: hsl(var(--muted-foreground)); white-space: nowrap;">{$email.date}</td>
            </tr>
          {/foreach}
        </tbody>
      </table>
    </div>
  </div>

  {include file="$template/includes/client/pagination.tpl"}
{else}
  {include file="$template/includes/client/emptystate.tpl" empty_title="No Emails" empty_description="No emails have been sent to your account yet."}
{/if}
