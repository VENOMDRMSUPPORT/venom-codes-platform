/**
 * VENOM CODES — Client Area Tabs
 * Generic tab switcher for detail/billing pages.
 */
(function () {
  'use strict';

  document.addEventListener('click', function (e) {
    var trigger = e.target.closest('[data-tab-trigger]');
    if (!trigger) return;

    var container = trigger.closest('[data-tabs]');
    if (!container) return;

    var targetId = trigger.getAttribute('data-tab-trigger');

    // Update triggers
    container.querySelectorAll('[data-tab-trigger]').forEach(function (t) {
      t.classList.remove('text-primary');
      t.classList.add('text-muted-foreground');
      var indicator = t.querySelector('[data-tab-indicator]');
      if (indicator) indicator.classList.add('hidden');
    });

    trigger.classList.remove('text-muted-foreground');
    trigger.classList.add('text-primary');
    var activeIndicator = trigger.querySelector('[data-tab-indicator]');
    if (activeIndicator) activeIndicator.classList.remove('hidden');

    // Update panels
    container.querySelectorAll('[data-tab-panel]').forEach(function (p) {
      p.classList.add('hidden');
    });
    var panel = container.querySelector('[data-tab-panel="' + targetId + '"]');
    if (panel) panel.classList.remove('hidden');
  });
})();
