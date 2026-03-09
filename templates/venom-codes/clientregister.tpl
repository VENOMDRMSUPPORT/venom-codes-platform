{* VENOM CODES — Register Page *}

{assign var="auth_title" value="Create Account"}
{assign var="auth_subtitle" value="Get started with VENOM CODES today"}
{assign var="auth_icon_svg" value='<svg class="h-6 w-6 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="8.5" cy="7" r="4"/><line x1="20" y1="8" x2="20" y2="14"/><line x1="23" y1="11" x2="17" y2="11"/></svg>'}

{capture assign="auth_content"}
<form method="post" action="{$systemurl}register.php" style="display: flex; flex-direction: column; gap: 1.25rem;">
  <input type="hidden" name="token" value="{$token}" />

  <div style="display: grid; gap: 1.25rem; grid-template-columns: repeat(2, 1fr);">
    <div>
      <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">First Name</label>
      <input type="text" name="firstname" class="venom-input" placeholder="John" required />
    </div>
    <div>
      <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Last Name</label>
      <input type="text" name="lastname" class="venom-input" placeholder="Doe" required />
    </div>
  </div>

  <div>
    <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Email Address</label>
    <input type="email" name="email" class="venom-input" placeholder="you@example.com" required />
  </div>

  <div>
    <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Password</label>
    <input type="password" name="password" class="venom-input" placeholder="Min. 8 characters" required />
  </div>

  <div>
    <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Confirm Password</label>
    <input type="password" name="password2" class="venom-input" placeholder="••••••••" required />
  </div>

  <div style="display: flex; align-items: flex-start; gap: 0.5rem;">
    <input type="checkbox" name="accepttos" id="terms" style="margin-top: 0.25rem; border-radius: 0.25rem;" required />
    <label for="terms" class="text-xs text-muted-foreground">
      I agree to the
      <a href="{$WEB_ROOT}/terms.php" class="text-primary" style="text-decoration: underline;">Terms of Service</a>
      and
      <a href="{$WEB_ROOT}/privacy.php" class="text-primary" style="text-decoration: underline;">Privacy Policy</a>
    </label>
  </div>

  {if $captcha}
    <div>{$captcha}</div>
  {/if}

  <button type="submit" class="venom-btn-primary" style="width: 100%; padding: 0.75rem;">
    <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="8.5" cy="7" r="4"/><line x1="20" y1="8" x2="20" y2="14"/><line x1="23" y1="11" x2="17" y2="11"/></svg>
    Create Account
  </button>
</form>

<p style="margin-top: 1.5rem; text-align: center; font-size: 0.875rem; color: hsl(var(--muted-foreground));">
  Already have an account?
  <a href="{$WEB_ROOT}/clientarea.php" class="text-primary" style="font-weight: 500; text-decoration: none;">Sign in</a>
</p>
{/capture}

{include file="$template/includes/authlayout.tpl"}
