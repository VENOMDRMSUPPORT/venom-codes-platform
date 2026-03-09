{* VENOM CODES — SSL Configuration Step 1 *}

{if !$status}
    <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 2rem;">
        <div style="text-align: center;">
            {include file="$template/includes/client/alert.tpl" alert_type="warning" alert_content="{lang key='sslinvalidlink'}"}
            <div style="margin-top: 1.5rem;">
                <button type="button" onclick="history.go(-1)" class="venom-btn-primary">
                    {lang key='clientareabacklink'}
                </button>
            </div>
        </div>
    </div>

{else}

    <form method="post" action="{if $status == 'Awaiting Configuration'}{$smarty.server.PHP_SELF}?cert={$cert}&step=2{else}clientarea.php?action=productdetails{/if}">
        
        {if $errormessage}
            <div style="margin-bottom: 1.5rem;">
                {include file="$template/includes/client/alert.tpl" alert_type="error" alert_content=$errormessage}
            </div>
        {/if}

        {if $status eq "Awaiting Configuration"}

            {* Server Information Section *}
            <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); margin-bottom: 1.5rem;">
                <div style="border-bottom: 1px solid hsl(var(--border)); padding: 1rem 1.25rem;">
                    <h2 class="font-display" style="font-size: 1.125rem; font-weight: 600; margin: 0;">
                        {lang key='sslserverinfo'}
                    </h2>
                </div>
                <div style="padding: 1.25rem;">
                    {include file="$template/includes/client/alert.tpl" alert_type="info" alert_content={lang key='sslserverinfodetails'}}

                    <div style="margin-top: 1.5rem; display: flex; flex-direction: column; gap: 1rem;">
                        <div>
                            <label for="inputServerType" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                                {lang key='sslservertype'} <span class="text-destructive">*</span>
                            </label>
                            <select name="servertype" id="inputServerType" class="venom-input">
                                <option value="" selected>{lang key='ssl.selectWebserver' serverType={lang key='sslservertype'}}</option>
                                {foreach $webservertypes as $webservertypeid => $webservertype}
                                    <option value="{$webservertypeid}"{if $servertype eq $webservertypeid} selected{/if}>
                                        {$webservertype}
                                    </option>
                                {/foreach}
                            </select>
                        </div>

                        <div>
                            <label for="inputCsr" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                                {lang key='sslcsr'} <span class="text-destructive">*</span>
                            </label>
                            <textarea name="csr" id="inputCsr" rows="7" class="venom-input" style="font-family: monospace; font-size: 0.8125rem;">{if $csr}{$csr}{else}-----BEGIN CERTIFICATE REQUEST-----
