{* VENOM CODES — Network Issues Notifications Component *}

{if $openNetworkIssueCounts.open > 0}
    <div class="alert alert-warning network-issue-alert m-0" style="background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%); border: none; border-radius: 0; padding: 1rem 0; margin: 0;">
        <div class="container" style="display: flex; align-items: center; justify-content: space-between; gap: 1rem; flex-wrap: wrap;">
            <div style="display: flex; align-items: center; gap: 0.75rem; color: #92400e;">
                <i class="fas fa-exclamation-triangle fa-fw" style="font-size: 1.25rem;"></i>
                <span style="font-weight: 500;">{lang key='networkIssuesAware'}</span>
            </div>
            <a href="{$WEB_ROOT}/serverstatus.php" class="alert-link" style="color: #92400e; font-weight: 600; text-decoration: none; display: flex; align-items: center; gap: 0.5rem; transition: all 0.2s;">
                {lang key='learnmore'}
                <i class="far fa-arrow-right" style="transition: transform 0.2s;"></i>
            </a>
        </div>
    </div>
{elseif $openNetworkIssueCounts.scheduled > 0}
    <div class="alert alert-info network-issue-alert m-0" style="background: linear-gradient(135deg, #dbeafe 0%, #bfdbfe 100%); border: none; border-radius: 0; padding: 1rem 0; margin: 0;">
        <div class="container" style="display: flex; align-items: center; justify-content: space-between; gap: 1rem; flex-wrap: wrap;">
            <div style="display: flex; align-items: center; gap: 0.75rem; color: #1e3a8a;">
                <i class="fas fa-info-circle fa-fw" style="font-size: 1.25rem;"></i>
                <span style="font-weight: 500;">{lang key='networkIssuesScheduled'}</span>
            </div>
            <a href="{$WEB_ROOT}/serverstatus.php" class="alert-link" style="color: #1e3a8a; font-weight: 600; text-decoration: none; display: flex; align-items: center; gap: 0.5rem; transition: all 0.2s;">
                {lang key='learnmore'}
                <i class="far fa-arrow-right" style="transition: transform 0.2s;"></i>
            </a>
        </div>
    </div>
{/if}

<style>
/* VENOM CODES Network Issue Alert Hover Effects */
.network-issue-alert .alert-link:hover {
    opacity: 0.8;
}
.network-issue-alert .alert-link:hover i {
    transform: translateX(3px);
}
</style>
