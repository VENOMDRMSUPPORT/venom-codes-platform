{include file="$template/includes/flashmessage.tpl"}

{assign var="totalUsers" value=$users->count()}
{assign var="pendingInvites" value=$invites->count()}
{assign var="ownerUsers" value=0}
{assign var="twoFactorUsers" value=0}

{foreach $users as $user}
    {if $user->pivot->owner}
        {assign var="ownerUsers" value=$ownerUsers+1}
    {/if}
    {if $user->hasTwoFactorAuthEnabled()}
        {assign var="twoFactorUsers" value=$twoFactorUsers+1}
    {/if}
{/foreach}

<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">Account Security</span>
            <h1 class="h3 font-weight-bold mb-2">{lang key="navUserManagement"}</h1>
            <p class="text-muted mb-0">Control user access, invite collaborators, and govern permission boundaries for infrastructure operations.</p>
        </div>
        <div class="col-12 col-lg-4">
            <div class="d-flex flex-wrap justify-content-lg-end">
                <a href="clientarea.php?action=details" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-id-card fa-fw"></i>
                    Profile
                </a>
                <a href="{routePath('account-contacts')}" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-address-book fa-fw"></i>
                    Contacts
                </a>
                <a href="{routePath('user-security')}" class="btn btn-default btn-sm mb-2">
                    <i class="fas fa-shield-alt fa-fw"></i>
                    Security
                </a>
            </div>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-12 col-sm-6 col-lg-3 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Active Users</h3>
                <i class="fas fa-users text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$totalUsers}</p>
            <p class="small text-muted mb-0">{lang key="userManagement.usersFound" count=$users->count()}</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-3 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Owners</h3>
                <span class="label status status-paid">Owner</span>
            </div>
            <p class="h4 font-weight-bold mb-1">{$ownerUsers}</p>
            <p class="small text-muted mb-0">Account-owner identities with full permission scope.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-3 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">2FA Enabled</h3>
                <i class="fas fa-user-shield text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$twoFactorUsers}</p>
            <p class="small text-muted mb-0">Users currently protected by two-factor authentication.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-3 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Pending Invites</h3>
                <span class="label status status-pending">Pending</span>
            </div>
            <p class="h4 font-weight-bold mb-1">{$pendingInvites}</p>
            <p class="small text-muted mb-0">Invitations awaiting acceptance and account access activation.</p>
        </div>
    </div>
</div>

<div class="card mb-4">
    <div class="card-header d-flex flex-column flex-lg-row align-items-lg-center justify-content-lg-between">
        <h3 class="card-title m-0 mb-3 mb-lg-0">
            <i class="fas fa-user-lock"></i>
            User Access Matrix
        </h3>
        <small class="text-muted">{lang key="userManagement.usersFound" count=$users->count()}</small>
    </div>
    <div class="card-body p-0">
        <div class="table-container clearfix mb-0">
            <table class="table table-list mb-0">
                <thead>
                    <tr>
                        <th>{lang key="userManagement.emailAddress"} / {lang key="userManagement.lastLogin"}</th>
                        <th width="300">{lang key="userManagement.actions"}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $users as $user}
                        <tr>
                            <td>
                                <strong>{$user->email}</strong>
                                {if $user->pivot->owner}
                                    <span class="label status status-paid ml-2">{lang key="clientOwner"}</span>
                                {/if}
                                {if $user->hasTwoFactorAuthEnabled()}
                                    <i class="fas fa-shield text-success ml-1" data-toggle="tooltip" data-placement="auto right" title="{lang key='twoFactor.enabled'}"></i>
                                {else}
                                    <i class="fas fa-shield text-grey ml-1" data-toggle="tooltip" data-placement="auto right" title="{lang key='twoFactor.disabled'}"></i>
                                {/if}
                                <br>
                                <small>
                                    {lang key="userManagement.lastLogin"}:
                                    {if $user->pivot->hasLastLogin()}
                                        {$user->pivot->getLastLogin()->diffForHumans()}
                                    {else}
                                        {lang key='never'}
                                    {/if}
                                </small>
                            </td>
                            <td>
                                <a href="{routePath('account-users-permissions', $user->id)}" class="btn btn-default btn-sm btn-manage-permissions{if $user->pivot->owner} disabled{/if}">
                                    {lang key="userManagement.managePermissions"}
                                </a>
                                <a href="#" class="btn btn-danger btn-sm btn-remove-user{if $user->pivot->owner} disabled{/if}" data-id="{$user->id}">
                                    {lang key="userManagement.removeAccess"}
                                </a>
                            </td>
                        </tr>
                    {/foreach}
                    {if $invites->count() > 0}
                        <tr>
                            <td colspan="2">
                                <strong>{lang key="userManagement.pendingInvites"}</strong>
                            </td>
                        </tr>
                        {foreach $invites as $invite}
                            <tr>
                                <td>
                                    <strong>{$invite->email}</strong>
                                    <br>
                                    <small>
                                        {lang key="userManagement.inviteSent"}:
                                        {$invite->created_at->diffForHumans()}
                                    </small>
                                </td>
                                <td>
                                    <form method="post" action="{routePath('account-users-invite-resend')}">
                                        <input type="hidden" name="inviteid" value="{$invite->id}">
                                        <button type="submit" class="btn btn-default btn-sm">
                                            {lang key="userManagement.resendInvite"}
                                        </button>
                                        <button type="button" class="btn btn-default btn-sm btn-cancel-invite" data-id="{$invite->id}">
                                            {lang key="userManagement.cancelInvite"}
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        {/foreach}
                    {/if}
                </tbody>
            </table>
        </div>
    </div>
    <div class="card-footer">
        <p class="text-muted m-0">* {lang key="userManagement.accountOwnerPermissionsInfo"}</p>
    </div>
