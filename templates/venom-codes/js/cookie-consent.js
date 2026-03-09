/**
 * VENOM CODES — Cookie Consent Banner
 * Shows after 1.5s if no consent stored. Vanilla JS.
 */
(function () {
  'use strict';

  var STORAGE_KEY = 'venom-cookie-consent';

  function show() {
    var el = document.getElementById('cookie-consent');
    if (el) {
      el.classList.remove('translate-y-full', 'opacity-0', 'pointer-events-none');
      el.classList.add('translate-y-0', 'opacity-100');
    }
  }

  function hide() {
    var el = document.getElementById('cookie-consent');
    if (el) {
      el.classList.add('translate-y-full', 'opacity-0', 'pointer-events-none');
      el.classList.remove('translate-y-0', 'opacity-100');
    }
  }

  window.VenomCookie = {
    accept: function () {
      localStorage.setItem(STORAGE_KEY, 'accepted');
      hide();
    },
    decline: function () {
      localStorage.setItem(STORAGE_KEY, 'declined');
      hide();
    },
  };

  function init() {
    var consent = localStorage.getItem(STORAGE_KEY);
    if (!consent) {
      setTimeout(show, 1500);
    }
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
