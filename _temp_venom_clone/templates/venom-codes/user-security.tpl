{* VENOM CODES — User Security Settings *}

{assign var="page_title" value="Security Settings"}
{assign var="breadcrumbs" value=[["label" => "Account Settings"], ["label" => "Security"]]}
{include file="$template/includes/client/pageheader.tpl"}

<div style="display: flex; flex-direction: column; gap: 1.5rem;">

  {* Two-Factor Authentication *}
  <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
    <div style="border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
      <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600;">Two-Factor Authentication</h3>
      <p class="text-muted-foreground" style="margin-top: 0.125rem; font-size: 0.75rem;">Add an extra layer of security to your account</p>
    </div>
    <div style="padding: 1.25rem;">
      <div style="display: flex; align-items: center; justify-content: space-between;">
        <div style="display: flex; align-items: center; gap: 0.75rem;">
          <div style="display: flex; height: 2.5rem; width: 2.5rem; align-items: center; justify-content: center; border-radius: 0.5rem; background: hsl(var(--primary) / 0.1); color: hsl(var(--primary));">
            <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
          </div>
          <div>
            <p style="font-size: 0.875rem; font-weight: 600;">
              {if $twofaenabled}Enabled{else}Disabled{/if}
            </p>
            <p class="text-xs text-muted-foreground">
              {if $twofaenabled}Your account is protected with 2FA{else}We recommend enabling 2FA for extra security{/if}
            </p>
          </div>
        </div>
        {if $twofaenabled}
          <a href="{$WEB_ROOT}/clientarea.php?action=security&disable=true" class="venom-btn-secondary text-sm" style="padding: 0.5rem 1rem;">Disable</a>
        {else}
          <a href="{$WEB_ROOT}/clientarea.php?action=security&enable=true" class="venom-btn-primary text-sm" style="padding: 0.5rem 1rem;">Enable</a>
        {/if}
      </div>
    </div>
  </div>

  {* Active Sessions *}
  {if $sessions}
    <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
      <div style="border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
        <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600;">Active Sessions</h3>
        <p class="text-muted-foreground" style="margin-top: 0.125rem; font-size: 0.75rem;">Manage your active login sessions</p>
      </div>
      <div>
        {foreach $sessions as $session}
          <div style="display: flex; align-items: center; justify-content: space-between; padding: 0.875rem 1.25rem; {if !$session@last}border-bottom: 1px solid hsl(var(--border));{/if}">
            <div>
              <p style="font-size: 0.875rem; font-weight: 500;">{$session.ipaddress}</p>
              <p class="text-xs text-muted-foreground">{$session.lastactive} {if $session.current}· <span class="text-primary" style="font-weight: 600;">Current session</span>{/if}</p>
            </div>
            {if !$session.current}
              <a href="{$WEB_ROOT}/clientarea.php?action=security&revoke={$session.id}" class="text-xs" style="color: hsl(var(--destructive)); text-decoration: none; font-weight: 500;">Revoke</a>
            {/if}
          </div>
        {/foreach}
      </div>
    </div>
  {/if}

  {* Security Question *}
  {if $securityquestions}
    {assign var="sq_title" value="Security Question"}
    {assign var="sq_description" value="Used for account recovery"}
    {capture assign="sq_content"}
    <form method="post" action="{$systemurl}account/security" style="display: flex; flex-direction: column; gap: 1rem;">
      <input type="hidden" name="token" value="{$token}" />
      <div>
        <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Question</label>
        <select name="securityqid" class="venom-input">
          {foreach $securityquestions as $question}
            <option value="{$question.id}" {if $question.id == $securityqid}selected{/if}>{$question.question}</option>
          {/foreach}
        </select>
      </div>
      <div>
        <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Answer</label>
        <input type="text" name="securityqans" class="venom-input" placeholder="Your answer" value="{$securityqans}" />
      </div>
      <div style="display: flex; justify-content: flex-end;">
        <button type="submit" class="venom-btn-primary text-sm" style="padding: 0.625rem 1.25rem;">Save</button>
      </div>
    </form>
    {/capture}
    {include file="$template/includes/client/formsection.tpl" form_title=$sq_title form_description=$sq_description form_content=$sq_content}
  {/if}

</div>