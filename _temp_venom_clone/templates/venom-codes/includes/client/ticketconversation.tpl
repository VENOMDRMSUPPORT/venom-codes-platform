{* VENOM CODES — Ticket Conversation Thread Partial *}

<div style="display: flex; flex-direction: column; gap: 1rem;">
  {foreach $replies as $reply}
    <div style="border-radius: 0.75rem; border: 1px solid {if $reply.admin}hsl(var(--primary) / 0.2){else}hsl(var(--border)){/if}; padding: 1rem; background: {if $reply.admin}hsl(var(--primary) / 0.05){else}hsl(var(--card)){/if};">
      {* Header *}
      <div style="margin-bottom: 0.5rem; display: flex; align-items: center; justify-content: space-between;">
        <div style="display: flex; align-items: center; gap: 0.5rem;">
          <div class="{if $reply.admin}venom-gradient-bg{/if}" style="display: flex; height: 1.75rem; width: 1.75rem; align-items: center; justify-content: center; border-radius: 9999px; font-size: 0.75rem; font-weight: 700; color: hsl(var(--primary-foreground)); {if !$reply.admin}background: hsl(var(--muted-foreground) / 0.8);{/if}">
            {$reply.requestor.name|substr:0:1|upper}
          </div>
          <div>
            <span style="font-size: 0.875rem; font-weight: 600;">{$reply.requestor.name}</span>
            {if $reply.admin}
              <span style="margin-left: 0.375rem; border-radius: 0.25rem; background: hsl(var(--primary) / 0.1); padding: 0.125rem 0.375rem; font-size: 0.625rem; font-weight: 600; color: hsl(var(--primary));">Staff</span>
            {/if}
          </div>
        </div>
        <time class="text-muted-foreground" style="font-size: 0.75rem;">{$reply.date}</time>
      </div>
      {* Content *}
      <div style="font-size: 0.875rem; line-height: 1.625; white-space: pre-wrap; padding-left: 2.25rem; color: hsl(var(--foreground) / 0.9);">
        {$reply.message}
      </div>
      {* Attachments *}
      {if $reply.attachments}
        <div style="margin-top: 0.75rem; padding-left: 2.25rem;">
          <p style="font-size: 0.75rem; font-weight: 600; color: hsl(var(--muted-foreground)); margin-bottom: 0.375rem;">
            <svg class="h-3 w-3" style="display: inline; vertical-align: middle;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21.44 11.05l-9.19 9.19a6 6 0 0 1-8.49-8.49l9.19-9.19a4 4 0 0 1 5.66 5.66l-9.2 9.19a2 2 0 0 1-2.83-2.83l8.49-8.48"/></svg>
            Attachments ({$reply.attachments|count})
          </p>
          {foreach $reply.attachments as $num => $attachment}
            <a href="dl.php?type={if $reply.id}ar&id={$reply.id}{else}a&id={$id}{/if}&i={$num}" style="display: inline-block; font-size: 0.75rem; color: hsl(var(--primary)); text-decoration: none; margin-right: 0.75rem;">
              {$attachment}
            </a>
          {/foreach}
        </div>
      {/if}
    </div>
  {/foreach}
</div>
