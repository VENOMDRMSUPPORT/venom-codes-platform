{* VENOM CODES — Password Reset Security Question *}

{assign var="auth_title" value="Security Verification"}
{assign var="auth_subtitle" value="Answer your security question to continue"}
{assign var="auth_icon_svg" value='<svg class="h-6 w-6 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>'}

{capture assign="auth_content"}
<form method="post" action="{$systemurl}pwreset.php" style="display: flex; flex-direction: column; gap: 1.25rem;">
  <input type="hidden" name="token" value="{$token}" />
  <input type="hidden" name="action" value="answer" />
  <input type="hidden" name="email" value="{$email}" />

  <div>
    <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Security Question</label>
    <p style="font-size: 0.875rem; color: hsl(var(--foreground)); padding: 0.75rem; border-radius: 0.5rem; background: hsl(var(--muted) / 0.3); border: 1px solid hsl(var(--border));">{$securityquestion}</p>
  </div>

  <div>
    <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Your Answer</label>
    <input type="text" name="answer" class="venom-input" placeholder="Enter your answer" required />
  </div>

  <button type="submit" class="venom-btn-primary" style="width: 100%; padding: 0.75rem;">
    <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
    Verify &amp; Continue
  </button>
</form>

<p style="margin-top: 1.5rem; text-align: center; font-size: 0.875rem; color: hsl(var(--muted-foreground));">
  <a href="{$WEB_ROOT}/clientarea.php" class="text-primary" style="font-weight: 500; text-decoration: none;">Back to Sign In</a>
</p>
{/capture}

{include file="$template/includes/authlayout.tpl"}