{if $createSuccess}
    {include file="$template/includes/alert.tpl" type="success" msg="<i class='fas fa-check fa-fw'></i> {lang key='paymentMethods.addedSuccess'}"}
{elseif $createFailed}
    {include file="$template/includes/alert.tpl" type="warning" msg="<i class='fas fa-times fa-fw'></i> {lang key='paymentMethods.addFailed'}"}
{elseif $saveSuccess}
    {include file="$template/includes/alert.tpl" type="success" msg="<i class='fas fa-check fa-fw'></i> {lang key='paymentMethods.updateSuccess'}"}
{elseif $saveFailed}
    {include file="$template/includes/alert.tpl" type="warning" msg="<i class='fas fa-check fa-fw'></i> {lang key='paymentMethods.saveFailed'}"}
{elseif $setDefaultResult === true}
    {include file="$template/includes/alert.tpl" type="success" msg="<i class='fas fa-check fa-fw'></i> {lang key='paymentMethods.defaultUpdateSuccess'}"}
{elseif $setDefaultResult === false}
    {include file="$template/includes/alert.tpl" type="warning" msg="<i class='fas fa-times fa-fw'></i> {lang key='paymentMethods.defaultUpdateFailed'}"}
{elseif $deleteResult === true}
    {include file="$template/includes/alert.tpl" type="success" msg="<i class='fas fa-check fa-fw'></i> {lang key='paymentMethods.deleteSuccess'}"}
{elseif $deleteResult === false}
    {include file="$template/includes/alert.tpl" type="warning" msg="<i class='fas fa-times fa-fw'></i> {lang key='paymentMethods.deleteFailed'}"}
{/if}

{assign var="validatedPayMethods" value=$client->payMethods->validateGateways()}
{assign var="totalPayMethods" value=0}
{assign var="defaultPayMethods" value=0}
{assign var="expiredPayMethods" value=0}
{assign var="bankPayMethods" value=0}

{capture name=payMethodRows}
    {foreach $validatedPayMethods as $payMethod}
        {assign var="totalPayMethods" value=$totalPayMethods+1}
        {if $payMethod->isDefaultPayMethod()}
            {assign var="defaultPayMethods" value=$defaultPayMethods+1}
        {/if}
        {if $payMethod->isExpired()}
            {assign var="expiredPayMethods" value=$expiredPayMethods+1}
        {/if}
        {if $payMethod->getType() == 'RemoteBankAccount'}
            {assign var="bankPayMethods" value=$bankPayMethods+1}
        {/if}
        <tr>
            <td class="text-center">
                <i class="{$payMethod->getFontAwesomeIcon()}"></i>
            </td>
            <td>
                <div class="d-flex flex-column">
                    <strong>{$payMethod->payment->getDisplayName()}</strong>
                    <small class="text-muted">{if $payMethod->description}{$payMethod->description}{else}-{/if}</small>
                </div>
            </td>
            <td>
                {$payMethod->getStatus()}
                {if $payMethod->isDefaultPayMethod()}
                    <span class="label status status-paid ml-2">{lang key='paymentMethods.default'}</span>
                {/if}
            </td>
            <td>
                <a href="{routePath('account-paymentmethods-setdefault', $payMethod->id)}" class="btn btn-sm btn-default btn-set-default{if $payMethod->isDefaultPayMethod() || $payMethod->isExpired()} disabled{/if}">
                    {lang key='paymentMethods.setAsDefault'}
                </a>
                <a href="{routePath('account-paymentmethods-view', $payMethod->id)}" class="btn btn-sm btn-default{if $payMethod->getType() == 'RemoteBankAccount'} disabled{/if}" data-role="edit-payment-method">
                    <i class="fas fa-pencil"></i>
                    {lang key='paymentMethods.edit'}
                </a>
                {if $allowDelete}
                    <a href="{routePath('account-paymentmethods-delete', $payMethod->id)}" class="btn btn-sm btn-default btn-delete">
                        <i class="fas fa-trash"></i>
                        {lang key='paymentMethods.delete'}
                    </a>
                {/if}
            </td>
        </tr>
    {foreachelse}
        <tr>
            <td colspan="4" class="text-center">
                {lang key='paymentMethods.noPaymentMethodsCreated'}
            </td>
        </tr>
    {/foreach}
{/capture}

