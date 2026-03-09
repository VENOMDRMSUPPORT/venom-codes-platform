{* VENOM CODES — Domain Search Widget Component *}

<form method="post" action="domainchecker.php" id="frmDomainHomepage">
    <div class="home-domain-search bg-white" style="background: white; padding: 3rem 0; margin: 2rem 0;">
        <div class="container">
            <div class="p-5 clearfix" style="background: linear-gradient(135deg, var(--gray-50, #f9fafb) 0%, white 100%); border-radius: 1.5rem; padding: 3rem; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);">
                <h2 class="text-center" style="font-size: 2rem; font-weight: 700; color: var(--gray-900, #111827); margin-bottom: 2rem;">{lang key="secureYourDomainShort"}</h2>
                <input type="hidden" name="transfer" />
                <div class="input-group-wrapper">
                    <div class="input-group{if $showAdvancedSearchOptions} advanced-input{/if}" style="border-radius: 0.75rem; overflow: hidden; box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);">
                        {if $showAdvancedSearchOptions}
                            <textarea name="message"
                                      id="message"
                                      title="{lang key='domainSearch.domainOrAiPrompt'}"
                                      data-placement="left"
                                      data-trigger="manual"
                                      placeholder="{lang key='domainSearch.domainOrAiInstruction'}"
                                      style="width: 100%; min-height: 100px; border: 1px solid var(--gray-300, #d1d5db); border-radius: 0.75rem; padding: 1rem; font-size: 1rem; resize: vertical;"></textarea>
                            <select name="tlds[]" class="multiselect multiselect-filter" multiple="multiple" data-placeholder="{lang key='domainSearch.tlds'}" data-min-selection="1" style="width: 100%; padding: 0.75rem; border: 1px solid var(--gray-300, #d1d5db); border-radius: 0.5rem; margin-top: 0.75rem;">
                                {foreach $tlds as $tld}
                                    <option{if in_array($tld, $selectedTlds)} selected {if count($selectedTlds) <= 1}disabled="disabled"{/if}{/if} value="{$tld}">{$tld}</option>
                                {/foreach}
                            </select>
                            <select name="maxLength" class="multiselect" data-placeholder="{lang key='domainSearch.maxLength'}" style="width: 100%; padding: 0.75rem; border: 1px solid var(--gray-300, #d1d5db); border-radius: 0.5rem; margin-top: 0.75rem;">
                                {foreach $searchLengths as $len}
                                    <option value="{$len}" {if $maxLength === $len}selected{/if}>{$len}</option>
                                {/foreach}
                            </select>
                            <label style="display: flex; align-items: center; margin-top: 1rem; color: var(--gray-700, #374151); cursor: pointer;">
                                <input type="checkbox" class="no-icheck" name="filter" {if $safeSearchSelected}checked{/if} style="margin-right: 0.5rem; width: 1.125rem; height: 1.125rem; border-radius: 0.25rem; border: 1px solid var(--gray-300, #d1d5db);">
                                {lang key="domainSearch.safeSearch"}
                            </label>
                        {else}
                            <input type="text" 
                                   class="form-control" 
                                   name="domain" 
                                   placeholder="{lang key="exampledomain"}" 
                                   autocapitalize="none"
                                   style="height: 3.5rem; border: 1px solid var(--gray-300, #d1d5db); border-radius: 0.75rem 0 0 0.75rem; padding: 1rem 1.5rem; font-size: 1.125rem; border-right: none;">
                        {/if}
                            <span class="input-group-append d-none d-sm-block">
                                {if $registerdomainenabled}
                                    <button type="submit" class="btn btn-primary{$captcha->getButtonClass($captchaForm)}" id="btnDomainSearch" style="height: 3.5rem; padding: 0 2rem; background: linear-gradient(135deg, var(--primary-600, #2563eb) 0%, var(--primary-700, #1d4ed8) 100%); border: none; color: white; font-weight: 600; font-size: 1rem; border-radius: 0 0.75rem 0.75rem 0; cursor: pointer; transition: all 0.2s;">
                                        {lang key="search"}{if $showAdvancedSearchOptions}  <i class="fa-regular fa-sparkles"></i>{/if}
                                    </button>
                                {/if}
                                {if $transferdomainenabled}
                                    <button type="submit" id="btnTransfer" data-domain-action="transfer" class="btn btn-success{$captcha->getButtonClass($captchaForm)}" style="height: 3.5rem; padding: 0 2rem; background: linear-gradient(135deg, #10b981 0%, #059669 100%); border: none; color: white; font-weight: 600; font-size: 1rem; border-radius: 0 0.75rem 0.75rem 0; cursor: pointer; margin-left: 0.5rem; transition: all 0.2s;">
                                        {lang key="domainstransfer"}
                                    </button>
                                {/if}
                            </span>
                    </div>
                </div>
                <div class="row d-sm-none" style="margin-top: 1rem;">
                    {if $registerdomainenabled}
                        <div class="col-6">
                            <button type="submit" class="btn btn-primary{$captcha->getButtonClass($captchaForm)} btn-block" id="btnDomainSearch2" style="width: 100%; padding: 0.75rem; background: linear-gradient(135deg, var(--primary-600, #2563eb) 0%, var(--primary-700, #1d4ed8) 100%); border: none; color: white; font-weight: 600; border-radius: 0.5rem;">
                                {lang key="search"}{if $showAdvancedSearchOptions}  <i class="fa-regular fa-sparkles"></i>{/if}
                            </button>
                        </div>
                    {/if}
                    {if $transferdomainenabled}
                        <div class="col-6">
                            <button type="submit" id="btnTransfer2" data-domain-action="transfer" class="btn btn-success{$captcha->getButtonClass($captchaForm)} btn-block" style="width: 100%; padding: 0.75rem; background: linear-gradient(135deg, #10b981 0%, #059669 100%); border: none; color: white; font-weight: 600; border-radius: 0.5rem;">
                                {lang key="domainstransfer"}
                            </button>
                        </div>
                    {/if}
                </div>
                {include file="$template/includes/captcha.tpl"}

                {if $featuredTlds}
                    <ul class="tld-logos" style="display: flex; justify-content: center; gap: 2rem; margin-top: 2.5rem; list-style: none; padding: 0; flex-wrap: wrap;">
                        {foreach $featuredTlds as $num => $tldinfo}
                            {if $num < 3}
                                <li style="text-align: center; padding: 1rem; background: white; border-radius: 0.75rem; border: 1px solid var(--gray-200, #e5e7eb); min-width: 150px;">
                                    <img src="{$BASE_PATH_IMG}/tld_logos/{$tldinfo.tldNoDots}.png" alt="{$tldinfo.tld}" style="height: 2rem; margin-bottom: 0.75rem;">
                                    <div style="font-weight: 600; color: var(--primary-600, #2563eb); font-size: 1.125rem;">
                                        {if is_object($tldinfo.register)}
                                            {$tldinfo.register->toFull()}
                                        {else}
                                            {lang key="domainregnotavailable"}
                                        {/if}
                                    </div>
                                </li>
                            {/if}
                        {/foreach}
                    </ul>
                {/if}

                <a href="{routePath('domain-pricing')}" class="btn btn-link btn-sm float-right" style="margin-top: 1.5rem; color: var(--primary-600, #2563eb); text-decoration: none; font-weight: 500; transition: color 0.2s;">{lang key='viewAllPricing'}</a>
            </div>
        </div>
    </div>
