<form method="post" action="clientarea.php?action=masspay">
    <input type="hidden" name="geninvoice" value="true" />

    {assign var="invoiceCount" value=$invoiceitems|@count}
    {assign var="gatewayCount" value=$gateways|@count}

    <div class="venom-diagram-card mb-4">
        <div class="row align-items-lg-center">
            <div class="col-12 col-lg-8 mb-4 mb-lg-0">
                <span class="venom-chip">Billing Consolidation</span>
                <h1 class="h3 font-weight-bold mb-2">{lang key="masspaytitle"}</h1>
                <p class="text-muted mb-0">{lang key="masspaydescription"}</p>
            </div>
            <div class="col-12 col-lg-4">
                <div class="d-flex flex-wrap justify-content-lg-end">
                    <a href="clientarea.php?action=invoices" class="btn btn-default btn-sm mr-2 mb-2">
                        <i class="fas fa-file-invoice fa-fw"></i>
                        {lang key='invoices'}
                    </a>
                    <a href="{routePath('account-paymentmethods')}" class="btn btn-default btn-sm mb-2">
                        <i class="fas fa-credit-card fa-fw"></i>
                        {lang key='paymentMethods.title'}
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="row mb-4">
        <div class="col-12 col-sm-6 col-lg-3 mb-3">
            <div class="venom-plan-card h-100">
                <div class="d-flex align-items-center justify-content-between mb-2">
                    <h3 class="h6 font-weight-bold mb-0">Invoices Included</h3>
                    <i class="fas fa-layer-group text-muted"></i>
                </div>
                <p class="h4 font-weight-bold mb-1">{$invoiceCount}</p>
                <p class="small text-muted mb-0">Unpaid invoices selected for one combined payment.</p>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-lg-3 mb-3">
            <div class="venom-plan-card h-100">
                <div class="d-flex align-items-center justify-content-between mb-2">
                    <h3 class="h6 font-weight-bold mb-0">{lang key='invoicessubtotal'}</h3>
                    <i class="fas fa-calculator text-muted"></i>
                </div>
                <p class="h4 font-weight-bold mb-1">{$subtotal}</p>
                <p class="small text-muted mb-0">Subtotal before tax, credit, and partial-payment adjustments.</p>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-lg-3 mb-3">
            <div class="venom-plan-card h-100">
                <div class="d-flex align-items-center justify-content-between mb-2">
                    <h3 class="h6 font-weight-bold mb-0">{lang key='invoicestotaldue'}</h3>
                    <span class="label status status-unpaid">Due</span>
                </div>
                <p class="h4 font-weight-bold mb-1">{$total}</p>
                <p class="small text-muted mb-0">Final balance to settle through the selected payment gateway.</p>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-lg-3 mb-3">
            <div class="venom-plan-card h-100">
                <div class="d-flex align-items-center justify-content-between mb-2">
                    <h3 class="h6 font-weight-bold mb-0">Gateways</h3>
                    <i class="fas fa-university text-muted"></i>
                </div>
                <p class="h4 font-weight-bold mb-1">{$gatewayCount}</p>
                <p class="small text-muted mb-0">Available payment methods for consolidated billing checkout.</p>
            </div>
        </div>
    </div>

    <div class="card mb-4">
        <div class="card-header">
            <h3 class="card-title m-0">Invoice Consolidation Summary</h3>
        </div>
        <div class="card-body p-0">
            <div class="table-container clearfix mb-0">
                <table class="table table-list mb-0">
                    <thead>
                        <tr>
                            <th>{lang key='invoicesdescription'}</th>
                            <th>{lang key='invoicesamount'}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $invoiceitems as $invid => $invoiceitem}
                            <tr>
                                <td colspan="2" class="bg-default">
                                    <strong>{lang key='invoicenumber'} {if $invoiceitem.0.invoicenum}{$invoiceitem.0.invoicenum}{else}{$invid}{/if}</strong>
                                    <input type="hidden" name="invoiceids[]" value="{$invid}" />
                                </td>
                            </tr>
                            {foreach from=$invoiceitem item=item}
                                <tr class="masspay-invoice-detail">
                                    <td>{$item.description}</td>
                                    <td>{$item.amount}</td>
                                </tr>
                            {/foreach}
                        {foreachelse}
                            <tr>
                                <td colspan="2" class="text-center">{lang key='norecordsfound'}</td>
                            </tr>
                        {/foreach}
                        <tr class="masspay-total">
                            <td class="text-right">{lang key='invoicessubtotal'}:</td>
                            <td>{$subtotal}</td>
                        </tr>
                        {if $tax}
                            <tr class="masspay-total">
                                <td class="text-right">{$taxrate1}% {$taxname1}:</td>
                                <td>{$tax}</td>
                            </tr>
                        {/if}
                        {if $tax2}
                            <tr class="masspay-total">
                                <td class="text-right">{$taxrate2}% {$taxname2}:</td>
                                <td>{$tax2}</td>
                            </tr>
                        {/if}
                        {if $credit}
                            <tr class="masspay-total">
                                <td class="text-right">{lang key='invoicescredit'}:</td>
                                <td>{$credit}</td>
                            </tr>
                        {/if}
                        {if $partialpayments}
                            <tr class="masspay-total">
                                <td class="text-right">{lang key='invoicespartialpayments'}:</td>
                                <td>{$partialpayments}</td>
                            </tr>
                        {/if}
                        <tr class="masspay-total">
                            <td class="text-right">{lang key='invoicestotaldue'}:</td>
                            <td>{$total}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-6 offset-sm-3">
            <div class="card bg-default">
                <div class="card-header">
                    <h3 class="card-title m-0">{lang key='masspaymentselectgateway'}</h3>
                </div>
                <div class="card-body">
                    <fieldset>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="paymentmethod" class="col-form-label">{lang key='orderpaymentmethod'}:</label><br/>
                                <select name="paymentmethod" id="paymentmethod" class="form-control custom-select">
                                    {foreach $gateways as $gateway}
                                        <option value="{$gateway.sysname}">{$gateway.name}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-block" id="btnMassPayMakePayment">
                                    {lang key='masspaymakepayment'}
                                </button>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>

</form>
