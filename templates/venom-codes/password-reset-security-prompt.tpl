{* VENOM CODES — Password Reset Security Question *}

{* Close the wrapper opened by header.tpl to allow full-page auth layout *}
</div></main>

{assign var="auth_title" value="Security Verification"}
{assign var="auth_subtitle" value="Answer your security question to continue"}
{assign var="auth_icon_svg" value='<svg class="h-6 w-6 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>'}

{capture assign="auth_content"}
<form method="post" action="{$systemurl}pwreset.php" class="venom-form" role="form" aria-label="Security verification">
  <input type="hidden" name="token" value="{$token}" />
  <input type="hidden" name="action" value="answer" />
  <input type="hidden" name="email" value="{$email}" />

  <div class="venom-form-group">
    <label class="venom-label">Security Question</label>
    <p class="venom-security-question">{$securityquestion}</p>
  </div>

  <div class="venom-form-group">
    <label for="answer" class="venom-label">Your Answer</label>
    <input type="text" id="answer" name="answer" class="venom-input" placeholder="Enter your answer" required aria-required="true" autocomplete="off" />
  </div>

  <button type="submit" class="venom-btn-primary venom-btn-block">
    <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
    Verify &amp; Continue
  </button>
</form>

<p class="venom-auth-switch">
  <a href="{$WEB_ROOT}/clientarea.php" class="venom-link">Back to Sign In</a>
</p>
{/capture}

{include file="$template/includes/authlayout.tpl"}

{* Re-open the wrapper that footer.tpl expects to close *}
<main style="flex: 1;"><div class="venom-container" style="padding: 2rem 1rem;">