</form>

{if $showAdvancedSearchOptions}
<script>
    $(document).ready(function() {
        jQuery('#frmDomainHomepage .multiselect').each(function () {
            const enableFiltering = $(this).hasClass('multiselect-filter');
            const minSelection = jQuery(this).data('min-selection');
            $(this).multiselect({
                onChange: function (element) {
                    const closestSelect = element.closest('select');
                    const selectedOptions = closestSelect.find('option:selected');
                    if (minSelection === undefined) {
                        return;
                    }
                    const atMinOptions = selectedOptions.length <= minSelection;
                    const targetOptions = atMinOptions ? selectedOptions : closestSelect.find('option');
                    targetOptions.each(function () {
                        const inputElement = jQuery('input[value="' + jQuery(this).val() + '"]');
                        inputElement.prop('disabled', atMinOptions ? 'disabled' : false);
                    });
                },
                buttonText: function(options, select) {
                    return select.data('placeholder');
                },
                maxHeight: 200,
                includeFilterClearBtn: false,
                enableCaseInsensitiveFiltering: enableFiltering,
            });
        })
    });
</script>
{/if}

<style>
/* VENOM CODES Domain Search Button Hover Effects */
#btnDomainSearch:hover,
#btnDomainSearch2:hover {
    background: linear-gradient(135deg, var(--primary-700, #1d4ed8) 0%, var(--primary-800, #1e40af) 100%) !important;
    transform: translateY(-2px);
    box-shadow: 0 10px 15px -3px rgba(37, 99, 235, 0.3);
}
#btnTransfer:hover,
#btnTransfer2:hover {
    background: linear-gradient(135deg, #059669 0%, #047857 100%) !important;
    transform: translateY(-2px);
    box-shadow: 0 10px 15px -3px rgba(16, 185, 129, 0.3);
}
</style>
