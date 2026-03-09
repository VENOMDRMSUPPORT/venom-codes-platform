{* VENOM CODES — Public Site Header *}

<header class="sticky top-0 z-50 border-b" style="border-color: hsl(var(--nav-border)); background: hsl(var(--nav-bg)); backdrop-filter: blur(16px); -webkit-backdrop-filter: blur(16px);">
  <div class="venom-container flex h-16 items-center justify-between">
    {* Logo *}
    <a href="{$WEB_ROOT}" class="flex items-center gap-2" style="text-decoration: none; color: inherit;">
      {include file="$template/includes/logo.tpl" size=32}
      <span class="font-display text-lg font-bold" style="letter-spacing: -0.025em;">VENOM CODES</span>
    </a>

    {* Desktop nav *}
    <nav class="hidden items-center gap-8 md:flex">
      <a href="#features" class="text-sm font-medium text-muted-foreground transition-colors hover:text-foreground" style="text-decoration: none;">Features</a>
      <a href="#pricing" class="text-sm font-medium text-muted-foreground transition-colors hover:text-foreground" style="text-decoration: none;">Pricing</a>
      <a href="{$WEB_ROOT}/knowledgebase" class="text-sm font-medium text-muted-foreground transition-colors hover:text-foreground" style="text-decoration: none;">Docs</a>
      <a href="{$WEB_ROOT}/contact.php" class="text-sm font-medium text-muted-foreground transition-colors hover:text-foreground" style="text-decoration: none;">Contact</a>
    </nav>

    {* Desktop actions *}
    <div class="hidden items-center gap-3 md:flex">
      {include file="$template/includes/themeswitcher.tpl"}
      <a href="{$WEB_ROOT}/clientarea.php" class="venom-btn-secondary text-sm" style="padding: 0.5rem 1rem;">Sign In</a>
      <a href="{$WEB_ROOT}/register.php" class="venom-btn-primary text-sm" style="padding: 0.5rem 1rem;">Get Started</a>
    </div>

    {* Mobile toggle *}
    <div class="flex items-center gap-2 md:hidden">
      {include file="$template/includes/themeswitcher.tpl"}
      <button id="mobile-menu-toggle" class="p-2">
        <svg id="mobile-icon-open" class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <line x1="3" y1="12" x2="21" y2="12"/><line x1="3" y1="6" x2="21" y2="6"/><line x1="3" y1="18" x2="21" y2="18"/>
        </svg>
        <svg id="mobile-icon-close" class="h-5 w-5 hidden" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/>
        </svg>
      </button>
    </div>
  </div>

  {* Mobile menu *}
  <div id="mobile-menu" class="hidden border-t bg-card p-4 md:hidden">
    <nav class="flex flex-col gap-3">
      <a href="#features" class="text-sm font-medium text-muted-foreground" style="text-decoration: none;">Features</a>
      <a href="#pricing" class="text-sm font-medium text-muted-foreground" style="text-decoration: none;">Pricing</a>
      <a href="{$WEB_ROOT}/knowledgebase" class="text-sm font-medium text-muted-foreground" style="text-decoration: none;">Docs</a>
      <a href="{$WEB_ROOT}/contact.php" class="text-sm font-medium text-muted-foreground" style="text-decoration: none;">Contact</a>
      <hr style="border-color: hsl(var(--border));" />
      <a href="{$WEB_ROOT}/clientarea.php" class="text-sm font-medium" style="text-decoration: none;">Sign In</a>
      <a href="{$WEB_ROOT}/register.php" class="venom-btn-primary text-sm text-center" style="padding: 0.5rem 1rem;">Get Started</a>
    </nav>
  </div>
</header>
