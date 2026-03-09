/**
 * VENOM CODES — Theme Switcher
 * Handles dark/light mode toggle + 5 accent color presets.
 * Vanilla JS — no framework dependency.
 * Persistence via localStorage.
 */
(function () {
  'use strict';

  var STORAGE_MODE = 'venom-theme-mode';
  var STORAGE_ACCENT = 'venom-accent-color';
  var doc = document.documentElement;

  // ── Initialize on load ──
  function init() {
    var savedMode = localStorage.getItem(STORAGE_MODE);
    var savedAccent = localStorage.getItem(STORAGE_ACCENT);

    if (savedMode === 'dark') {
      doc.classList.add('dark');
    } else {
      doc.classList.remove('dark');
    }

    if (savedAccent) {
      doc.setAttribute('data-accent', savedAccent);
    }
  }

  // ── Toggle dark/light ──
  function toggleMode() {
    var isDark = doc.classList.contains('dark');
    if (isDark) {
      doc.classList.remove('dark');
      localStorage.setItem(STORAGE_MODE, 'light');
    } else {
      doc.classList.add('dark');
      localStorage.setItem(STORAGE_MODE, 'dark');
    }
    updateModeIcon();
  }

  // ── Set accent color ──
  function setAccent(accent) {
    doc.setAttribute('data-accent', accent);
    localStorage.setItem(STORAGE_ACCENT, accent);
    updateAccentIndicator(accent);
  }

  // ── Update mode toggle icon ──
  function updateModeIcon() {
    var isDark = doc.classList.contains('dark');
    var sunIcon = document.getElementById('theme-icon-sun');
    var moonIcon = document.getElementById('theme-icon-moon');
    if (sunIcon && moonIcon) {
      sunIcon.style.display = isDark ? 'block' : 'none';
      moonIcon.style.display = isDark ? 'none' : 'block';
    }
  }

  // ── Update accent indicator ring ──
  function updateAccentIndicator(activeKey) {
    var buttons = document.querySelectorAll('[data-accent-btn]');
    buttons.forEach(function (btn) {
      var key = btn.getAttribute('data-accent-btn');
      if (key === activeKey) {
        btn.classList.add('ring-2', 'ring-offset-2', 'scale-125');
      } else {
        btn.classList.remove('ring-2', 'ring-offset-2', 'scale-125');
      }
    });
  }

  // ── Accent dropdown toggle ──
  function toggleAccentDropdown() {
    var dropdown = document.getElementById('accent-dropdown');
    if (dropdown) {
      dropdown.classList.toggle('hidden');
    }
  }

  // Close dropdown on outside click
  document.addEventListener('mousedown', function (e) {
    var dropdown = document.getElementById('accent-dropdown');
    var trigger = document.getElementById('accent-trigger');
    if (dropdown && trigger && !dropdown.contains(e.target) && !trigger.contains(e.target)) {
      dropdown.classList.add('hidden');
    }
  });

  // ── Expose globally ──
  window.VenomTheme = {
    toggleMode: toggleMode,
    setAccent: setAccent,
    toggleAccentDropdown: toggleAccentDropdown,
    init: init,
  };

  // Auto-init
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', function () {
      init();
      updateModeIcon();
    });
  } else {
    init();
    updateModeIcon();
  }
})();
