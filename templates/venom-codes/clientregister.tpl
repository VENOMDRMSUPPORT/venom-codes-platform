{* VENOM CODES — Register Page *}

{* Close the wrapper opened by header.tpl to allow full-page auth layout *}
</div></main>

{assign var="auth_title" value="Create Account"}
{assign var="auth_subtitle" value="Get started with VENOM CODES today"}
{assign var="auth_icon_svg" value='<svg class="h-6 w-6 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="8.5" cy="7" r="4"/><line x1="20" y1="8" x2="20" y2="14"/><line x1="23" y1="11" x2="17" y2="11"/></svg>'}

{capture assign="auth_content"}
<form method="post" action="{$systemurl}register.php" class="venom-form" role="form" aria-label="Create new account">
  <input type="hidden" name="token" value="{$token}" />

  <div class="venom-form-row">
    <div class="venom-form-group">
      <label for="firstname" class="venom-label">First Name</label>
      <input type="text" id="firstname" name="firstname" class="venom-input" placeholder="John" required aria-required="true" autocomplete="given-name" />
    </div>
    <div class="venom-form-group">
      <label for="lastname" class="venom-label">Last Name</label>
      <input type="text" id="lastname" name="lastname" class="venom-input" placeholder="Doe" required aria-required="true" autocomplete="family-name" />
    </div>
  </div>

  <div class="venom-form-group">
    <label for="email" class="venom-label">Email Address</label>
    <input type="email" id="email" name="email" class="venom-input" placeholder="you@example.com" required aria-required="true" autocomplete="email" />
  </div>

  <div class="venom-form-group">
    <label for="password" class="venom-label">Password</label>
    <input type="password" id="password" name="password" class="venom-input" placeholder="Enter your password" required aria-required="true" autocomplete="new-password" />
  </div>

  <div class="venom-form-group">
    <label for="password2" class="venom-label">Confirm Password</label>
    <input type="password" id="password2" name="password2" class="venom-input" placeholder="Confirm your password" required aria-required="true" autocomplete="new-password" />
  </div>

  <div class="venom-form-group">
    <label class="venom-checkbox-label">
      <input type="checkbox" name="accepttos" id="terms" class="venom-checkbox" required aria-required="true" />
      <span class="venom-checkbox-custom" aria-hidden="true"></span>
      <span class="venom-checkbox-text">
        I agree to the
        <a href="{$WEB_ROOT}/terms.php" class="venom-link" target="_blank">Terms of Service</a>
        and
        <a href="{$WEB_ROOT}/privacy.php" class="venom-link" target="_blank">Privacy Policy</a>
      </span>
    </label>
  </div>

  {if $captcha}
    <div class="venom-form-group">{$captcha}</div>
  {/if}

  <button type="submit" class="venom-btn-primary venom-btn-block">
    <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="8.5" cy="7" r="4"/><line x1="20" y1="8" x2="20" y2="14"/><line x1="23" y1="11" x2="17" y2="11"/></svg>
    Create Account
  </button>
</form>

<p class="venom-auth-switch">
  Already have an account?
  <a href="{$WEB_ROOT}/clientarea.php" class="venom-link">Sign in</a>
</p>
{/capture}

{include file="$template/includes/authlayout.tpl"}

{* Re-open the wrapper that footer.tpl expects to close *}
<main style="flex: 1;"><div class="venom-container" style="padding: 2rem 1rem;">
