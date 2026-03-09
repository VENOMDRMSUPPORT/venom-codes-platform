{* VENOM CODES — CAPTCHA Component *}

{if $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm)}
    <div class="text-center{if $containerClass}{$containerClass}{else} row justify-content-center{/if}" style="margin-top: 1rem;">
        {if $templatefile == 'homepage'}
            <div class="domainchecker-homepage-captcha">
        {/if}

        {if $captcha->recaptcha->isEnabled() && !$captcha->recaptcha->isInvisible()}
            <div id="google-recaptcha-domainchecker" class="form-group recaptcha-container mx-auto" data-action="{$captchaForm}" style="display: flex; justify-content: center; margin: 1.5rem auto;"></div>
        {elseif !$captcha->recaptcha->isEnabled()}
            <div class="col-md-8 mx-auto mb-3 mb-sm-0">
                <div id="default-captcha-domainchecker" class="{if $filename == 'domainchecker'}input-group input-group-box {/if}text-center row pb-3" style="background: var(--gray-50, #f9fafb); border-radius: 0.75rem; padding: 1.5rem; border: 1px solid var(--gray-200, #e5e7eb);">
                    <p style="margin-bottom: 1rem; color: var(--gray-700, #374151); font-weight: 500;">{lang key="captchaverify"}</p>

                    <div class="col-6 captchaimage" style="display: flex; align-items: center; justify-content: center;">
                        <img id="inputCaptchaImage" 
                             data-src="{$systemurl}includes/verifyimage.php" 
                             src="{$systemurl}includes/verifyimage.php" 
                             align="middle" 
                             style="border-radius: 0.5rem; border: 2px solid var(--gray-300, #d1d5db); box-shadow: 0 1px 3px rgba(0,0,0,0.1);" />
                    </div>

                    <div class="col-6">
                        <input id="inputCaptcha" 
                               type="text" 
                               name="code" 
                               maxlength="6" 
                               class="form-control {if $filename == 'register'}float-left{/if}"
                               style="height: 3rem; border-radius: 0.5rem; border: 1px solid var(--gray-300, #d1d5db); font-size: 1.125rem; text-align: center; letter-spacing: 0.5em;"
                               data-toggle="tooltip" 
                               data-placement="right" 
                               data-trigger="manual" 
                               title="{lang key='orderForm.required'}"/>
                    </div>
                </div>
            </div>
        {/if}

        {if $templatefile == 'homepage'}
            </div>
        {/if}
    </div>
{/if}
