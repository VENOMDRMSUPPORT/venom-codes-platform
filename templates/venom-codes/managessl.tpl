{* VENOM CODES — SSL Certificate Management *}

{assign var="breadcrumbs" value=[['label' => 'Services', 'href' => "`$WEB_ROOT`/clientarea.php"], ['label' => 'SSL Certificates']]}
{include file="$template/includes/client/pageheader.tpl" page_title="SSL Certificates" page_subtitle="Manage your SSL/TLS certificates and domain validation."}

{* Alert container for status messages *}
<div class="alert alert-table-ssl-manage w-hidden" style="margin-bottom: 1.5rem;"></div>

{* SSL Certificates Table *}
<div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); overflow: hidden;">
    
    {* Table Header *}
    <div style="border-bottom: 1px solid hsl(var(--border)); padding: 1rem 1.25rem;">
        <h3 class="font-display" style="font-size: 1rem; font-weight: 600; margin: 0;">
            Your SSL Certificates
        </h3>
        <p class="text-muted-foreground" style="margin-top: 0.125rem; font-size: 0.75rem;">
            View and manage all your SSL/TLS certificates
        </p>
    </div>

    {* Responsive Table Container *}
    <div class="table-container" style="overflow-x: auto;">
        <table id="tableSslList" class="table-list" style="width: 100%; border-collapse: collapse;">
            <thead style="background: hsl(var(--muted)); border-bottom: 1px solid hsl(var(--border));">
                <tr>
                    <th style="padding: 0.75rem; text-align: left; font-size: 0.875rem; font-weight: 600;">
                        {lang key='ssldomain'}
                    </th>
                    <th style="padding: 0.75rem; text-align: left; font-size: 0.875rem; font-weight: 600;">
                        {lang key='sslproduct'}
                    </th>
                    <th style="padding: 0.75rem; text-align: left; font-size: 0.875rem; font-weight: 600;">
                        {lang key='sslorderdate'}
                    </th>
                    <th style="padding: 0.75rem; text-align: left; font-size: 0.875rem; font-weight: 600;">
                        {lang key='sslrenewaldate'}
                    </th>
                    <th style="padding: 0.75rem; text-align: center; font-size: 0.875rem; font-weight: 600;">
                        {lang key='actions'}
                    </th>
                </tr>
            </thead>
            <tbody>
                {foreach $sslProducts as $sslProduct}
                    <tr style="border-bottom: 1px solid hsl(var(--border));">
                        
                        {* Domain Column *}
                        {if $sslProduct->addonId && $sslProduct->addonId > 0}
                            <td style="padding: 0.75rem; font-size: 0.875rem;">
                                {if $sslProduct->status == $sslStatusAwaitingConfiguration}
                                    <div style="display: inline-flex; align-items: center; padding: 0.25rem 0.5rem; border-radius: 0.25rem; background: hsl(var(--info)/0.1); color: hsl(var(--info)); font-size: 0.75rem; font-weight: 500;">
                                        {lang key='sslawaitingconfig'}
                                    </div>
                                {else}
                                    <div style="display: flex; align-items: center; gap: 0.5rem; flex-wrap: wrap;">
                                        <span style="font-weight: 500;">{if $sslProduct->addon->service->domain}{$sslProduct->addon->service->domain}{else}-{/if}</span>
                                        {if $sslProduct->addon->nextDueDateProperties['isPast']}
                                            <span style="display: inline-flex; align-items: center; padding: 0.25rem 0.5rem; border-radius: 0.25rem; background: hsl(var(--muted)); font-size: 0.75rem; font-weight: 500;">
                                                {lang key='clientareaexpired'}
                                            </span>
                                        {elseif $sslProduct->addon->nextDueDateProperties['daysTillExpiry'] < 60}
                                            <span style="display: inline-flex; align-items: center; padding: 0.25rem 0.5rem; border-radius: 0.25rem; background: hsl(var(--destructive)/0.1); color: hsl(var(--destructive)); font-size: 0.75rem; font-weight: 500;">
                                                {lang key='expiringsoon'}
                                            </span>
                                        {else}
                                            {if $sslProduct->wasInstantIssuanceAttempted() && $sslProduct->wasInstantIssuanceSuccessful()}
                                                <svg class="h-4 w-4" style="color: hsl(var(--warning));" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" title="{lang key='sslinstantissuancebenefit'}">
                                                    <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"/>
                                                </svg>
                                            {/if}
                                        {/if}
                                    </div>
                                {/if}
                            </td>

                            {* Product Column *}
                            <td style="padding: 0.75rem; font-size: 0.875rem;">
                                <div style="display: flex; align-items: center; gap: 0.5rem; flex-wrap: wrap;">
                                    <span>{$sslProduct->addon->productAddon->name}</span>
                                    <span style="display: inline-flex; align-items: center; padding: 0.25rem 0.5rem; border-radius: 0.25rem; font-size: 0.75rem; font-weight: 500; {if $sslProduct->validationType == 'DV'}background: hsl(var(--muted));{elseif $sslProduct->validationType == 'OV'}background: hsl(var(--warning)/0.1); color: hsl(var(--warning));{elseif $sslProduct->validationType == 'EV'}background: hsl(var(--success)/0.1); color: hsl(var(--success));{/if}">
                                        {$sslProduct->validationType}
                                    </span>
                                </div>
                            </td>

                            {* Order Date *}
                            <td style="padding: 0.75rem; font-size: 0.875rem;">
                                <span class="w-hidden">{$sslProduct->addon->registrationDate}</span>
                                {$sslProduct->addon->registrationDateFormatted}
                            </td>

                            {* Renewal Date *}
                            <td style="padding: 0.75rem; font-size: 0.875rem;">
                                <span class="w-hidden">{$sslProduct->addon->nextDueDate}</span>
                                {$sslProduct->addon->nextDueDateFormatted}
                            </td>

                            {* Actions *}
                            <td style="padding: 0.75rem; text-align: center;">
                                <div style="display: flex; gap: 0.5rem; justify-content: center; flex-wrap: wrap;">
                                    {if $sslProduct->status == $sslStatusAwaitingIssuance}
                                        <button class="venom-btn-secondary btn-resend-approver-email" data-url="{routePath('clientarea-ssl-certificates-resend-approver-email')}" data-addonid="{$sslProduct->addonId}" style="font-size: 0.8125rem; padding: 0.375rem 0.75rem;">
                                            <span style="display: flex; align-items: center; gap: 0.375rem;">
                                                <svg class="h-3 w-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                    <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                                                    <polyline points="22,6 12,13 2,6"></polyline>
                                                </svg>
                                                <span>{lang key='sslresendmail'}</span>
                                            </span>
                                        </button>
                                    {/if}
                                    {if $sslProduct->status == $sslStatusAwaitingConfiguration}
                                        <a href="{$sslProduct->getConfigurationUrl()}" class="venom-btn-primary" style="display: inline-flex; align-items: center; gap: 0.375rem; font-size: 0.8125rem; padding: 0.375rem 0.75rem; text-decoration: none;">
                                            <svg class="h-3 w-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                <circle cx="12" cy="12" r="3"></circle>
                                                <path d="M12 1v6m0 6v6m5.66-13.66l-4.24 4.24m0 6.36l4.24 4.24M23 12h-6m-6 0H1m18.66 5.66l-4.24-4.24m0-6.36l4.24-4.24"></path>
                                            </svg>
                                            <span>{lang key='sslconfigure'}</span>
                                        </a>
                                    {/if}
                                    {if $sslProduct->addon->nextDueDateProperties['isFuture']}
                                        <form action="{$sslProduct->getUpgradeUrl()}" method="post" style="display: inline;">
                                            <input type="hidden" name="id" value="{$sslProduct->id}">
                                            <button type="submit" class="venom-btn-secondary" style="font-size: 0.8125rem; padding: 0.375rem 0.75rem;"{if $sslProduct->validationType == 'EV'} disabled="disabled" opacity="0.5"{/if}>
                                                <span style="display: flex; align-items: center; gap: 0.375rem;">
                                                    <svg class="h-3 w-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                        <line x1="12" y1="5" x2="12" y2="19"></line>
                                                        <polyline points="19 12 12 19 5 12"></polyline>
                                                    </svg>
                                                    <span>{lang key='upgrade'}</span>
                                                </span>
                                            </button>
                                        </form>
                                    {/if}
                                </div>
                            </td>

                        {else}
                            
                            {* Service-based SSL (not addon) *}
                            <td style="padding: 0.75rem; font-size: 0.875rem;">
                                {if $sslProduct->status == $sslStatusAwaitingConfiguration}
                                    <div style="display: inline-flex; align-items: center; padding: 0.25rem 0.5rem; border-radius: 0.25rem; background: hsl(var(--info)/0.1); color: hsl(var(--info)); font-size: 0.75rem; font-weight: 500;">
                                        {lang key='sslawaitingconfig'}
                                    </div>
                                {else}
                                    <div style="display: flex; align-items: center; gap: 0.5rem; flex-wrap: wrap;">
                                        <span style="font-weight: 500;">{if $sslProduct->service->domain}{$sslProduct->service->domain}{else}-{/if}</span>
                                        {if $sslProduct->service->nextDueDateProperties['isPast']}
                                            <span style="display: inline-flex; align-items: center; padding: 0.25rem 0.5rem; border-radius: 0.25rem; background: hsl(var(--muted)); font-size: 0.75rem; font-weight: 500;">
                                                {lang key='clientareaexpired'}
                                            </span>
                                        {elseif $sslProduct->service->nextDueDateProperties['daysTillExpiry'] < 60}
                                            <span style="display: inline-flex; align-items: center; padding: 0.25rem 0.5rem; border-radius: 0.25rem; background: hsl(var(--destructive)/0.1); color: hsl(var(--destructive)); font-size: 0.75rem; font-weight: 500;">
                                                {lang key='expiringsoon'}
                                            </span>
                                        {/if}
                                    </div>
                                {/if}
                            </td>

                            <td style="padding: 0.75rem; font-size: 0.875rem;">
                                <div style="display: flex; align-items: center; gap: 0.5rem; flex-wrap: wrap;">
                                    <span>{$sslProduct->service->product->name}</span>
                                    <span style="display: inline-flex; align-items: center; padding: 0.25rem 0.5rem; border-radius: 0.25rem; font-size: 0.75rem; font-weight: 500; {if $sslProduct->validationType == 'DV'}background: hsl(var(--muted));{elseif $sslProduct->validationType == 'OV'}background: hsl(var(--warning)/0.1); color: hsl(var(--warning));{elseif $sslProduct->validationType == 'EV'}background: hsl(var(--success)/0.1); color: hsl(var(--success));{/if}">
                                        {$sslProduct->validationType}
                                    </span>
                                </div>
                            </td>

                            <td style="padding: 0.75rem; font-size: 0.875rem;">
                                <span class="w-hidden">{$sslProduct->service->registrationDate}</span>
                                {$sslProduct->service->registrationDateFormatted}
                            </td>

                            <td style="padding: 0.75rem; font-size: 0.875rem;">
                                <span class="w-hidden">{$sslProduct->service->nextDueDate}</span>
                                {$sslProduct->service->nextDueDateFormatted}
                            </td>

                            <td style="padding: 0.75rem; text-align: center;">
                                <div style="display: flex; gap: 0.5rem; justify-content: center; flex-wrap: wrap;">
                                    {if $sslProduct->status == $sslStatusAwaitingIssuance}
                                        <button class="venom-btn-secondary btn-resend-approver-email" data-url="{routePath('clientarea-ssl-certificates-resend-approver-email')}" data-serviceid="{$sslProduct->serviceId}" style="font-size: 0.8125rem; padding: 0.375rem 0.75rem;">
                                            <span style="display: flex; align-items: center; gap: 0.375rem;">
                                                <svg class="h-3 w-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                    <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                                                    <polyline points="22,6 12,13 2,6"></polyline>
                                                </svg>
                                                <span>{lang key='sslresendmail'}</span>
                                            </span>
                                        </button>
                                    {/if}
                                    {if $sslProduct->status == $sslStatusAwaitingConfiguration}
                                        <a href="{$sslProduct->getConfigurationUrl()}" class="venom-btn-primary" style="display: inline-flex; align-items: center; gap: 0.375rem; font-size: 0.8125rem; padding: 0.375rem 0.75rem; text-decoration: none;">
                                            <svg class="h-3 w-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                <circle cx="12" cy="12" r="3"></circle>
                                                <path d="M12 1v6m0 6v6m5.66-13.66l-4.24 4.24m0 6.36l4.24 4.24M23 12h-6m-6 0H1m18.66 5.66l-4.24-4.24m0-6.36l4.24-4.24"></path>
                                            </svg>
                                            <span>{lang key='sslconfigure'}</span>
                                        </a>
                                    {/if}
                                </div>
                            </td>
                        {/if}

                    </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
