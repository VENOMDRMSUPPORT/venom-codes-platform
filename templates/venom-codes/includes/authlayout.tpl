{* VENOM CODES — Auth Layout Partial *}

<div class="venom-auth-shell">
  <div style="width: 100%; max-width: 28rem;">

    {* Header *}
    <div style="margin-bottom: 2rem; text-align: center;">
      <div style="margin: 0 auto 1rem; display: inline-flex; height: 3rem; width: 3rem; align-items: center; justify-content: center; border-radius: 0.75rem; background: hsl(var(--accent-muted));">
        {if isset($auth_icon_svg)}
          {$auth_icon_svg}
        {else}
          <svg class="h-6 w-6 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
        {/if}
      </div>
      <h1 class="font-display" style="font-size: 1.5rem; font-weight: 700; letter-spacing: -0.025em;">{$auth_title}</h1>
      {if isset($auth_subtitle)}
        <p class="text-sm text-muted-foreground" style="margin-top: 0.5rem;">{$auth_subtitle}</p>
      {/if}
    </div>

    {* Animated border card *}
    <div class="auth-card-wrapper" style="position: relative; border-radius: 1rem; padding: 1px;">
      <div class="auth-card-border" style="position: absolute; inset: 0; border-radius: 1rem;"></div>
      <div style="position: relative; border-radius: 1rem; border: 1px solid hsl(var(--border) / 0.5); background: hsl(var(--card)); padding: 1.5rem; box-shadow: 0 10px 25px -5px rgba(0,0,0,0.1);">
        {$auth_content}
      </div>
    </div>

    {* Security badge *}
    <div style="margin-top: 1.5rem; display: flex; align-items: center; justify-content: center; gap: 0.5rem; font-size: 0.75rem; color: hsl(var(--muted-foreground));">
      <svg class="h-3 w-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
      <span>Protected by VENOM CODES security</span>
    </div>

  </div>
</div>
