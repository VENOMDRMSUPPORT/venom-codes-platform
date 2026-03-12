<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">Invoice Checkout</span>
            <h1 class="h3 font-weight-bold mb-2">{lang key="makepayment"}</h1>
            <p class="text-muted mb-0">Complete secure payment processing for the selected invoice using your configured gateway and account payment method.</p>
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

{if $showRemoteInput}
    <div class="card mb-4">
        <div class="card-header">
            <h3 class="card-title m-0">{lang key="makepayment"}</h3>
        </div>
        <div class="card-body">
            <div id="frmRemoteCardProcess" class="text-center">
                {$remoteInput}
                <iframe name="ccframe" class="auth3d-area" width="90%" height="600" scrolling="auto" src="about:blank"></iframe>
            </div>
        </div>
    </div>

    <script>
        jQuery("#frmRemoteCardProcess").find("form:first").attr('target', 'ccframe');
        setTimeout("autoSubmitFormByContainer('frmRemoteCardProcess')", 1000);
    </script>
{else}
    {include file="$template/payment/$cardOrBank/validate.tpl"}
    <form id="frmPayment" method="post" action="{$submitLocation}" role="form">
        <input type="hidden" name="invoiceid" value="{$invoiceid}" />

        <div class="row mb-4">
            <div class="col-md-7 mb-4 mb-md-0">

                {if $errormessage}
                    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
                {/if}

                <div class="alert alert-danger text-center gateway-errors w-hidden"></div>

                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title m-0">{lang key="makepayment"}</h3>
                    </div>
                    <div class="card-body">
                        <div id="paymentGatewayInput">
                            <div class="cc-payment-form">
                                <div class="form-group row">
                                    <label class="col-sm-4 text-md-right control-label">
                                        {lang key='paymentmethod'}
                                    </label>
                                    <div class="col-sm-8">
                                        {include file="$template/payment/$cardOrBank/select.tpl"}
                                    </div>
                                </div>

                                {if !$hasRemoteInput}
                                    {include file="$template/payment/$cardOrBank/inputs.tpl"}
                                {/if}
                            </div>
                        </div>

                        <div id="btnSubmitContainer" class="form-group submit-container">
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary" id="btnSubmit" value="{lang key='submitpayment'}">
                                    <span class="pay-text">{lang key='submitpayment'}</span>
                                    <span class="click-text w-hidden">{lang key='pleasewait'}</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-md-5">
                {include file="$template/payment/invoice-summary.tpl"}
            </div>
        </div>

        {if $servedOverSsl}
            <div class="alert alert-warning" role="alert">
                <i class="fas fa-lock"></i> &nbsp; {lang key='creditcardsecuritynotice'}
            </div>
        {/if}

    </form>

    <script>
    jQuery(document).ready(function() {
        jQuery('#inputCardCvv, #inputCardNumber').filter(':visible').first().focus();
        WHMCS.payment.event.gatewayInit({
            _source: 'invoice-pay',
        }, '{$gateway|addslashes}');
        jQuery('#frmPayment').on('submit.paymentjs', function(e) {
            WHMCS.payment.event.checkoutFormSubmit(
                {
                    _source: 'invoice-pay',
                    event: e,
                },
                '{$gateway|addslashes}',
                jQuery(this)
            );
        });
    });
    </script>
{/if}