</div>

<div class="card mb-4">
    <div class="card-header">
        <h3 class="card-title m-0">{lang key="userManagement.inviteNewUser"}</h3>
    </div>
    <div class="card-body">
        <p>{lang key="userManagement.inviteNewUserDescription"}</p>

        <form method="post" action="{routePath('account-users-invite')}">
            <div class="form-group">
                <input type="email" name="inviteemail" placeholder="name@example.com" class="form-control" value="{$formdata.inviteemail}">
            </div>
            <div class="form-group">
                <label class="form-check form-check-inline">
                    <input type="radio" class="form-check-input" name="permissions" value="all" checked="checked">
                    {lang key="userManagement.allPermissions"}
                </label>
                <label class="form-check form-check-inline">
                    <input type="radio" class="form-check-input" name="permissions" value="choose">
                    {lang key="userManagement.choosePermissions"}
                </label>
            </div>
            <div class="well mb-3 w-hidden" id="invitePermissions">
                {foreach $permissions as $permission}
                    <label class="form-check form-check-inline">
                        <input type="checkbox" class="form-check-input" name="perms[{$permission.key}]" value="1">
                        {$permission.title}
                        <span class="d-none d-md-inline">-</span>
                        <br class="d-md-none">
                        <span class="text-muted">{$permission.description}</span>
                    </label>
                    <br>
                {/foreach}
            </div>
            <button type="submit" class="btn btn-primary">
                {lang key="userManagement.sendInvite"}
            </button>
        </form>

    </div>
</div>

<form method="post" action="{routePath('user-accounts')}">
    <input type="hidden" name="id" value="" id="inputSwitchAcctId">
</form>

<form method="post" action="{routePath('account-users-remove')}">
    <input type="hidden" name="userid" id="inputRemoveUserId">
    <div class="modal fade" id="modalRemoveUser">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header card-header bg-primary text-light">
                    <h4 class="modal-title">
                        {lang key="userManagement.removeAccess"}
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <p>{lang key="userManagement.removeAccessSure"}</p>
                    <p>{lang key="userManagement.removeAccessInfo"}</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        {lang key="cancel"}
                    </button>
                    <button type="submit" class="btn btn-primary" id="btnRemoveUserConfirm">
                        {lang key="confirm"}
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>

<form method="post" action="{routePath('account-users-invite-cancel')}">
    <input type="hidden" name="inviteid" id="inputCancelInviteId">
    <div class="modal fade" id="modalCancelInvite">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header card-header bg-primary text-light">
                    <h4 class="modal-title">
                        {lang key="userManagement.cancelInvite"}
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <p>{lang key="userManagement.cancelInviteSure"}</p>
                    <p>{lang key="userManagement.cancelInviteInfo"}</p>
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

<script>
    jQuery(document).ready(function() {
        jQuery('input:radio[name=permissions]').change(function () {
            if (this.value === 'choose') {
                jQuery('#invitePermissions').slideDown();
            } else {
                jQuery('#invitePermissions').slideUp();
            }
        });
        jQuery('.btn-manage-permissions').click(function(e) {
            if (jQuery(this).attr('disabled')) {
                e.preventDefault();
            }
        });
        jQuery('.btn-remove-user').click(function(e) {
            e.preventDefault();
            if (jQuery(this).attr('disabled')) {
                return;
            }
            jQuery('#inputRemoveUserId').val(jQuery(this).data('id'));
            jQuery('#modalRemoveUser').modal('show');
        });
        jQuery('.btn-cancel-invite').click(function(e) {
            e.preventDefault();
            jQuery('#inputCancelInviteId').val(jQuery(this).data('id'));
            jQuery('#modalCancelInvite').modal('show');
        });
    });
</script>
