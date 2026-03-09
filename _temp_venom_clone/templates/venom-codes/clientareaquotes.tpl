{* VENOM CODES — Quotes List *}

{assign var="page_title" value="Quotes"}
{assign var="page_subtitle" value="View your price quotes"}
{assign var="breadcrumbs" value=[["label" => "Quotes"]]}
{include file="$template/includes/client/pageheader.tpl"}

{if $quotes}
  <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); overflow: hidden;">
    <div style="overflow-x: auto;">
      <table style="width: 100%; font-size: 0.875rem; border-collapse: collapse;">
        <thead>
          <tr style="border-bottom: 1px solid hsl(var(--border)); background: hsl(var(--muted) / 0.3);">
            <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Quote #</th>
            <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Subject</th>
            <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Date</th>
            <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Valid Until</th>
            <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Status</th>
          </tr>
        </thead>
        <tbody>
          {foreach $quotes as $quote}
            <tr style="{if !$quote@last}border-bottom: 1px solid hsl(var(--border));{/if}" onclick="window.location='{$WEB_ROOT}/viewquote.php?id={$quote.id}'" style="cursor: pointer;">
              <td style="padding: 0.75rem 1rem; font-weight: 500;">#{$quote.id}</td>
              <td style="padding: 0.75rem 1rem;">{$quote.subject}</td>
              <td style="padding: 0.75rem 1rem; color: hsl(var(--muted-foreground));">{$quote.datecreated}</td>
              <td style="padding: 0.75rem 1rem; color: hsl(var(--muted-foreground));">{$quote.validuntil}</td>
              <td style="padding: 0.75rem 1rem;"><td style="padding: 0.75rem 1rem;">{include file="$template/includes/client/statusbadge.tpl" status_variant=$quote.stage|lower}</td></td>
            </tr>
          {/foreach}
        </tbody>
      </table>
    </div>
  </div>
{else}
  {include file="$template/includes/client/emptystate.tpl" empty_title="No Quotes" empty_description="You don't have any quotes yet."}
{/if}
