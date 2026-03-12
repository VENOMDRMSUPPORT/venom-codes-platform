<script src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

{assign var="totalContacts" value=$contacts|@count}
{assign var="enabledEmailPrefCount" value=0}
{foreach $formdata.emailPreferences as $emailType => $value}
    {if $value}
        {assign var="enabledEmailPrefCount" value=$enabledEmailPrefCount+1}
    {/if}
{/foreach}

<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">Account Contacts</span>
            <h1 class="h3 font-weight-bold mb-2">Contact Profiles &amp; Notification Routing</h1>
            <p class="text-muted mb-0">Maintain operational contacts, billing recipients, and notification routing used across your VENOM account workflows.</p>
        </div>
        <div class="col-12 col-lg-4">
            <div class="d-flex flex-wrap justify-content-lg-end">
                <a href="clientarea.php?action=details" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-id-card fa-fw"></i>
                    Profile
                </a>
                <a href="{routePath('account-users')}" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-users-cog fa-fw"></i>
                    Users
                </a>
                <a href="{routePath('account-contacts-new')}" class="btn venom-btn venom-btn--solid btn-sm mb-2">
                    <i class="fas fa-user-plus fa-fw"></i>
                    {lang key='clientareanavaddcontact'}
                </a>
            </div>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-12 col-md-4 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Total Contacts</h3>
                <i class="fas fa-address-book text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$totalContacts}</p>
            <p class="small text-muted mb-0">Contact records available for communication and billing routing.</p>
        </div>
    </div>
    <div class="col-12 col-md-4 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Notification Channels</h3>
                <i class="fas fa-bell text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$enabledEmailPrefCount}</p>
            <p class="small text-muted mb-0">Email notification categories currently enabled for this contact.</p>
        </div>
    </div>
    <div class="col-12 col-md-4 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Management Scope</h3>
                <i class="fas fa-user-shield text-muted"></i>
            </div>
            <p class="small text-muted mb-0">Contact changes affect billing delivery, system notices, and account communication ownership.</p>
        </div>
    </div>
</div>

<div class="card mb-4">
    <div class="card-header d-flex flex-column flex-lg-row align-items-lg-center justify-content-lg-between">
        <h3 class="card-title m-0 mb-3 mb-lg-0">
            <i class="fas fa-user-check"></i>
            Active Contact Context
        </h3>
        <small class="text-muted">Switch records to edit a different contact or create a new one.</small>
    </div>
    <div class="card-body">
        <form role="form" method="post" action="{routePath('account-contacts')}">
            <div class="row align-items-end">
                <div class="col-md-3">
                    <label for="inputContactId" class="col-form-label">{lang key='clientareachoosecontact'}</label>
                </div>
                <div class="col-md-6">
                    <select name="contactid" id="inputContactId" onchange="submit()" class="form-control custom-select">
                        {foreach $contacts as $contact}
                            <option value="{$contact.id}"{if $contact.id eq $contactid} selected="selected"{/if}>{$contact.name} - {$contact.email}</option>
                        {/foreach}
                        <option value="new">{lang key='clientareanavaddcontact'}</option>
                    </select>
                </div>
                <div class="col-md-3 mt-3 mt-md-0">
                    <button type="submit" class="btn btn-default btn-block">{lang key='go'}</button>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="card mb-4">
    <div class="card-header">
        <h3 class="card-title m-0">{lang key="contactDetails"}</h3>
    </div>
    <div class="card-body">
        {include file="$template/includes/flashmessage.tpl"}
        {if $errorMessageHtml}
            {include file="$template/includes/alert.tpl" type="error" errorshtml=$errorMessageHtml}
        {/if}

        <form role="form" method="post" action="{routePath('account-contacts-save')}">
            <input type="hidden" name="contactid" value="{$contactid}" />

            <div class="row">
                <div class="col-md-6">

                    <div class="form-group">
                        <label for="inputFirstName" class="col-form-label">{lang key='clientareafirstname'}</label>
                        <input type="text" name="firstname" id="inputFirstName" value="{$formdata.firstname}" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="inputLastName" class="col-form-label">{lang key='clientarealastname'}</label>
                        <input type="text" name="lastname" id="inputLastName" value="{$formdata.lastname}" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="inputCompanyName" class="col-form-label">{lang key='clientareacompanyname'}</label>
                        <input type="text" name="companyname" id="inputCompanyName" value="{$formdata.companyname}" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="inputEmail" class="col-form-label">{lang key='clientareaemail'}</label>
                        <input type="email" name="email" id="inputEmail" value="{$formdata.email}" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="inputPhone" class="col-form-label">{lang key='clientareaphonenumber'}</label>
                        <input type="tel" name="phonenumber" id="inputPhone" value="{$formdata.phonenumber}" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="inputTaxId" class="col-form-label">{lang key=$taxIdLabel}</label>
                        <input type="text" name="tax_id" id="inputTaxId" class="form-control" value="{$formdata.tax_id}" />
                    </div>

                </div>
                <div class="col-md-6 col-12 float-right">

                    <div class="form-group">
                        <label for="inputAddress1" class="col-form-label">{lang key='clientareaaddress1'}</label>
                        <input type="text" name="address1" id="inputAddress1" value="{$formdata.address1}" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="inputAddress2" class="col-form-label">{lang key='clientareaaddress2'}</label>
                        <input type="text" name="address2" id="inputAddress2" value="{$formdata.address2}" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="inputCity" class="col-form-label">{lang key='clientareacity'}</label>
                        <input type="text" name="city" id="inputCity" value="{$formdata.city}" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="inputState" class="col-form-label">{lang key='clientareastate'}</label>
                        <input type="text" name="state" id="inputState" value="{$formdata.state}" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="inputPostcode" class="col-form-label">{lang key='clientareapostcode'}</label>
                        <input type="text" name="postcode" id="inputPostcode" value="{$formdata.postcode}" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="country">{lang key='clientareacountry'}</label>
                        {$countriesdropdown}
                    </div>

                </div>
            </div>
    </div>
</div>

<div class="card mb-4">
    <div class="card-header">
        <h3 class="card-title m-0">{lang key='clientareacontactsemails'}</h3>
    </div>
    <div class="card-body">
        <div class="controls form-check">
            {foreach $formdata.emailPreferences as $emailType => $value}
                <label>
                <input type="hidden" name="email_preferences[{$emailType}]" value="0">
                <input type="checkbox" class="form-check-input" name="email_preferences[{$emailType}]" id="{$emailType}emails" value="1"{if $value} checked="checked"{/if} />
                {lang key="clientareacontactsemails"|cat:$emailType}
                </label>{if !($emailType@last)}<br />{/if}
            {/foreach}
        </div>
    </div>
</div>

<div class="form-group text-center mb-4">
    <input class="btn btn-primary" type="submit" name="save" value="{lang key='clientareasavechanges'}" />
    <input class="btn btn-default" type="reset" value="{lang key='cancel'}" />
    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modalDeleteContact">{lang key='clientareadeletecontact'}</button>
</div>

</form>

<form method="post" action="{routePath('account-contacts-delete')}">
    <input type="hidden" name="contactid" value="{$contactid}">
    <div class="modal fade" id="modalDeleteContact">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header card-header">
                    <h4 class="modal-title">
                        {lang key="clientareadeletecontact"}
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <p>{lang key="clientareadeletecontactareyousure"}</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        {lang key="cancel"}
                    </button>
                    <button type="submit" class="btn btn-primary" id="btnCancelInviteConfirm">
                        {lang key="confirm"}
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>
