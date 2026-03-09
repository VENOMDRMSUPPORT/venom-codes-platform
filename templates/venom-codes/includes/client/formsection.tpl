{* VENOM CODES — Form Section Partial *}

<div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
  <div style="border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
    <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600;">{$form_title}</h3>
    {if isset($form_description)}
      <p class="text-muted-foreground" style="margin-top: 0.125rem; font-size: 0.75rem;">{$form_description}</p>
    {/if}
  </div>
  <div style="padding: 1.25rem; display: flex; flex-direction: column; gap: 1rem;">
    {$form_content}
  </div>
  {if isset($form_actions)}
    <div style="display: flex; justify-content: flex-end; gap: 0.5rem; border-top: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
      {$form_actions}
    </div>
  {/if}
</div>