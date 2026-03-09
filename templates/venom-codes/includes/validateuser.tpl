{* VENOM CODES — User Validation Banner Component *}

{if $showUserValidationBanner}
<div class="verification-banner user-validation" style="background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%); border-bottom: 1px solid #f59e0b; padding: 1rem 0;">
    <div class="container">
        <div class="row" style="align-items: center;">
            <div class="col-2 col-sm-1 order-3" style="display: flex; justify-content: flex-end;">
                <button id="btnUserValidationClose" type="button" class="btn close" data-uri="{routePath('dismiss-user-validation')}" style="background: none; border: none; color: #92400e; opacity: 1; font-size: 1.5rem; cursor: pointer; padding: 0; font-weight: 300; line-height: 1;">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="col-10 col-sm-7 col-md-8 order-1" style="display: flex; align-items: center; gap: 0.75rem; color: #92400e;">
                <i class="fal fa-passport" style="font-size: 1.5rem;"></i>
                <span class="text" style="font-weight: 500;">{lang key='fraud.furtherValShort'}</span>
            </div>
            <div class="col-12 col-sm-4 col-md-3 order-sm-2 order-md-last" style="margin-top: 0.75rem;">
                <a href="#" class="btn btn-default btn-sm btn-block btn-action" data-url="{$userValidationUrl}" onclick="openValidationSubmitModal(this);return false;" style="display: block; width: 100%; padding: 0.5rem 1rem; background: white; border: 1px solid #d97706; color: #92400e; font-weight: 600; border-radius: 0.5rem; text-align: center; text-decoration: none; transition: all 0.2s;">
                    {lang key='fraud.submitDocs'}
                </a>
            </div>
        </div>
    </div>
</div>
<div id="validationSubmitModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg" style="max-width: 900px;">
        <div class="modal-content" style="border-radius: 1rem; border: none; box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);">
            <div class="modal-body top-margin-10" style="padding: 0;">
                <iframe id="validationContent" allow="camera {$userValidationHost}" width="100%" height="700" frameborder="0" src="" style="border-radius: 1rem 1rem 0 0;"></iframe>
            </div>
            <div class="modal-footer" style="padding: 1rem 1.5rem; background: var(--gray-50, #f9fafb); border-top: 1px solid var(--gray-200, #e5e7eb); border-radius: 0 0 1rem 1rem;">
                <button type="button" class="btn btn-default" data-dismiss="modal" style="border-radius: 0.5rem; padding: 0.5rem 1.5rem; border: 1px solid var(--gray-300, #d1d5db); background: white; color: var(--gray-700, #374151); font-weight: 500;">{lang key='close'}</button>
            </div>
        </div>
    </div>
</div>

<style>
/* VENOM CODES Validation Banner Button Hover */
.user-validation .btn-action:hover {
    background: #92400e !important;
    color: white !important;
    transform: translateY(-1px);
    box-shadow: 0 4px 6px -1px rgba(217, 119, 6, 0.3);
}
</style>
{/if}
