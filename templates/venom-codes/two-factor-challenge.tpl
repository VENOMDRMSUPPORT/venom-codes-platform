{* VENOM CODES — Two-Factor Authentication Challenge *}

{* Close the wrapper opened by header.tpl to allow full-page auth layout *}
</div></main>

{assign var="auth_title" value="Two-Factor Authentication"}
{assign var="auth_subtitle" value="Enter the verification code from your authenticator app"}
{assign var="auth_icon_svg" value='<svg class="h-6 w-6 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>'}

{capture assign="auth_content"}
<form method="post" action="{$systemurl}dologin.php" style="display: flex; flex-direction: column; gap: 1.25rem;">
  <input type="hidden" name="token" value="{$token}" />

  <div style="text-align: center;">
    <label style="display: block; margin-bottom: 0.75rem; font-size: 0.875rem; font-weight: 500;">Verification Code</label>
    <input type="text" name="code" class="venom-input" placeholder="000000" required autofocus
      style="text-align: center; font-size: 1.5rem; letter-spacing: 0.5rem; font-weight: 700; max-width: 14rem; margin: 0 auto;"
      maxlength="6" inputmode="numeric" autocomplete="one-time-code" />
  </div>

  {if $error}
    <div style="border-radius: 0.5rem; padding: 0.75rem; background: hsl(var(--destructive) / 0.1); border: 1px solid hsl(var(--destructive) / 0.2);">
      <p style="font-size: 0.875rem; color: hsl(var(--destructive)); text-align: center;">{$error}</p>
    </div>
  {/if}

  <button type="submit" class="venom-btn-primary" style="width: 100%; padding: 0.75rem;">
    <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
    Verify
  </button>

  {if $backupcode}
    <div style="text-align: center; padding-top: 0.5rem; border-top: 1px solid hsl(var(--border));">
      <a href="#" onclick="document.getElementById('backup-input').style.display='block'; this.style.display='none'; return false;" class="text-primary" style="font-size: 0.75rem; text-decoration: none;">
        Use a backup code instead
      </a>
      <div id="backup-input" style="display: none; margin-top: 0.75rem;">
        <input type="text" name="backupcode" class="venom-input" placeholder="Enter backup code" style="text-align: center;" />
      </div>
    </div>
  {/if}
</form>
{/capture}

{include file="$template/includes/authlayout.tpl"}

{* Re-open the wrapper that footer.tpl expects to close *}
<main style="flex: 1;"><div class="venom-container" style="padding: 2rem 1rem;">