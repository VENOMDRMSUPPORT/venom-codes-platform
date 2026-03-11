# Premium UI Checklist

Use this for final review or before shipping a UI change.

## Design-system compliance
- No hardcoded colors in changed UI files.
- No inline styles.
- No duplicate border/card/button system.
- Existing tokens and classes were reused before new ones were created.
- Any new token or class has a clear rationale and naming consistency.

## Theme parity
- Dark and light both look intentional.
- Accent color appears in the right places without harming readability.
- No missing borders, invisible text, or white leaks.

## UX and trust
- CTA labels match destinations.
- Support/contact actions are honest.
- Error and empty states remain clear.
- Content still sounds technical and trustworthy.

## Accessibility
- Focus-visible states remain present.
- Interactive elements remain comfortably clickable.
- Keyboard navigation is not broken.
- Motion-heavy effects respect reduced-motion if touched.

## Responsive
- 375px works.
- 768px works.
- 1024px works.
- No overflow, clipping, or accidental horizontal scroll.
