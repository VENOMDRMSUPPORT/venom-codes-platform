{* VENOM CODES — Social Media Accounts Component *}

{foreach $socialAccounts as $account}
    <li class="list-inline-item" style="display: inline-block; margin-right: 0.5rem;">
        <a class="btn btn-icon mb-1" 
           href="{$account->getUrl()}" 
           target="_blank"
           style="display: inline-flex; align-items: center; justify-content: center; width: 2.5rem; height: 2.5rem; border-radius: 0.5rem; border: 1px solid var(--gray-300, #d1d5db); background: white; color: var(--gray-600, #4b5563); transition: all 0.2s; text-decoration: none;">
            <i class="{$account->getFontAwesomeIcon()}" style="font-size: 1.125rem;"></i>
        </a>
    </li>
{/foreach}

<style>
/* VENOM CODES Social Account Button Hover Effects */
.btn-icon:hover {
    background: var(--gray-50, #f9fafb) !important;
    border-color: var(--gray-400, #9ca3af) !important;
    transform: translateY(-2px);
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
}
</style>
