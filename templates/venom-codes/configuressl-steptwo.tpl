{* VENOM CODES — SSL Configuration Step 2 (Validation Method Selection) *}

{if empty($approvalMethods)}
    {assign var="approvalMethods" value=[]}
{/if}

<div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
    <div style="padding: 1.25rem;">
        {if $errormessage}
            <div style="margin-bottom: 1.5rem;">
                {include file="$template/includes/client/alert.tpl" alert_type="error" alert_content=$errormessage}
            </div>
        {/if}

        <form method="post" action="{$smarty.server.PHP_SELF}?cert={$cert}&step=3">

            {* Validation Method Selection *}
            <div style="margin-bottom: 1.5rem;">
                <h2 class="font-display" style="font-size: 1.125rem; font-weight: 600; margin-bottom: 1rem;">
                    {lang key='ssl.selectValidation'}
                </h2>

                <div style="display: flex; flex-direction: column; gap: 0.75rem;">
                    {if empty($approvalMethods) || (!empty($approvalMethods) && in_array('email', $approvalMethods))}
                        <label style="position: relative; display: flex; align-items: center; gap: 0.75rem; padding: 1rem; border: 1px solid hsl(var(--border)); border-radius: 0.5rem; cursor: pointer; transition: all 0.2s;">
                            <input type="radio" class="icheck-button" name="approval_method" value="email" checked>
                            <div style="display: flex; align-items: center; gap: 0.5rem;">
                                <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                                    <polyline points="22,6 12,13 2,6"></polyline>
                                </svg>
                                <strong class="name" style="font-weight: 600;">{lang key='ssl.emailMethod'}</strong>
                            </div>
                        </label>
                    {/if}

                    {if in_array('dns-txt-token', $approvalMethods)}
                        <label style="position: relative; display: flex; align-items: center; gap: 0.75rem; padding: 1rem; border: 1px solid hsl(var(--border)); border-radius: 0.5rem; cursor: pointer; transition: all 0.2s;">
                            <input type="radio" class="icheck-button" name="approval_method" value="dns-txt-token">
                            <div style="display: flex; align-items: center; gap: 0.5rem;">
                                <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <line x1="2" y1="12" x2="22" y2="12"></line>
                                    <path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path>
                                </svg>
                                <strong class="name" style="font-weight: 600;">{lang key='ssl.dnsMethod'}</strong>
                            </div>
                        </label>
                    {/if}

                    {if in_array('file', $approvalMethods)}
                        <label style="position: relative; display: flex; align-items: center; gap: 0.75rem; padding: 1rem; border: 1px solid hsl(var(--border)); border-radius: 0.5rem; cursor: pointer; transition: all 0.2s;">
                            <input type="radio" class="icheck-button" name="approval_method" value="file">
                            <div style="display: flex; align-items: center; gap: 0.5rem;">
                                <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path>
                                    <polyline points="13 2 13 9 20 9"></polyline>
                                </svg>
                                <strong class="name" style="font-weight: 600;">{lang key='ssl.fileMethod'}</strong>
                            </div>
                        </label>
                    {/if}
                </div>
            </div>

            {* Method Details Containers *}
            <div style="margin-top: 1.5rem;">
                {* Email Validation *}
                <div id="containerApprovalMethodEmail">
                    {include file="$template/includes/client/alert.tpl" alert_type="info" alert_content={lang key='ssl.emailMethodDescription'}}
                    
                    <div style="margin-top: 1rem;">
                        <p style="font-weight: 500; margin-bottom: 0.75rem; font-size: 0.875rem;">
                            {lang key='ssl.selectEmail'}
                        </p>
                        <div style="border: 1px solid hsl(var(--border)); border-radius: 0.5rem; overflow: hidden;">
                            {foreach $approveremails as $num => $approveremail}
                                <div style="padding: 0.75rem; border-bottom: 1px solid hsl(var(--border)); {if $num == count($approveremails) - 1}border-bottom: none;{/if}">
                                    <label style="display: flex; align-items: center; gap: 0.75rem; cursor: pointer; margin: 0;">
                                        <input type="radio" name="approveremail" value="{$approveremail}"{if $num eq 0} checked{/if}>
                                        <span style="font-size: 0.875rem;">{$approveremail}</span>
                                    </label>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                </div>

                {* DNS Validation *}
                <div id="containerApprovalMethodDns" class="w-hidden">
                    {include file="$template/includes/client/alert.tpl" alert_type="info" alert_content={lang key='ssl.dnsMethodDescription'}}
                </div>

                {* File Validation *}
                <div id="containerApprovalMethodFile" class="w-hidden">
                    {include file="$template/includes/client/alert.tpl" alert_type="info" alert_content={lang key='ssl.fileMethodDescription'}}
                </div>
            </div>

            {* Continue Button *}
            <div style="display: flex; justify-content: center; gap: 0.75rem; margin-top: 1.5rem; padding-top: 1.5rem; border-top: 1px solid hsl(var(--border));">
                <button type="submit" class="venom-btn-primary" id="btnOrderContinue" style="min-width: 150px;">
                    <span style="display: flex; align-items: center; gap: 0.5rem; justify-content: center;">
                        <span>{lang key='ordercontinuebutton'}</span>
                        <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <line x1="5" y1="12" x2="19" y2="12"></line>
                            <polyline points="12 5 19 12 12 19"></polyline>
                        </svg>
                    </span>
                </button>
            </div>

        </form>
    </div>
</div>

{* JavaScript for method switching *}
<script>
document.addEventListener('DOMContentLoaded', function() {
    const methodRadios = document.querySelectorAll('input[name="approval_method"]');
    const containers = {
        'email': document.getElementById('containerApprovalMethodEmail'),
        'dns-txt-token': document.getElementById('containerApprovalMethodDns'),
        'file': document.getElementById('containerApprovalMethodFile')
    };

    methodRadios.forEach(function(radio) {
        radio.addEventListener('change', function() {
            // Hide all containers
            Object.values(containers).forEach(function(container) {
                if (container) {
                    container.classList.add('w-hidden');
                }
            });

            // Show selected container
            const selectedContainer = containers[this.value];
            if (selectedContainer) {
                selectedContainer.classList.remove('w-hidden');
            }
        });
    });
});
</script>
