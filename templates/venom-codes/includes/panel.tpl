{* VENOM CODES — Panel/Card Component *}

<div class="row w-100 mx-auto mb-3">
    <div class="card w-100" style="border-radius: 1rem; border: 1px solid var(--gray-200, #e5e7eb); box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06); overflow: hidden;">
        {if isset($headerTitle)}
            <div class="card-title py-1 px-2 text-white font-weight-bold bg-{$type}" style="background: {if $type == 'primary'}linear-gradient(135deg, var(--primary-600, #2563eb) 0%, var(--primary-700, #1d4ed8) 100%){elseif $type == 'success'}linear-gradient(135deg, #10b981 0%, #059669 100%){elseif $type == 'warning'}linear-gradient(135deg, #f59e0b 0%, #d97706 100%){elseif $type == 'danger'}linear-gradient(135deg, #dc2626 0%, #991b1b 100%){elseif $type == 'info'}linear-gradient(135deg, #3b82f6 0%, #2563eb 100%){else}var(--gray-600, #4b5563){/if}; padding: 1rem 1.5rem; margin: 0; font-size: 1rem; font-weight: 600; border: none;">
                {$headerTitle}
            </div>
        {/if}
        {if isset($bodyContent)}
            <div class="card-text{if isset($bodyTextCenter)} text-center{/if} mx-2 mb-3" style="padding: 1.5rem; color: var(--gray-700, #374151); line-height: 1.6;">
                {$bodyContent}
            </div>
        {/if}
        {if isset($footerContent)}
            <div class="card-footer{if isset($footerTextCenter)} text-center{/if} mx-2 mb-3" style="background: var(--gray-50, #f9fafb); border-top: 1px solid var(--gray-200, #e5e7eb); padding: 1rem 1.5rem; color: var(--gray-600, #4b5563);">
                {$footerContent}
            </div>
        {/if}
    </div>
</div>
