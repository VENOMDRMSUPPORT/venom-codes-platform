{* VENOM CODES — Service Cancellation Request *}

{assign var="page_title" value="Request Cancellation"}
{assign var="breadcrumbs" value=[["label" => "Services", "href" => "{$WEB_ROOT}/clientarea.php?action=products"], ["label" => $groupname|cat:" - "|cat:$product, "href" => "{$WEB_ROOT}/clientarea.php?action=productdetails&id={$id}"], ["label" => "Cancel"]]}
{include file="$template/includes/client/pageheader.tpl"}

<div style="max-width: 40rem;">

  {if $cancellationRequestAlreadyExists}
    {include file="$template/includes/client/alert.tpl" alert_type="info" alert_title="Cancellation Pending" alert_content="A cancellation request for this service is already pending."}
  {else}

    {assign var="form_title" value="Cancellation Details"}
    {assign var="form_description" value="Please let us know why you'd like to cancel this service"}

    {capture assign="form_content"}
    <form method="post" action="{$smarty.server.PHP_SELF}?action=cancel" id="frmCancelRequest">
      <input type="hidden" name="id" value="{$id}" />
      <input type="hidden" name="token" value="{$token}" />

      <div style="display: flex; flex-direction: column; gap: 1.25rem;">
        {* Service info *}
        <div style="padding: 0.75rem; border-radius: 0.5rem; background: hsl(var(--muted) / 0.3); border: 1px solid hsl(var(--border));">
          <p style="font-size: 0.875rem; font-weight: 500;">{$groupname} - {$product}</p>
          {if $domain}<p class="text-xs text-muted-foreground" style="margin-top: 0.25rem;">{$domain}</p>{/if}
        </div>

        {* Cancellation type *}
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Cancellation Type</label>
          <select name="type" class="venom-input">
            <option value="Immediate">{lang key='cancellationimmediate'}</option>
            <option value="End of Billing Period">{lang key='cancellationendofbillingperiod'}</option>
          </select>
        </div>

        {* Reason *}
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Reason for Cancellation</label>
          <textarea name="reason" class="venom-input" rows="4" placeholder="Please let us know how we could improve…" style="resize: vertical;"></textarea>
        </div>

        <div style="display: flex; justify-content: flex-end; gap: 0.5rem;">
          <a href="{$WEB_ROOT}/clientarea.php?action=productdetails&id={$id}" class="venom-btn-secondary text-sm" style="padding: 0.625rem 1.25rem;">Cancel</a>
          <button type="submit" name="submit" class="venom-btn-primary text-sm" style="padding: 0.625rem 1.25rem; background: hsl(var(--destructive)); color: hsl(var(--destructive-foreground));">
            Request Cancellation
          </button>
        </div>
      </div>
    </form>
    {/capture}

    {include file="$template/includes/client/formsection.tpl" form_title=$form_title form_description=$form_description form_content=$form_content}

  {/if}

</div>