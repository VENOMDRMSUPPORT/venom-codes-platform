{* VENOM CODES — Two-Factor New Backup Code *}

{assign var="auth_title" value="Backup Code"}
{assign var="auth_subtitle" value="Save this code in a secure place. You'll need it if you lose access to your authenticator."}
{assign var="auth_icon_svg" value='<svg class="h-6 w-6 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>'}

{capture assign="auth_content"}

<div style="text-align: center;">
  <div style="padding: 1rem 1.25rem; border-radius: 0.5rem; background: hsl(var(--muted) / 0.3); border: 1px solid hsl(var(--border)); font-family: monospace; font-size: 1.25rem; font-weight: 700; letter-spacing: 0.1em; margin-bottom: 1rem;">
    {$backupcode}
  </div>

  <p class="text-xs text-muted-foreground" style="margin-bottom: 1.5rem;">
    This code will only be shown once. Store it securely.
  </p>

  <a href="{$WEB_ROOT}/clientarea.php" class="venom-btn-primary" style="width: 100%; padding: 0.75rem;">
    I've Saved My Code — Continue
  </a>
</div>

{/capture}

{include file="$template/includes/authlayout.tpl"}