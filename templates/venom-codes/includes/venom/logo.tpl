{* Venom logo: SVG + Venom Solutions + Powering IPTV Infrastructure
   Params: href, showSlogan, showText, mobileWord, compact *}
{if isset($href) && $href}
    {assign var="logoHref" value=$href}
{else}
    {assign var="logoHref" value="{$WEB_ROOT}/index.php"}
{/if}
{if isset($showSlogan)}
    {assign var="logoShowSlogan" value=$showSlogan}
{else}
    {assign var="logoShowSlogan" value=true}
{/if}
{if isset($showText)}
    {assign var="logoShowText" value=$showText}
{else}
    {assign var="logoShowText" value=true}
{/if}
{if isset($mobileWord)}
    {assign var="logoMobileWord" value=$mobileWord}
{else}
    {assign var="logoMobileWord" value="Venom"}
{/if}
{if isset($compact)}
    {assign var="logoCompact" value=$compact}
{else}
    {assign var="logoCompact" value=false}
{/if}
{if isset($fullDisplay)}
    {assign var="logoFullDisplay" value=$fullDisplay}
{else}
    {assign var="logoFullDisplay" value=true}
{/if}
{if isset($extraClass)}
    {assign var="logoExtraClass" value=$extraClass}
{else}
    {assign var="logoExtraClass" value=""}
{/if}
<a class="navbar-brand vs-logo{if $logoCompact} vs-logo--compact{/if} {$logoExtraClass}" href="{$logoHref}" aria-label="{$companyname}">
    <div class="vs-logo-icon">
        <div class="vs-logo-icon-container">
            <svg class="vs-logo-svg" viewBox="0 0 42 42" fill="none" xmlns="http://www.w3.org/2000/svg">
                <circle class="vs-logo-glow-outer" cx="21" cy="21" r="20" stroke="var(--venom-accent)" stroke-width="0.5" stroke-dasharray="2 10" />
                <circle class="vs-logo-glow-inner" cx="21" cy="21" r="17" stroke="var(--venom-accent)" stroke-width="1" stroke-dasharray="15 30" />
                <path class="vs-logo-frame" d="M21 5L37 21L21 37L5 21L21 5Z" stroke-linecap="round" stroke-linejoin="round" />
                <text class="vs-logo-v" x="21" y="28.5" text-anchor="middle">V</text>
                <g class="vs-logo-dots">
                    <circle cx="4" cy="21" r="1" />
                    <circle cx="38" cy="21" r="1" />
                    <circle cx="21" cy="4" r="1" />
                    <circle cx="21" cy="38" r="1.5" />
                </g>
            </svg>
        </div>
    </div>
    {if $logoShowText}
        <div class="vs-logo-content">
            <div class="vs-logo-text">
                <span class="vs-venom">Venom</span>
                <span class="vs-solutions">Solutions</span>
            </div>
            {if $logoShowSlogan}
                <div class="vs-logo-slogan">Powering IPTV Infrastructure</div>
            {/if}
        </div>
    {/if}
</a>
