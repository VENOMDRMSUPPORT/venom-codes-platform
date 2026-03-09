{* VENOM CODES — Homepage (Landing Page)
   WHMCS: homepage.tpl
   Wrapper type: CONTENT-FRAGMENT (auto-wrapped by root header.tpl / footer.tpl)
   IMPORTANT: WHMCS automatically prepends header.tpl and appends footer.tpl.
   This file must NOT contain DOCTYPE, html, head, or body tags.
   header.tpl opens:  main > div.venom-container
   footer.tpl closes: /div > /main
   Since the landing page needs full-width sections, we close the wrapper
   opened by header.tpl, render our content, then re-open for footer.tpl. *}

{* — Override: collapse the empty wrapper opened by header.tpl on homepage — *}
<style>.page-main { min-height: 0 !important; padding: 0 !important; margin: 0 !important; display: none !important; }</style>
  </div>
</main>

{* ─── Landing Page Content (full-width) ─── *}

<main>
  {include file="$template/includes/landing/hero.tpl"}
  {include file="$template/includes/landing/truststrip.tpl"}
  {include file="$template/includes/landing/features.tpl"}
  {include file="$template/includes/landing/pricing.tpl"}
  {include file="$template/includes/landing/whychoose.tpl"}
  {include file="$template/includes/landing/faq.tpl"}
  {include file="$template/includes/landing/finalcta.tpl"}
</main>

{* — Re-open the wrapper that footer.tpl expects to close — *}
<main class="vs-flex-1">
  <div class="venom-container vs-container-pad-none">
