{* VENOM CODES — Domain Pricing *}

<div style="max-width: 64rem; margin: 0 auto;">

  <div style="margin-bottom: 2rem; text-align: center;">
    <h1 class="font-display" style="font-size: 1.5rem; font-weight: 700; letter-spacing: -0.025em;">Domain Pricing</h1>
    <p class="text-sm text-muted-foreground" style="margin-top: 0.25rem;">Find and register your perfect domain name.</p>
  </div>

  {* Search *}
  <form method="post" action="{$WEB_ROOT}/cart.php?a=add&domain=register" style="margin-bottom: 2rem;">
    <div style="display: flex; max-width: 36rem; margin: 0 auto; gap: 0.5rem;">
      <input type="text" name="query" class="venom-input" placeholder="Search for a domain…" style="flex: 1;" />
      <button type="submit" class="venom-btn-primary text-sm" style="padding: 0.625rem 1.25rem;">Search</button>
    </div>
  </form>

  {* Pricing table *}
  {if $pricing}
    <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); overflow: hidden;">
      <div style="overflow-x: auto;">
        <table style="width: 100%; font-size: 0.875rem; border-collapse: collapse;">
          <thead>
            <tr style="border-bottom: 1px solid hsl(var(--border)); background: hsl(var(--muted) / 0.3);">
              <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">TLD</th>
              <th style="padding: 0.75rem 1rem; text-align: right; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Register</th>
              <th style="padding: 0.75rem 1rem; text-align: right; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Transfer</th>
              <th style="padding: 0.75rem 1rem; text-align: right; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Renew</th>
            </tr>
          </thead>
          <tbody>
            {foreach $pricing as $tld}
              <tr style="{if !$tld@last}border-bottom: 1px solid hsl(var(--border));{/if}">
                <td style="padding: 0.75rem 1rem; font-weight: 600;">.{$tld.tld}</td>
                <td style="padding: 0.75rem 1rem; text-align: right;">{if $tld.register}{$tld.register.1}{else}<span class="text-muted-foreground">N/A</span>{/if}</td>
                <td style="padding: 0.75rem 1rem; text-align: right;">{if $tld.transfer}{$tld.transfer.1}{else}<span class="text-muted-foreground">N/A</span>{/if}</td>
                <td style="padding: 0.75rem 1rem; text-align: right;">{if $tld.renew}{$tld.renew.1}{else}<span class="text-muted-foreground">N/A</span>{/if}</td>
              </tr>
            {/foreach}
          </tbody>
        </table>
      </div>
    </div>
  {else}
    <div style="border-radius: 0.75rem; border: 1px dashed hsl(var(--border)); background: hsl(var(--card)); padding: 3rem; text-align: center;">
      <p class="text-muted-foreground" style="font-size: 0.875rem;">No domain pricing data available.</p>
    </div>
  {/if}

</div>
