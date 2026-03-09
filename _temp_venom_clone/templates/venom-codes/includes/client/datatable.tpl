{* VENOM CODES — Data Table Partial *}

{if isset($table_rows) && $table_rows|@count > 0}
<div class="{if isset($table_class)}{$table_class}{/if}" style="overflow: hidden; border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
  <div style="overflow-x: auto;">
    <table style="width: 100%; font-size: 0.875rem; border-collapse: collapse;">
      <thead>
        <tr style="border-bottom: 1px solid hsl(var(--border)); background: hsl(var(--muted) / 0.3);">
          {foreach $table_columns as $col}
            <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground)); {if isset($col.class)}{$col.class}{/if}">
              {$col.header}
            </th>
          {/foreach}
        </tr>
      </thead>
      <tbody>
        {$table_rows}
      </tbody>
    </table>
  </div>
</div>
{else}
<div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 3rem; text-align: center;">
  <p class="text-muted-foreground" style="font-size: 0.875rem;">
    {if isset($table_empty_message)}{$table_empty_message}{else}No data found.{/if}
  </p>
</div>
{/if}