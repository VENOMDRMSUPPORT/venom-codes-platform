{* VENOM CODES — Ticket Feedback *}

<div style="max-width: 32rem; margin: 3rem auto; text-align: center;">

  {if $feedbacksubmitted}

    <div style="margin: 0 auto 1.5rem; display: flex; height: 4rem; width: 4rem; align-items: center; justify-content: center; border-radius: 9999px; background: hsl(160 84% 39% / 0.1);">
      <svg class="h-7 w-7" style="color: hsl(160 84% 39%);" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
    </div>
    <h1 class="font-display" style="font-size: 1.5rem; font-weight: 700;">Thank You!</h1>
    <p class="text-muted-foreground" style="margin-top: 0.5rem;">Your feedback has been submitted. We appreciate your input.</p>

  {else}

    <div style="margin: 0 auto 1.5rem; display: flex; height: 4rem; width: 4rem; align-items: center; justify-content: center; border-radius: 9999px; background: hsl(var(--primary) / 0.1);">
      <svg class="h-7 w-7" style="color: hsl(var(--primary));" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/></svg>
    </div>
    <h1 class="font-display" style="font-size: 1.5rem; font-weight: 700;">Rate Your Experience</h1>
    <p class="text-muted-foreground" style="margin-top: 0.5rem;">How was your support experience for ticket #{$tid}?</p>

    <form method="post" action="{$smarty.server.PHP_SELF}" style="margin-top: 2rem;">
      <input type="hidden" name="tid" value="{$tid}" />
      <input type="hidden" name="c" value="{$c}" />
      <input type="hidden" name="token" value="{$token}" />

      <div style="margin-bottom: 1.5rem;">
        <div style="display: flex; justify-content: center; gap: 0.5rem;">
          {for $i=1 to 5}
            <label style="cursor: pointer;">
              <input type="radio" name="rating" value="{$i}" style="display: none;" />
              <svg class="h-8 w-8 rating-star" data-rate="{$i}" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="color: hsl(var(--muted-foreground)); transition: color 0.15s;"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
            </label>
          {/for}
        </div>
      </div>

      <div style="margin-bottom: 1.5rem; text-align: left;">
        <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Comments (optional)</label>
        <textarea name="comments" class="venom-input" rows="3" placeholder="Tell us more…" style="resize: vertical;"></textarea>
      </div>

      <button type="submit" name="submit" class="venom-btn-primary" style="width: 100%; padding: 0.75rem;">Submit Feedback</button>
    </form>

  {/if}

</div>