-----END CERTIFICATE REQUEST-----{/if}</textarea>
                        </div>

                        {foreach $additionalfields as $heading => $fields}
                            <div style="padding-top: 0.5rem;">
                                <strong style="font-size: 0.875rem; font-weight: 600; display: block; margin-bottom: 0.75rem;">{$heading}</strong>
                                <div style="display: flex; flex-direction: column; gap: 1rem;">
                                    {foreach $fields as $vals}
                                        <div style="display: grid; grid-template-columns: 1fr; gap: 0.5rem;">
                                            <style>@media (min-width: 768px) { .ssl-field-row { grid-template-columns: 200px 1fr !important; align-items: center !important; } }</style>
                                            <div class="ssl-field-row" style="display: grid; grid-template-columns: 1fr; gap: 0.5rem;">
                                                <label for="inputAdditionalField" style="font-size: 0.875rem; font-weight: 500;">{$vals.name}</label>
                                                <div>
                                                    {$vals.input} {$vals.description}
                                                </div>
                                            </div>
                                        </div>
                                    {/foreach}
                                </div>
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>

            {* Admin Information Section *}
            <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); margin-bottom: 1.5rem;">
                <div style="border-bottom: 1px solid hsl(var(--border)); padding: 1rem 1.25rem;">
                    <h2 class="font-display" style="font-size: 1.125rem; font-weight: 600; margin: 0;">
                        {lang key='ssladmininfo'}
                    </h2>
                </div>
                <div style="padding: 1.25rem;">
                    {include file="$template/includes/client/alert.tpl" alert_type="info" alert_content={lang key='ssladmininfodetails'}}

                    <div style="margin-top: 1.5rem; display: flex; flex-direction: column; gap: 1rem;">
                        <div style="display: grid; grid-template-columns: 1fr; gap: 1rem;">
                            <style>@media (min-width: 640px) { .name-row-2 { grid-template-columns: repeat(2, 1fr) !important; } }</style>
                            <div class="name-row-2" style="display: grid; grid-template-columns: 1fr; gap: 1rem;">
                                <div>
                                    <label for="inputFirstName" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                                        {lang key='clientareafirstname'} <span class="text-destructive">*</span>
                                    </label>
                                    <input type="text" class="venom-input" name="firstname" id="inputFirstName" value="{$firstname}" />
                                </div>
                                <div>
                                    <label for="inputLastName" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                                        {lang key='clientarealastname'} <span class="text-destructive">*</span>
                                    </label>
                                    <input type="text" class="venom-input" name="lastname" id="inputLastName" value="{$lastname}" />
                                </div>
                            </div>
                        </div>

                        <div>
                            <label for="inputOrgName" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                                {lang key='organizationname'}
                            </label>
                            <input type="text" class="venom-input" name="orgname" id="inputOrgName" value="{$orgname}" />
                        </div>

                        <div>
                            <label for="inputJobTitle" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                                {lang key='jobtitle'}
                            </label>
                            <input type="text" class="venom-input" name="jobtitle" id="inputJobTitle" value="{$jobtitle}" />
                            <p class="text-muted-foreground" style="margin-top: 0.25rem; font-size: 0.75rem;">{lang key='jobtitlereqforcompany'}</p>
                        </div>

                        <div>
                            <label for="inputEmail" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                                {lang key='clientareaemail'} <span class="text-destructive">*</span>
                            </label>
                            <input type="text" class="venom-input" name="email" id="inputEmail" value="{$email}" />
                        </div>

                        <div>
                            <label for="inputAddress1" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                                {lang key='clientareaaddress1'} <span class="text-destructive">*</span>
                            </label>
                            <input type="text" class="venom-input" name="address1" id="inputAddress1" value="{$address1}" />
                        </div>

                        <div>
                            <label for="inputAddress2" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                                {lang key='clientareaaddress2'}
                            </label>
                            <input type="text" class="venom-input" name="address2" id="inputAddress2" value="{$address2}" />
                        </div>

                        <div style="display: grid; grid-template-columns: 1fr; gap: 1rem;">
                            <style>@media (min-width: 640px) { .addr-row-3 { grid-template-columns: repeat(3, 1fr) !important; } }</style>
                            <div class="addr-row-3" style="display: grid; grid-template-columns: 1fr; gap: 1rem;">
                                <div>
                                    <label for="inputCity" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                                        {lang key='clientareacity'} <span class="text-destructive">*</span>
                                    </label>
                                    <input type="text" class="venom-input" name="city" id="inputCity" value="{$city}" />
                                </div>
                                <div>
                                    <label for="inputState" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                                        {lang key='clientareastate'}
                                    </label>
                                    <input type="text" class="venom-input" name="state" id="inputState" value="{$state}" />
                                </div>
                                <div>
                                    <label for="inputPostcode" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                                        {lang key='clientareapostcode'} <span class="text-destructive">*</span>
                                    </label>
                                    <input type="text" class="venom-input" name="postcode" id="inputPostcode" value="{$postcode}" />
                                </div>
                            </div>
                        </div>

                        <div>
                            <label for="inputCountry" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                                {lang key='clientareacountry'} <span class="text-destructive">*</span>
                            </label>
                            <select name="country" id="inputCountry" class="venom-input">
                                {foreach $clientcountries as $thisCountryCode => $thisCountryName}
                                    <option value="{$thisCountryCode}" {if $thisCountryCode eq $country}selected="selected"{/if}>{$thisCountryName}</option>
                                {/foreach}
                            </select>
                        </div>

                        <div>
                            <label for="inputPhoneNumber" style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">
                                {lang key='clientareaphonenumber'} <span class="text-destructive">*</span>
                            </label>
                            <input type="tel" class="venom-input" name="phonenumber" id="inputPhoneNumber" value="{$phonenumber}" />
                        </div>
                    </div>

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
                </div>
            </div>

        {else}

            {* Already Configured State *}
            <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 2rem;">
                {include file="$template/includes/client/alert.tpl" alert_type="info" alert_content="{lang key='sslnoconfigurationpossible'}"}

                <input type="hidden" name="id" value="{$serviceid}" />
                <div style="text-align: center; margin-top: 1.5rem;">
                    <button type="submit" class="venom-btn-secondary">
                        {lang key='invoicesbacktoclientarea'}
                    </button>
                </div>
            </div>

        {/if}
    </form>
{/if}
