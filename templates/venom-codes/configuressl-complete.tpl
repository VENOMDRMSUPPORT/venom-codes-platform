{* VENOM CODES — SSL Configuration Complete *}

{if $errormessage}

    <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 2rem;">
        {include file="$template/includes/client/alert.tpl" alert_type="error" alert_content=$errormessage}
    </div>

{else}

    <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 2rem;">
        
        {* Success Message *}
        <div style="text-align: center; margin-bottom: 2rem;">
            <div style="display: inline-flex; align-items: center; justify-content: center; width: 4rem; height: 4rem; border-radius: 9999px; background: hsl(var(--success)/0.1); margin-bottom: 1rem;">
                <svg class="h-8 w-8" style="color: hsl(var(--success));" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
                    <polyline points="22 4 12 14.01 9 11.01"/>
                </svg>
            </div>
            {include file="$template/includes/client/alert.tpl" alert_type="success" alert_content="{lang key='sslconfigcomplete'}"}
        </div>

        {* Next Steps Section *}
        <div style="margin-bottom: 2rem;">
            <h4 class="font-display" style="text-align: center; font-size: 1.125rem; font-weight: 600; margin-bottom: 1.5rem;">
                {lang key='ssl.nextSteps'}
            </h4>

            {* Email Validation Method *}
            {if is_null($authData) || (!is_null($authData) && $authData->methodNameConstant() == 'emailauth')}
                {include file="$template/includes/client/alert.tpl" alert_type="info" alert_content="{lang key='ssl.emailSteps'}"}
                
                {if !is_null($authData)}
                    <div style="margin-top: 1.5rem; border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--muted)); padding: 1.25rem;">
                        <p style="text-align: center; font-size: 0.875rem; margin-bottom: 1rem; font-weight: 500;">
                            {lang key='ssl.emailInformation'}
                        </p>
                        <div style="display: grid; grid-template-columns: 1fr; gap: 0.5rem;">
                            <style>@media (min-width: 640px) { .email-info-row { grid-template-columns: 150px 1fr !important; } }</style>
                            <div class="email-info-row" style="display: grid; grid-template-columns: 1fr; gap: 0.5rem; align-items: center;">
                                <label for="emailApprover" style="font-size: 0.875rem; font-weight: 600;">
                                    {lang key='email'}
                                </label>
                                <div>
                                    <input type="text" class="venom-input" id="emailApprover" value="{$authData->email}" readonly style="background: hsl(var(--background));" />
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}

            {* DNS Validation Method *}
            {elseif !is_null($authData) && $authData->methodNameConstant() == 'dnsauth'}
                {include file="$template/includes/client/alert.tpl" alert_type="info" alert_content="{lang key='ssl.dnsSteps'}"}
                
                <div style="margin-top: 1.5rem; border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--muted)); padding: 1.25rem;">
                    <p style="text-align: center; font-size: 0.875rem; margin-bottom: 1rem; font-weight: 500;">
                        {lang key='ssl.dnsRecordInformation'}
                    </p>
                    <div style="display: flex; flex-direction: column; gap: 1rem;">
                        <div>
                            <label for="recordType" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 600;">
                                {lang key='ssl.type'}
                            </label>
                            <input type="text" class="venom-input" id="recordType" value="{$authData->type}" readonly style="background: hsl(var(--background)); font-family: monospace;" />
                        </div>

                        <div>
                            <label for="host" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 600;">
                                {lang key='ssl.host'}
                            </label>
                            <div style="display: flex; gap: 0.5rem;">
                                <input type="text" class="venom-input" id="host" value="{$authData->host}" readonly style="flex: 1; background: hsl(var(--background)); font-family: monospace; font-size: 0.8125rem;" />
                                <button type="button" class="venom-btn-secondary copy-to-clipboard" data-clipboard-target="#host" style="padding: 0.5rem 0.75rem;">
                                    <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect>
                                        <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path>
                                    </svg>
                                </button>
                            </div>
                        </div>

                        <div>
                            <label for="dnsContents" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 600;">
                                {lang key='ssl.value'}
                            </label>
                            <div style="display: flex; gap: 0.5rem;">
                                <input type="text" class="venom-input" id="dnsContents" value="{$authData->value}" readonly style="flex: 1; background: hsl(var(--background)); font-family: monospace; font-size: 0.8125rem;" />
                                <button type="button" class="venom-btn-secondary copy-to-clipboard" data-clipboard-target="#dnsContents" style="padding: 0.5rem 0.75rem;">
                                    <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect>
                                        <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            {* File Validation Method *}
            {elseif !empty($authData) && $authData->methodNameConstant() == 'fileauth'}
                {include file="$template/includes/client/alert.tpl" alert_type="info" alert_content="{lang key='ssl.fileSteps'}"}
                
                <div style="margin-top: 1.5rem; border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--muted)); padding: 1.25rem;">
                    <p style="text-align: center; font-size: 0.875rem; margin-bottom: 1rem; font-weight: 500;">
                        {lang key='ssl.fileInformation'}
                    </p>
                    <div style="display: flex; flex-direction: column; gap: 1rem;">
                        <div>
                            <label for="fileName" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 600;">
                                {lang key='ssl.url'}
                            </label>
                            <input type="text" class="venom-input" id="fileName"
                                   value="http://{$domain}/{$authData->filePath()}" readonly style="background: hsl(var(--background)); font-family: monospace; font-size: 0.8125rem;" />
                        </div>

                        <div>
                            <label for="fileContents" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 600;">
                                {lang key='ssl.value'}
                            </label>
                            <div style="display: flex; gap: 0.5rem;">
                                <input type="text" class="venom-input" id="fileContents" value="{$authData->contents}" readonly style="flex: 1; background: hsl(var(--background)); font-family: monospace; font-size: 0.8125rem;" />
                                <button type="button" class="venom-btn-secondary copy-to-clipboard" data-clipboard-target="#fileContents" style="padding: 0.5rem 0.75rem;">
                                    <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect>
                                        <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
        </div>

        {* Return Button *}
        <form method="post" action="clientarea.php?action=productdetails">
            <input type="hidden" name="id" value="{$serviceid}" />
            <div style="text-align: center; padding-top: 1.5rem; border-top: 1px solid hsl(var(--border));">
                <button type="submit" class="venom-btn-primary" style="min-width: 200px;">
                    <span style="display: flex; align-items: center; gap: 0.5rem; justify-content: center;">
                        <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <line x1="19" y1="12" x2="5" y2="12"></line>
                            <polyline points="12 19 5 12 12 5"></polyline>
                        </svg>
                        <span>{lang key='invoicesbacktoclientarea'}</span>
                    </span>
                </button>
            </div>
        </form>
    </div>
{/if}

{* Copy to Clipboard Script *}
<script>
document.addEventListener('DOMContentLoaded', function() {
    const copyButtons = document.querySelectorAll('.copy-to-clipboard');
    copyButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            const targetSelector = this.getAttribute('data-clipboard-target');
            const targetInput = document.querySelector(targetSelector);
            if (targetInput) {
                targetInput.select();
                document.execCommand('copy');
                
                // Visual feedback
                const originalHTML = this.innerHTML;
                this.innerHTML = '<svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>';
                setTimeout(function() {
                    button.innerHTML = originalHTML;
                }, 2000);
            }
        });
    });
});
</script>