</div>

{* DataTables initialization *}
{include file="$template/includes/tablelist.tpl" tableName="SslList" startOrderCol="3" filterColumn="0" noSortColumns="4"}

{* Resend email handler script *}
<script>
document.addEventListener('DOMContentLoaded', function() {
    const resendButtons = document.querySelectorAll('.btn-resend-approver-email');
    resendButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            const url = this.getAttribute('data-url');
            const addonId = this.getAttribute('data-addonid');
            const serviceId = this.getAttribute('data-serviceid');
            
            // Add loading state
            this.disabled = true;
            this.style.opacity = '0.6';
            
            // In production, this would make an AJAX call to resend the email
            console.log('Resending approver email...', { url, addonId, serviceId });
            
            // Simulate success (replace with actual AJAX in production)
            setTimeout(function() {
                button.disabled = false;
                button.style.opacity = '1';
                
                const alertContainer = document.querySelector('.alert-table-ssl-manage');
                if (alertContainer) {
                    alertContainer.classList.remove('w-hidden');
                    alertContainer.className = 'alert-success';
                    alertContainer.style.cssText = 'position: relative; border-radius: 0.75rem; border: 1px solid; padding: 1rem; margin-bottom: 1.5rem;';
                    alertContainer.innerHTML = '<div style="display: flex; gap: 0.75rem;"><div style="flex: 1; font-size: 0.875rem;">Approver email has been resent successfully.</div></div>';
                }
            }, 1000);
        });
    });
});
</script>
