{* VENOM CODES — Server Status *}

<div style="max-width: 48rem; margin: 0 auto;">

  <div style="margin-bottom: 2rem; text-align: center;">
    <h1 class="font-display" style="font-size: 1.5rem; font-weight: 700; letter-spacing: -0.025em;">Server Status</h1>
    <p class="text-sm text-muted-foreground" style="margin-top: 0.25rem;">Real-time status of our infrastructure.</p>
  </div>

  {if $serverstatuses}
    <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); overflow: hidden;">
      <div style="overflow-x: auto;">
        <table style="width: 100%; font-size: 0.875rem; border-collapse: collapse;">
          <thead>
            <tr style="border-bottom: 1px solid hsl(var(--border)); background: hsl(var(--muted) / 0.3);">
              <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Server</th>
              <th style="padding: 0.75rem 1rem; text-align: center; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">HTTP</th>
              <th style="padding: 0.75rem 1rem; text-align: center; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">FTP</th>
              <th style="padding: 0.75rem 1rem; text-align: center; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Load</th>
              <th style="padding: 0.75rem 1rem; text-align: center; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Uptime</th>
            </tr>
          </thead>
          <tbody>
            {foreach $serverstatuses as $server}
              <tr style="{if !$server@last}border-bottom: 1px solid hsl(var(--border));{/if}">
                <td style="padding: 0.75rem 1rem; font-weight: 500;">{$server.name}</td>
                <td style="padding: 0.75rem 1rem; text-align: center;">
                  {if $server.httpstatus}
                    <span style="display: inline-block; height: 0.5rem; width: 0.5rem; border-radius: 9999px; background: hsl(160 84% 39%);"></span>
                  {else}
                    <span style="display: inline-block; height: 0.5rem; width: 0.5rem; border-radius: 9999px; background: hsl(var(--destructive));"></span>
                  {/if}
                </td>
                <td style="padding: 0.75rem 1rem; text-align: center;">
                  {if $server.ftpstatus}
                    <span style="display: inline-block; height: 0.5rem; width: 0.5rem; border-radius: 9999px; background: hsl(160 84% 39%);"></span>
                  {else}
                    <span style="display: inline-block; height: 0.5rem; width: 0.5rem; border-radius: 9999px; background: hsl(var(--destructive));"></span>
                  {/if}
                </td>
                <td style="padding: 0.75rem 1rem; text-align: center;">{$server.load}</td>
                <td style="padding: 0.75rem 1rem; text-align: center;">{$server.uptime}</td>
              </tr>
            {/foreach}
          </tbody>
        </table>
      </div>
    </div>
  {else}
    <div style="border-radius: 0.75rem; border: 1px dashed hsl(var(--border)); background: hsl(var(--card)); padding: 3rem; text-align: center;">
      <p class="text-muted-foreground" style="font-size: 0.875rem;">No server status data available.</p>
    </div>
  {/if}

</div>