{assign var="cardPayMethods" value=$totalPayMethods-$bankPayMethods}

<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">Billing Security</span>
            <h1 class="h3 font-weight-bold mb-2">{lang key='paymentMethods.title'}</h1>
            <p class="text-muted mb-0">{lang key='paymentMethods.intro'}</p>
        </div>
        <div class="col-12 col-lg-4">
            <div class="d-flex flex-wrap justify-content-lg-end">
                {if $allowCreditCard}
                    <a href="{routePath('account-paymentmethods-add')}" class="btn venom-btn venom-btn--solid btn-sm mr-2 mb-2" data-role="add-new-credit-card">
                        <i class="fas fa-plus-circle fa-fw"></i>
                        {lang key='paymentMethods.addNewCC'}
                    </a>
                {/if}
                {if $allowBankDetails}
                    <a href="{routePathWithQuery('account-paymentmethods-add', null, 'type=bankacct')}" class="btn btn-default btn-sm mb-2">
                        <i class="fas fa-university fa-fw"></i>
                        {lang key='paymentMethods.addNewBank'}
                    </a>
                {/if}
            </div>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-12 col-sm-6 col-lg-3 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Saved Methods</h3>
                <i class="fas fa-wallet text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$totalPayMethods}</p>
            <p class="small text-muted mb-0">Total methods available for recurring software billing.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-3 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Default Methods</h3>
                <span class="label status status-paid">Default</span>
            </div>
            <p class="h4 font-weight-bold mb-1">{$defaultPayMethods}</p>
            <p class="small text-muted mb-0">Primary method used for automatic renewal processing.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-3 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Card Profiles</h3>
                <i class="fas fa-credit-card text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$cardPayMethods}</p>
            <p class="small text-muted mb-0">Card-based rails for fast license renewal settlement.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-3 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Review Required</h3>
                <span class="label status status-overdue">Review</span>
            </div>
            <p class="h4 font-weight-bold mb-1">{$expiredPayMethods}</p>
            <p class="small text-muted mb-0">Expired instruments that may impact automated billing.</p>
        </div>
    </div>
</div>

<div class="card">
    <div class="card-header d-flex flex-column flex-lg-row align-items-lg-center justify-content-lg-between">
        <h3 class="card-title m-0 mb-3 mb-lg-0">
            <i class="fas fa-shield-alt"></i>
            Secure Payment Method Manager
        </h3>
        <small class="text-muted">Actions are account-scoped and follow your configured payment gateways.</small>
    </div>
    <div class="card-body p-0">
        <div class="table-container clearfix mb-0">
            <table class="table table-list mb-0" id="payMethodList">
                <thead>
                    <tr>
                        <th class="text-center"></th>
                        <th>{lang key='paymentMethods.name'}</th>
                        <th>{lang key='paymentMethods.status'}</th>
                        <th>{lang key='paymentMethods.actions'}</th>
                    </tr>
                </thead>
                <tbody>
                    {$smarty.capture.payMethodRows}
                </tbody>
            </table>
        </div>
    </div>
</div>

<form method="post" action="" id="frmDeletePaymentMethod">
<div class="modal fade" id="modalPaymentMethodDeleteConfirmation" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">{lang key='paymentMethods.areYouSure'}</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <p>{lang key='paymentMethods.deletePaymentMethodConfirm'}</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">{lang key='no'}</button>
        <button type="submit" class="btn btn-primary">{lang key='yes'}</button>
      </div>
    </div>
  </div>
</div>
</form>

<form method="post" action="" id="frmSetDefaultPaymentMethod"></form>

<script>
    jQuery(document).ready(function() {
        jQuery('.btn-set-default').click(function(e) {
            e.preventDefault();
            jQuery('#frmSetDefaultPaymentMethod')
                .attr('action', jQuery(this).attr('href'))
                .submit();
        });
        jQuery('.btn-delete').click(function(e) {
            e.preventDefault();
            jQuery('#frmDeletePaymentMethod')
                .attr('action', jQuery(this).attr('href'));
            jQuery('#modalPaymentMethodDeleteConfirmation').modal('show');
        });
    });
</script>
