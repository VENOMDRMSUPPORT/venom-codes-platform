{* VENOM CODES — Modal Dialog Component *}

<div class="modal fade" id="modal{$name}">
    <div class="modal-dialog" style="max-width: 600px;">
        <div class="modal-content" style="border-radius: 1rem; border: none; box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);">
            <div class="modal-header" style="padding: 1.5rem; border-bottom: 1px solid var(--gray-200, #e5e7eb); border-radius: 1rem 1rem 0 0;">
                <h4 class="modal-title" id="modal{$name}Title" style="font-weight: 600; font-size: 1.25rem; color: var(--gray-900, #111827); margin: 0;">
                    {$title}
                </h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: var(--gray-500, #6b7280); opacity: 1; font-size: 1.5rem; font-weight: 300; line-height: 1; padding: 0; margin: 0; background: none; border: none; cursor: pointer;">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-center w-hidden" id="modal{$name}Loader" style="padding: 3rem 1.5rem;">
                <p style="color: var(--gray-600, #4b5563); margin: 0;">
                    <i class="fas fa-spinner fa-spin" style="font-size: 2rem; color: var(--primary-600, #2563eb);"></i>
                </p>
                <p style="margin-top: 1rem; color: var(--gray-600, #4b5563);">{lang key='loading'}</p>
            </div>
            <div class="modal-body" id="modal{$name}Body" style="padding: 1.5rem; color: var(--gray-700, #374151);">
                {if isset($content)}
                    <p style="margin: 0; line-height: 1.6;">{$content}</p>
                {/if}
            </div>
            <div class="modal-footer" style="padding: 1rem 1.5rem; background: var(--gray-50, #f9fafb); border-top: 1px solid var(--gray-200, #e5e7eb); border-radius: 0 0 1rem 1rem; display: flex; justify-content: flex-end; gap: 0.5rem;">
                <button type="button" class="btn btn-default" data-dismiss="modal" style="border-radius: 0.5rem; padding: 0.5rem 1.5rem; border: 1px solid var(--gray-300, #d1d5db); background: white; color: var(--gray-700, #374151); font-weight: 500; transition: all 0.2s;">
                    {if isset($closeLabel)}
                        {$closeLabel}
                    {else}
                        {lang key='closewindow'}
                    {/if}
                </button>
                {if isset($submitAction)}
                    <button type="button" class="btn btn-primary" onclick="{$submitAction}" style="border-radius: 0.5rem; padding: 0.5rem 1.5rem; background: linear-gradient(135deg, var(--primary-600, #2563eb) 0%, var(--primary-700, #1d4ed8) 100%); border: none; color: white; font-weight: 500; transition: all 0.2s;">
                        {if isset($submitLabel)}
                            {$submitLabel}
                        {else}
                            {lang key='clientareasavechanges'}
                        {/if}
                    </button>
                {/if}
            </div>
        </div>
    </div>
</div>
