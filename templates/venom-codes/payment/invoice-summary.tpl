{* VENOM CODES — Invoice Summary Component *}

<div id="invoiceIdSummary" style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); overflow: hidden;">
    <div class="invoice-summary" style="padding: 1.5rem;">
        
        {* Invoice Number Header *}
        <div style="text-align: center; margin-bottom: 1.5rem;">
            <h2 class="font-display" style="font-size: 1.25rem; font-weight: 600; margin-bottom: 0.25rem;">
                {lang key="invoicenumber"}{if $invoicenum}{$invoicenum}{else}{$invoiceid}{/if}
            </h2>
        </div>

        {* Invoice Items Table *}
        <div class="invoice-summary-table" style="margin-bottom: 1.5rem;">
            <div style="border: 1px solid hsl(var(--border)); border-radius: 0.5rem; overflow: hidden;">
                <table style="width: 100%; border-collapse: collapse;">
                    <thead style="background: hsl(var(--muted)); border-bottom: 1px solid hsl(var(--border));">
                        <tr>
                            <th style="padding: 0.75rem; text-align: left; font-size: 0.875rem; font-weight: 600;">
                                {lang key="invoicesdescription"}
                            </th>
                            <th style="padding: 0.75rem; text-align: right; font-size: 0.875rem; font-weight: 600; width: 150px;">
                                {lang key="invoicesamount"}
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $invoiceitems as $item}
                            <tr style="border-bottom: 1px solid hsl(var(--border));">
                                <td style="padding: 0.75rem; font-size: 0.875rem;">{$item.description}</td>
                                <td style="padding: 0.75rem; text-align: right; font-size: 0.875rem; font-weight: 500;">{$item.amount}</td>
                            </tr>
                        {/foreach}
                    </tbody>
                    <tfoot>
                        <tr style="background: hsl(var(--muted)/0.5); border-top: 1px solid hsl(var(--border));">
                            <td style="padding: 0.75rem; text-align: right; font-size: 0.875rem; font-weight: 600;">
                                {lang key="invoicessubtotal"}
                            </td>
                            <td style="padding: 0.75rem; text-align: right; font-size: 0.875rem; font-weight: 600;">
                                {$invoice.subtotal}
                            </td>
                        </tr>
                        {if $invoice.taxrate}
                            <tr style="background: hsl(var(--muted)/0.5);">
                                <td style="padding: 0.75rem; text-align: right; font-size: 0.875rem; font-weight: 500;">
                                    {$invoice.taxrate}% {$invoice.taxname}
                                </td>
                                <td style="padding: 0.75rem; text-align: right; font-size: 0.875rem; font-weight: 500;">
                                    {$invoice.tax}
                                </td>
                            </tr>
                        {/if}
                        {if $invoice.taxrate2}
                            <tr style="background: hsl(var(--muted)/0.5);">
                                <td style="padding: 0.75rem; text-align: right; font-size: 0.875rem; font-weight: 500;">
                                    {$invoice.taxrate2}% {$invoice.taxname2}
                                </td>
                                <td style="padding: 0.75rem; text-align: right; font-size: 0.875rem; font-weight: 500;">
                                    {$invoice.tax2}
                                </td>
                            </tr>
                        {/if}
                        <tr style="background: hsl(var(--muted)/0.5);">
                            <td style="padding: 0.75rem; text-align: right; font-size: 0.875rem; font-weight: 500;">
                                {lang key="invoicescredit"}
                            </td>
                            <td style="padding: 0.75rem; text-align: right; font-size: 0.875rem; font-weight: 500;">
                                {$invoice.credit}
                            </td>
                        </tr>
                        <tr style="background: hsl(var(--primary)); color: hsl(var(--primary-foreground)); border-top: 2px solid hsl(var(--primary));">
                            <td style="padding: 0.75rem; text-align: right; font-size: 1rem; font-weight: 700;">
                                {lang key="invoicestotaldue"}
                            </td>
                            <td style="padding: 0.75rem; text-align: right; font-size: 1rem; font-weight: 700;">
                                {$invoice.total}
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        {* Payment Status Summary *}
        <div style="display: flex; flex-direction: column; gap: 0.75rem;">
            <div style="text-align: center; padding: 0.75rem; border-radius: 0.5rem; background: hsl(var(--muted)); font-size: 0.875rem;">
                <span class="text-muted-foreground">{lang key="paymentstodate"}:</span> 
                <strong style="margin-left: 0.25rem; font-weight: 600;">{$invoice.amountpaid}</strong>
            </div>
            
            <div class="alert-success" style="text-align: center; padding: 1rem; border-radius: 0.5rem; border: 1px solid; margin: 0;">
                <div style="display: flex; align-items: center; justify-content: center; gap: 0.5rem;">
                    <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="12" y1="1" x2="12" y2="23"></line>
                        <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
                    </svg>
                    <div style="font-size: 0.875rem;">
                        <span class="text-muted-foreground">{lang key="balancedue"}:</span> 
                        <strong style="margin-left: 0.25rem; font-size: 1rem; font-weight: 700;">{$balance}</strong>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
