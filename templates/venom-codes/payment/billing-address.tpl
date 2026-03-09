{* VENOM CODES — Billing Address Component *}

<div{if !$addingNew} class="w-hidden"{/if}>
    <div style="margin-bottom: 1rem;" id="billingAddressChoice">
        <label style="display: block; margin-bottom: 0.5rem; font-size: 0.875rem; font-weight: 500;">
            {lang key='billingAddress'}
        </label>
        <div style="display: flex; flex-direction: column; gap: 0.75rem;">
            <label class="billing-contact-0" style="position: relative; display: flex; align-items: start; gap: 0.75rem; padding: 1rem; border: 1px solid hsl(var(--border)); border-radius: 0.5rem; cursor: pointer; transition: all 0.2s;">
                <input
                    type="radio"
                    class="icheck-button"
                    name="billingcontact"
                    value="0"
                    {if !$billingContact} checked{/if}
                    style="margin-top: 0.25rem;"
                >
                <div style="flex: 1;">
                    <strong class="name" style="display: block; font-weight: 600; margin-bottom: 0.25rem;">{$client->fullName}</strong>
                    <span class="text-muted-foreground" style="font-size: 0.875rem; display: block;">
                        <span class="address1">{$client->address1}</span>,
                        {if $client->address2}<span class="address2">{$client->address2}</span>,{/if}
                        <span class="city">{$client->city}</span>,
                        <span class="state">{$client->state}</span>,
                        <span class="postcode">{$client->postcode}</span>,
                        <span class="country">{$client->country}</span>
                    </span>
                </div>
            </label>

            {foreach $client->contacts()->orderBy('firstname', 'asc')->orderBy('lastname', 'asc')->get() as $contact}
                <label class="billing-contact-{$contact->id}" style="position: relative; display: flex; align-items: start; gap: 0.75rem; padding: 1rem; border: 1px solid hsl(var(--border)); border-radius: 0.5rem; cursor: pointer; transition: all 0.2s;">
                    <input
                        type="radio"
                        class="icheck-button"
                        name="billingcontact"
                        value="{$contact->id}"
                        {if $billingContact == $contact->id} checked{/if}
                        style="margin-top: 0.25rem;"
                    >
                    <div style="flex: 1;">
                        <strong class="name" style="display: block; font-weight: 600; margin-bottom: 0.25rem;">{$contact->fullName}</strong>
                        <span class="text-muted-foreground text-truncate" style="font-size: 0.875rem; display: block;">
                            <span class="address1">{$contact->address1}</span>,
                            {if $contact->address2}<span class="address2">{$contact->address2}</span>,{/if}
                            <span class="city">{$contact->city}</span>,
                            <span class="state">{$contact->state}</span>,
                            <span class="postcode">{$contact->postcode}</span>,
                            <span class="country">{$contact->country}</span>
                        </span>
                    </div>
                </label>
            {/foreach}

            <label style="position: relative; display: flex; align-items: center; gap: 0.75rem; padding: 1rem; border: 1px solid hsl(var(--border)); border-radius: 0.5rem; cursor: pointer; transition: all 0.2s;">
                <input
                    type="radio"
                    class="icheck-button"
                    name="billingcontact"
                    value="new"
                    {if $billingContact === 'new'} checked{/if}
                >
                <div style="display: flex; align-items: center; gap: 0.5rem;">
                    <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="12" y1="5" x2="12" y2="19"></line>
                        <line x1="5" y1="12" x2="19" y2="12"></line>
                    </svg>
                    <span style="font-weight: 500;">{lang key='paymentMethodsManage.addNewBillingAddress'}</span>
                </div>
            </label>
        </div>
    </div>
</div>

<div{if !$userDetailsValidationError && $billingcontact !== 'new'} class="w-hidden"{/if}>
    <div id="newBillingAddress" style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 1.25rem;">
        <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600; margin-bottom: 1rem;">New Billing Address</h3>
        
        <div style="display: flex; flex-direction: column; gap: 1rem;">
            <div class="cc-billing-address">
                <label for="inputFirstName" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                    {lang key='clientareafirstname'} <span class="text-destructive">*</span>
                </label>
                <input type="text" name="firstname" id="inputFirstName" value="{$firstname}" class="venom-input" />
            </div>

            <div class="cc-billing-address">
                <label for="inputLastName" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                    {lang key='clientarealastname'} <span class="text-destructive">*</span>
                </label>
                <input type="text" name="lastname" id="inputLastName" value="{$lastname}" class="venom-input" />
            </div>

            <div class="cc-billing-address">
                <label for="inputAddress1" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                    {lang key='clientareaaddress1'} <span class="text-destructive">*</span>
                </label>
                <input type="text" name="address1" id="inputAddress1" value="{$address1}" class="venom-input" />
            </div>

            <div class="cc-billing-address">
                <label for="inputAddress2" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                    {lang key='clientareaaddress2'}
                </label>
                <input type="text" name="address2" id="inputAddress2" value="{$address2}" class="venom-input" />
            </div>

            <div class="cc-billing-address">
                <label for="inputCity" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                    {lang key='clientareacity'} <span class="text-destructive">*</span>
                </label>
                <input type="text" name="city" id="inputCity" value="{$city}" class="venom-input" />
            </div>

            <div class="cc-billing-address">
                <label for="inputState" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                    {lang key='clientareastate'}
                </label>
                <input type="text" name="state" id="inputState" value="{$state}" class="venom-input" data-custom-select/>
            </div>

            <div class="cc-billing-address">
                <label for="inputPostcode" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                    {lang key='clientareapostcode'} <span class="text-destructive">*</span>
                </label>
                <input type="text" name="postcode" id="inputPostcode" value="{$postcode}" class="venom-input" />
            </div>

            <div class="cc-billing-address">
                <label for="inputCountry" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                    {lang key='clientareacountry'} <span class="text-destructive">*</span>
                </label>
                <select id="country" name="country" class="venom-input">
                    {foreach $countries as $countryCode => $countryName}
                        <option value="{$countryCode}"{if $countryCode == $country} selected="selected"{/if}>
                            {$countryName}
                        </option>
                    {/foreach}
                </select>
            </div>

            <div class="cc-billing-address">
                <label for="inputPhone" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                    {lang key='clientareaphonenumber'} <span class="text-destructive">*</span>
                </label>
                <input type="text" name="phonenumber" id="inputPhone" value="{$phonenumber}" class="venom-input" />
            </div>
        </div>
    </div>
</div>
