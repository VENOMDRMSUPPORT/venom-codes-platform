{* VENOM CODES — Email Verification Page *}

{assign var="auth_title" value="Verify Your Identity"}
{assign var="auth_subtitle" value="A security verification step is required"}
{assign var="auth_icon_svg" value='<svg class="h-6 w-6 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 12l2 2 4-4"/><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>'}

{capture assign="auth_content"}
<div style="text-align: center; display: flex; flex-direction: column; gap: 1.5rem;">
  <div style="margin: 0 auto; display: inline-flex; border-radius: 9999px; padding: 1rem; background: hsl(var(--accent-muted));">
    <svg class="h-8 w-8 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 12l2 2 4-4"/><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
  </div>
  <div>
    <h3 class="font-display" style="font-size: 1rem; font-weight: 600; margin-bottom: 0.5rem;">Check Your Email</h3>
    <p class="text-sm text-muted-foreground" style="line-height: 1.625;">
      We've sent a verification link to your registered email address.
      Please check your inbox and click the link to verify your account.
    </p>
  </div>
  <div style="border-radius: 0.5rem; border: 1px solid hsl(var(--border)); background: hsl(var(--secondary) / 0.5); padding: 1rem;">
    <div style="display: flex; align-items: center; gap: 0.75rem;">
      <svg class="h-5 w-5 text-muted-foreground" style="flex-shrink: 0;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>
      <p class="text-xs text-muted-foreground" style="text-align: left;">
        If you don't see the email, check your spam folder. The link expires in 24 hours.
      </p>
    </div>
  </div>
  <button class="venom-btn-secondary" style="width: 100%; padding: 0.75rem; font-size: 0.875rem;">
    Resend Verification Email
  </button>
</div>

<p style="margin-top: 1.5rem; text-align: center; font-size: 0.875rem; color: hsl(var(--muted-foreground));">
  <a href="{$WEB_ROOT}/clientarea.php" class="text-primary" style="font-weight: 500; text-decoration: none;">Back to Sign In</a>
</p>
{/capture}

{include file="$template/includes/authlayout.tpl"}