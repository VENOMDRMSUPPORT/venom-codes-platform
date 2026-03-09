{* VENOM CODES — Email Verification Banner Component *}

{if $showEmailVerificationBanner}
    <div class="verification-banner email-verification" style="background: linear-gradient(135deg, #fef2f2 0%, #fecaca 100%); border-bottom: 1px solid #ef4444; padding: 1rem 0;">
        <div class="container">
            <div class="row" style="align-items: center;">
                <div class="col-2 col-sm-1 order-3" style="display: flex; justify-content: flex-end;">
                    <button id="btnEmailVerificationClose" type="button" class="btn close" data-uri="{routePath('dismiss-email-verification')}" style="background: none; border: none; color: #991b1b; opacity: 1; font-size: 1.5rem; cursor: pointer; padding: 0; font-weight: 300; line-height: 1;">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="col-10 col-sm-7 col-md-8 order-1" style="display: flex; align-items: center; gap: 0.75rem; color: #991b1b;">
                    <i class="fas fa-exclamation-triangle" style="font-size: 1.5rem;"></i>
                    <span class="text" style="font-weight: 500;">{lang key='verifyEmailAddress'}</span>
                </div>
                <div class="col-12 col-sm-4 col-md-3 order-sm-2 order-md-last" style="margin-top: 0.75rem;">
                    <button id="btnResendVerificationEmail" class="btn btn-default btn-sm btn-block btn-resend-verify-email btn-action" data-email-sent="{lang key='emailSent'}" data-error-msg="{lang key='error'}" data-uri="{routePath('user-email-verification-resend')}" style="display: block; width: 100%; padding: 0.5rem 1rem; background: white; border: 1px solid #dc2626; color: #991b1b; font-weight: 600; border-radius: 0.5rem; text-align: center; cursor: pointer; transition: all 0.2s;">
                        <span class="loader w-hidden" style="display: inline-block; margin-right: 0.5rem;">
                            <i class="fa fa-spinner fa-spin"></i>
                        </span>
                        {lang key='resendEmail'}
                    </button>
                </div>
            </div>
        </div>
    </div>

    <style>
    /* VENOM CODES Email Verification Button Hover */
    .email-verification .btn-action:hover {
        background: #991b1b !important;
        color: white !important;
        transform: translateY(-1px);
        box-shadow: 0 4px 6px -1px rgba(220, 38, 38, 0.3);
    }
    </style>
{/if}
