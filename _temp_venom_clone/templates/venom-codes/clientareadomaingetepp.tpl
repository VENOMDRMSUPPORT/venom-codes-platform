{* VENOM CODES — Domain EPP Code *}

{assign var="page_title" value="EPP Transfer Code"}
{assign var="page_subtitle" value=$domain}
{assign var="breadcrumbs" value=[["label" => "Domains", "href" => "{$WEB_ROOT}/clientarea.php?action=domains"], ["label" => $domain, "href" => "{$WEB_ROOT}/clientarea.php?action=domaindetails&id={$domainid}"], ["label" => "EPP Code"]]}
{include file="$template/includes/client/pageheader.tpl"}

<div style="max-width: 32rem;">
  <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 1.5rem; text-align: center;">
    <div style="margin: 0 auto 1rem; display: flex; height: 3rem; width: 3rem; align-items: center; justify-content: center; border-radius: 0.75rem; background: hsl(var(--primary) / 0.1); color: hsl(var(--primary));">
      <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
    </div>

    {if $eppcode}
      <p class="text-sm text-muted-foreground" style="margin-bottom: 1rem;">Your EPP/Authorization code for <strong>{$domain}</strong>:</p>
      <div style="padding: 0.75rem 1.25rem; border-radius: 0.5rem; background: hsl(var(--muted) / 0.3); border: 1px solid hsl(var(--border)); font-family: monospace; font-size: 1.125rem; font-weight: 700; letter-spacing: 0.05em;">
        {$eppcode}
      </div>
      <p class="text-xs text-muted-foreground" style="margin-top: 1rem;">Keep this code secure. You'll need it to transfer your domain to another registrar.</p>
    {else}
      <p class="text-sm text-muted-foreground">Unable to retrieve the EPP code. Please contact support.</p>
    {/if}

    <div style="margin-top: 1.5rem;">
      <a href="{$WEB_ROOT}/clientarea.php?action=domaindetails&id={$domainid}" class="venom-btn-secondary text-sm" style="padding: 0.5rem 1.25rem;">Back to Domain</a>
    </div>
  </div>
</div>
