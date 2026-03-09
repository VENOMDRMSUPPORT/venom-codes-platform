{* VENOM CODES — Theme Switcher Partial *}

<div class="flex items-center gap-2">
  {* Mode toggle *}
  <button onclick="VenomTheme.toggleMode()"
          class="rounded-lg p-2 transition-colors hover:bg-secondary"
          aria-label="Toggle theme">
    {* Sun icon (shown in dark mode) *}
    <svg id="theme-icon-sun" class="h-4 w-4" style="display:none;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      <circle cx="12" cy="12" r="5"/><line x1="12" y1="1" x2="12" y2="3"/><line x1="12" y1="21" x2="12" y2="23"/><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/><line x1="1" y1="12" x2="3" y2="12"/><line x1="21" y1="12" x2="23" y2="12"/><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"/><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"/>
    </svg>
    {* Moon icon (shown in light mode) *}
    <svg id="theme-icon-moon" class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/>
    </svg>
  </button>

  {* Accent color picker *}
  <div class="relative">
    <button id="accent-trigger" onclick="VenomTheme.toggleAccentDropdown()"
            class="rounded-lg p-2 transition-colors hover:bg-secondary"
            aria-label="Change accent color">
      <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <circle cx="13.5" cy="6.5" r="2.5"/><circle cx="17.5" cy="10.5" r="2.5"/><circle cx="8.5" cy="7.5" r="2.5"/><circle cx="6.5" cy="12" r="2.5"/><path d="M12 22C6.5 22 2 17.5 2 12S6.5 2 12 2s10 4.5 10 10-1.5 4-3 4h-1.3c-.8 0-1.5.7-1.5 1.5 0 .4.2.8.4 1.1.3.3.4.6.4 1 0 .8-.7 1.4-1.5 1.4H12z"/>
      </svg>
    </button>
    <div id="accent-dropdown" class="hidden absolute right-0 top-full mt-2 z-50 rounded-xl border border-border bg-card p-3 shadow-lg">
      <p class="mb-2 text-xs font-medium text-muted-foreground">Accent</p>
      <div class="flex gap-2">
        <button data-accent-btn="blue" onclick="VenomTheme.setAccent('blue')"
                class="h-6 w-6 rounded-full transition-transform hover:scale-110"
                style="background: hsl(217 91% 60%);" aria-label="Blue"></button>
        <button data-accent-btn="purple" onclick="VenomTheme.setAccent('purple')"
                class="h-6 w-6 rounded-full transition-transform hover:scale-110"
                style="background: hsl(263 70% 58%);" aria-label="Purple"></button>
        <button data-accent-btn="emerald" onclick="VenomTheme.setAccent('emerald')"
                class="h-6 w-6 rounded-full transition-transform hover:scale-110"
                style="background: hsl(160 84% 39%);" aria-label="Emerald"></button>
        <button data-accent-btn="orange" onclick="VenomTheme.setAccent('orange')"
                class="h-6 w-6 rounded-full transition-transform hover:scale-110"
                style="background: hsl(25 95% 53%);" aria-label="Orange"></button>
        <button data-accent-btn="rose" onclick="VenomTheme.setAccent('rose')"
                class="h-6 w-6 rounded-full transition-transform hover:scale-110"
                style="background: hsl(347 77% 50%);" aria-label="Rose"></button>
      </div>
    </div>
  </div>
</div>
