{* VENOM CODES — Stat Card Partial *}

<div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 1.25rem; transition: all 0.15s;">
  <div style="display: flex; align-items: flex-start; justify-content: space-between;">
    <div style="display: flex; height: 2.5rem; width: 2.5rem; align-items: center; justify-content: center; border-radius: 0.5rem; background: hsl(var(--primary) / 0.1); color: hsl(var(--primary));">
      {$stat_icon_svg}
    </div>
    {if isset($stat_trend_value)}
      <span style="display: inline-flex; align-items: center; gap: 0.25rem; font-size: 0.75rem; font-weight: 500; color: {if $stat_trend_positive}hsl(160 84% 39%){else}hsl(var(--destructive)){/if};">
        {$stat_trend_value}
      </span>
    {/if}
  </div>
  <div style="margin-top: 0.75rem;">
    <p class="font-display" style="font-size: 1.5rem; font-weight: 700; letter-spacing: -0.025em;">{$stat_value}</p>
    <p class="text-xs text-muted-foreground" style="margin-top: 0.125rem;">{$stat_label}</p>
  </div>
</div>
