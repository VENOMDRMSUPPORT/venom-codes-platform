<footer class="venom-main-footer">
    <div class="venom-shell">
        <div class="venom-footer-grid">
            <div class="venom-footer-brand">
                {include file="$template/includes/venom/logo.tpl" href="{$WEB_ROOT}/index.php"}
                <p>
                    Professional backend solutions for streaming enterprises. We simplify the complexity of server orchestration.
                </p>
            </div>

            <div>
                <h4>Quick Links</h4>
                <ul>
                    <li><a href="#">Installation Guide</a></li>
                    <li><a href="#">API Documentation</a></li>
                    <li><a href="#">Terms of Service</a></li>
                </ul>
            </div>

            <div>
                <h4>Connectivity</h4>
                <ul>
                    <li><a href="#">Telegram Channel</a></li>
                    <li><a href="#">Discord Server</a></li>
                    <li><a href="#">Support Portal</a></li>
                </ul>
            </div>
        </div>

        <div class="venom-disclaimer">
            <p>
                <strong>Legal Disclaimer:</strong> VENOM CODES is a software development firm. We do not provide any IPTV content, playlists, streams, or subscription services. We provide server management software only. Users are responsible for the content they host or distribute through their own infrastructure.
            </p>
        </div>

        <div class="venom-footer-meta d-flex flex-column flex-md-row align-items-center justify-content-between mt-4">
            <p class="venom-copyright mb-md-0 mt-0">© {$date_year} VENOM CODES. Crafted with <span class="venom-heart" aria-hidden="true">❤</span> for resilient streaming infrastructure.</p>
            
            {if $languagechangeenabled && count($locales) > 1 || $currencies}
                <div class="venom-lang-chooser mt-3 mt-md-0">
                    <button type="button" class="venom-btn venom-btn--ghost btn-sm" data-toggle="modal" data-target="#modalChooseLanguage" style="min-height: 2.2rem; padding: 0.3rem 0.8rem; font-size: 0.75rem;">
                        <div class="d-inline-block align-middle mr-2">
                            <div class="iti-flag {if $activeLocale.countryCode === '001'}us{else}{$activeLocale.countryCode|lower}{/if}" style="transform: scale(0.85); box-shadow: 0 0 3px rgba(0,0,0,0.3);"></div>
                        </div>
                        {$activeLocale.localisedName}
                        {if $activeCurrency} / {$activeCurrency.prefix} {$activeCurrency.code}{/if}
                    </button>
                </div>
            {/if}
        </div>
    </div>
</footer>
