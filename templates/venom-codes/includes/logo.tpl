{* VENOM CODES — Logo Partial *}

{if !isset($size)}{assign var="size" value=40}{/if}
{if !isset($animate)}{assign var="animate" value=true}{/if}

<div class="relative inline-flex items-center justify-center" style="width: {$size}px; height: {$size}px;">
  {if $animate}
    <div class="absolute inset-0 venom-gradient-bg rounded-sm blur-md animate-logo-pulse"></div>
  {/if}
  <svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"
       style="width: {$size}px; height: {$size}px;" class="relative z-10">
    <defs>
      <linearGradient id="venom-logo-grad" x1="0%" y1="0%" x2="100%" y2="100%">
        <stop offset="0%" stop-color="hsl(var(--accent-gradient-from))" />
        <stop offset="100%" stop-color="hsl(var(--accent-gradient-to))" />
      </linearGradient>
    </defs>
    <path d="M24 2L46 24L24 46L2 24Z"
          stroke="url(#venom-logo-grad)" stroke-width="2.5" stroke-linejoin="round" fill="none"
          {if $animate}class="animate-draw-path"{/if} />
    <path d="M15 14L24 34L33 14"
          stroke="url(#venom-logo-grad)" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" fill="none"
          {if $animate}class="animate-draw-path-delayed"{/if} />
  </svg>
</div>
