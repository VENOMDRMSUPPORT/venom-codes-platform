{if isset($inHeader) && $inHeader}
    {assign var="venomThemeInHeader" value=true}
{else}
    {assign var="venomThemeInHeader" value=false}
{/if}
<div class="venom-floating-controls{if $venomThemeInHeader} venom-theme-in-header{/if}" role="region" aria-label="Theme Controls">
    <div class="venom-floating-controls__anchor">
        <button class="venom-toggle-btn" type="button" aria-label="Switch to Dark Theme" aria-haspopup="true" aria-expanded="false">
            <span class="venom-toggle-icon venom-toggle-icon--sun" aria-hidden="true">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="12" cy="12" r="3.6"></circle>
                    <path d="M12 3.2V5.6M12 18.4v2.4M3.2 12h2.4M18.4 12h2.4M5.8 5.8l1.8 1.8M16.4 16.4l1.8 1.8M5.8 18.2l1.8-1.8M16.4 7.6l1.8-1.8"></path>
                </svg>
            </span>
            <span class="venom-toggle-icon venom-toggle-icon--moon" aria-hidden="true">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M21 13.2A9.2 9.2 0 1 1 10.8 3c-.3.9-.5 1.8-.5 2.8a7.4 7.4 0 0 0 7.4 7.4c1 0 1.9-.2 2.8-.5Z"></path>
                </svg>
            </span>
        </button>
        <div class="venom-accent-picker" role="group" aria-label="Accent Colors">
            <button type="button" class="venom-accent-dot is-active" data-accent="ocean" aria-label="Ocean Accent" aria-pressed="true"></button>
            <button type="button" class="venom-accent-dot" data-accent="emerald" aria-label="Emerald Accent" aria-pressed="false"></button>
            <button type="button" class="venom-accent-dot" data-accent="crimson" aria-label="Crimson Accent" aria-pressed="false"></button>
            <button type="button" class="venom-accent-dot" data-accent="amber" aria-label="Amber Accent" aria-pressed="false"></button>
            <button type="button" class="venom-accent-dot" data-accent="violet" aria-label="Violet Accent" aria-pressed="false"></button>
        </div>
    </div>
</div>
