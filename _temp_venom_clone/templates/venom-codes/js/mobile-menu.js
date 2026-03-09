/**
 * VENOM CODES — Mobile Menu Toggle
 * Handles hamburger/close toggle for mobile navigation.
 */
(function () {
  'use strict';

  function init() {
    var toggle = document.getElementById('mobile-menu-toggle');
    var menu = document.getElementById('mobile-menu');
    var iconOpen = document.getElementById('mobile-icon-open');
    var iconClose = document.getElementById('mobile-icon-close');

    if (!toggle || !menu) return;

    toggle.addEventListener('click', function () {
      var isHidden = menu.classList.contains('hidden');
      if (isHidden) {
        menu.classList.remove('hidden');
        if (iconOpen) iconOpen.classList.add('hidden');
        if (iconClose) iconClose.classList.remove('hidden');
      } else {
        menu.classList.add('hidden');
        if (iconOpen) iconOpen.classList.remove('hidden');
        if (iconClose) iconClose.classList.add('hidden');
      }
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
