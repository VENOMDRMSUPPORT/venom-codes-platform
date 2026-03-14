# Venom Codes Premium WHMCS Theme Roadmap

Last updated: 2026-03-14
Audit mode: Repository facts only
Status vocabulary: `Verified` / `Partial` / `Not Verified`

## 1. Project Scope Lock

### Approved product summary
- Project name: `Venom Codes`
- Product: software-only licensing and access to a server management control panel for Streaming and IPTV infrastructure
- Content boundary: no relationship to any IPTV content, playlists, streams, or subscriptions
- Platform target: WHMCS v9.0 compatible Smarty `.tpl` theme

### Non-negotiable constraints
- Keep the order flow WHMCS-native: `cart -> checkout -> invoice/payment -> service delivery`
- Do not add extra claims, offers, or features outside the approved scope
- Normalize defaults to `data-venom-theme="light"`, `data-venom-accent="violet"`, and `lang="en"`
- Treat `templates/venom-codes/css/theme.css` as the global token/component system and `templates/venom-codes/css/custom.css` as the approved controlled override layer

### Copy/content restrictions
- Product positioning must stay software-only
- Copy must not imply that Venom Codes provides content, playlists, subscriptions, or managed media services
- Commercial naming, pricing, inclusions, and CTA language must be treated as governed content, not invented theme filler

### Implementation restrictions
- Theme work must stay inside the `templates/venom-codes` template layer
- Shared wrappers and shell behavior must preserve WHMCS behavior and routing
- New public/auth/client pages should continue using Smarty template structure and native WHMCS flows

## 2. Verified Repository Inventory

| Route/Page/Layer | File | Status | What is verifiably implemented | Notes / Risks |
| --- | --- | --- | --- | --- |
| Global public/auth/client shell entry | `templates/venom-codes/header.tpl` | Verified | Sets `lang="en"`, bootstraps `data-venom-theme` and `data-venom-accent`, classifies public/auth/client shells, includes `includes/venom/theme-controls.tpl` in non-client and client headers | Current runtime default is `light` + `violet`; this is aligned with target defaults |
| Global shell exit + shared footer/script load | `templates/venom-codes/footer.tpl` | Verified | Closes client/public wrappers, globally includes `includes/venom/main-footer.tpl`, loads `js/venom-homepage.js` | Shared script is loaded globally, so homepage behaviors are available outside the homepage when matching elements exist |
| Shared head + asset layer | `templates/venom-codes/includes/head.tpl` | Verified | Homepage bootstrap sets `data-venom-home`, runtime theme/accent values, loads `theme.css` and `custom.css`, defines locale fallback `en` | Current homepage default accent logic resolves to `violet`, not `ocean` |
| Auth shell wrapper | `templates/venom-codes/includes/authlayout.tpl` | Verified | Shared auth frame, brand slot, badge/title/subtitle/content/aside regions | Auth copy is infrastructure/software-focused and reuses the shared logo |
| Client shell header | `templates/venom-codes/includes/client/header.tpl` | Verified | Dedicated client header, workspace navigation, account state, global theme controls | Client shell exists as a distinct wrapper layer |
| Theme toggle / accent picker component | `templates/venom-codes/includes/venom/theme-controls.tpl` | Partial | Live theme toggle button plus five accent buttons are present | Static active accent markup is `ocean` while runtime defaults are `violet` |
| Shared logo component | `templates/venom-codes/includes/venom/logo.tpl` | Partial | SVG logo component with shared text/slogan is reused in header, auth, homepage, and footer | Uses `Venom Solutions` branding while the approved project name is `Venom Codes` |
| Homepage structure | `templates/venom-codes/includes/venom/homepage.tpl` | Partial | Announcement bar, public hero, architecture section, pricing cards, cookie card | Homepage contains hardcoded commercial copy, hardcoded pricing, non-native CTA buttons, and no verified jump-to-top element in this file |
| Shared main footer | `templates/venom-codes/includes/venom/main-footer.tpl` | Partial | Global footer, legal disclaimer, language/currency modal trigger, shared logo include | Placeholder `#` links remain; inline styles remain on footer controls; branding differs from logo text |
| Controlled design-system override layer | `templates/venom-codes/css/custom.css` | Verified | Contains public/auth/header/mobile/footer normalization, logo styling, theme-control refinements, auth-shell refinements, homepage mobile/footer overrides | `custom.css` is an active design-system layer and is approved by project context/baseline docs |
| Global theme/homepage runtime script | `templates/venom-codes/js/venom-homepage.js` | Verified | Controls theme toggle, accent switching, cookie notice, and jump-to-top behavior; stores theme/accent/cookie consent in `localStorage` | Runtime default accent is `violet`; jump-to-top support exists in JS but matching homepage markup was not found in the audited homepage include |
| Client shell wrapper | `templates/venom-codes/clientarea.tpl` | Verified | Provides shared client shell container, sidebar area, and content wrapper for client pages | Confirms dedicated client shell structure exists |
| Login page | `templates/venom-codes/login.tpl` | Verified | Uses `authlayout.tpl`, themed login form, remember-me, captcha, linked accounts, auth aside | CTA text includes `Create Account` and `Contact Team`; sales/governance wording still needs normalization |
| Register page | `templates/venom-codes/clientregister.tpl` | Partial | Wrapped auth/register experience using native WHMCS registration/order fields and password strength logic | Register flow is still close to native order/account creation; CTA/governance wording should be reviewed against native sales-flow rules |
| Password reset container | `templates/venom-codes/password-reset-container.tpl` | Verified | Shared password reset wrapper, error/success handling, inner-template dispatch | Uses auth shell consistently |
| Password reset email prompt | `templates/venom-codes/password-reset-email-prompt.tpl` | Verified | Themed email capture form and captcha handling | Aligned to auth shell structure |
| Password reset change prompt | `templates/venom-codes/password-reset-change-prompt.tpl` | Verified | Themed password reset form with strength meter | Aligned to auth shell structure |
| Client dashboard home | `templates/venom-codes/clientareahome.tpl` | Partial | Themed dashboard hero, KPIs, quick actions, status labels, cards, and module regions | Still mixes some legacy utility/highlight classes into the new shell |
| Services list | `templates/venom-codes/clientareaproducts.tpl` | Verified | Themed service/license list, status filters, fleet summary cards, native service links | Keeps WHMCS service routing intact |
| Product/service details | `templates/venom-codes/clientareaproductdetails.tpl` | Partial | Themed service hero, status cards, topology block, summary panel, upgrade/renew/cancel/support actions | Topology labels such as `EDGE A` / `EDGE B` are hardcoded presentation copy, not verified product governance |
| Invoice list | `templates/venom-codes/clientareainvoices.tpl` | Verified | Themed invoice ledger page, status filters, invoice routing, payment-method/account links | WHMCS invoice navigation remains intact |
| Invoice detail | `templates/venom-codes/viewinvoice.tpl` | Partial | Standalone invoice document includes themed KPI cards and preserved WHMCS payment/document logic | Loads `theme.css` but not `custom.css`, so parity with the active override layer is not fully verified |
| Support ticket list | `templates/venom-codes/supportticketslist.tpl` | Verified | Themed ticket queue, KPIs, filters, status labels, native ticket links | Uses JS-applied custom status colors when provided by ticket data |
| Support ticket submit step 1 | `templates/venom-codes/supportticketsubmit-stepone.tpl` | Verified | Themed department selection intro and department list | Preserves native support routing |
| Support ticket submit step 2 | `templates/venom-codes/supportticketsubmit-steptwo.tpl` | Verified | Themed ticket submission form, service linking, attachments, captcha, KB suggestion hook | Preserves native WHMCS support form behavior |
| Support ticket submit confirm | `templates/venom-codes/supportticketsubmit-confirm.tpl` | Verified | Themed confirmation state and native link into ticket thread | Native support flow is preserved |
| Account password page | `templates/venom-codes/user-password.tpl` | Verified | Themed password-change page, strength meter, generate-password workflow, account/security links | Confirms account-security theming exists; payment-method pages were not in this audit set |

## 3. Design System Status

### Public shell
- `Verified`: `header.tpl` assigns `venom-shell-public` by default and non-client pages render through the public header/footer shell.

### Auth shell
- `Verified`: `authlayout.tpl` is the shared auth wrapper and is used by `login.tpl`, `clientregister.tpl`, and password reset templates.

### Client shell
- `Verified`: `header.tpl` routes client pages into `includes/client/header.tpl`, and `clientarea.tpl` provides the client shell wrapper.

### Theme toggle
- `Verified`: `includes/venom/theme-controls.tpl` contains the toggle control, and `js/venom-homepage.js` updates `data-venom-theme` plus persistence.

### Accent switcher
- `Partial`: five accent choices exist in `theme-controls.tpl`, and `venom-homepage.js` persists accent changes, but the component markup still marks `ocean` as active even though runtime defaults resolve to `violet`.

### Current default theme/accent found in code
- `Verified`: `light` theme and `violet` accent are the active runtime defaults in `header.tpl`, `includes/head.tpl`, and `js/venom-homepage.js`.

### Target default theme/accent required by project brief
- `Verified`: required target is `data-venom-theme="light"` and `data-venom-accent="violet"`.

### Global script behavior
- `Verified`: `js/venom-homepage.js` currently handles theme toggle, accent switching, cookie notice visibility, and jump-to-top behavior with `localStorage` safety fallbacks.

### Shared components
- Logo: `Partial`
  Reused globally, but brand text is inconsistent with the approved project name.
- Footer: `Partial`
  Global include exists, but placeholder links and inline styling remain.
- Cards: `Verified`
  `venom-diagram-card`, `venom-plan-card`, and standard card wrappers are used across auth, client, support, and billing pages.
- Status labels: `Verified`
  `label status status-*` patterns are used across dashboard, services, invoices, support, and product details.
- Tables: `Verified`
  Shared list/table patterns are used in services, invoices, and support pages with DataTables hooks preserved.
- Forms: `Verified`
  Auth, register, password reset, support, and account password forms remain wired to native WHMCS actions.
- Chips: `Verified`
  `venom-chip` is used consistently across homepage, auth, client, support, and billing sections.
- Buttons: `Partial`
  Shared button patterns exist, but some CTA wording and destinations are not yet normalized to the approved WHMCS-native sales flow.

## 4. Mismatch Register

| ID | Area | Current Repository Reality | Required Project Rule | Action Needed | Severity |
| --- | --- | --- | --- | --- | --- |
| M-01 | Branding | `includes/venom/logo.tpl` uses `Venom Solutions`, while `main-footer.tpl` uses `VENOM CODES` | Project name must lock to `Venom Codes` | Normalize shared brand name, slogan, and footer/logo copy from one governed source | High |
| M-02 | Accent defaults | Runtime defaults are `violet`, but `theme-controls.tpl` marks `ocean` as the active accent dot | Target default accent must normalize to `violet` | Align static control state with runtime default | Medium |
| M-03 | Homepage plan naming | Homepage pricing names are `Trial`, `Pro`, and `Ultra` | Do not add extra claims/features outside approved scope | Freeze and govern commercial plan taxonomy before keeping or extending homepage pricing | High |
| M-04 | Homepage pricing/inclusions | Homepage hardcodes `$50/week`, `$100/month`, `$300/month`, `FREE Load Balancer`, `UNLIMITED Load Balancers`, and `Priority VIP Support` | Pricing/inclusions must be approved and repository-backed, not invented theme copy | Replace hardcoded offer language only after commercial governance is approved | High |
| M-05 | Scope/copy claims | Homepage claims include `99.9% uptime`, `zero packet loss`, `ultimate management layer`, and similar performance promises | Approved scope is software-only licensing/control panel access; do not add extra unverified claims | Run a copy-governance pass before expanding more public pages | High |
| M-06 | CTA sales flow | Homepage CTAs use `Get Started Now`, `Start Trial`, `Buy Pro`, `Go Ultra`; homepage/auth header includes `Deploy` | Order flow must stay WHMCS-native: `cart -> checkout -> invoice/payment -> service delivery` | Normalize CTA wording and destinations to cart-native routes and sales-flow language | High |
| M-07 | Placeholder governance | Footer quick links and connectivity links still point to `#` placeholders | Shared footer links need final governance decisions before release | Replace or remove placeholders after governance approval | Medium |
| M-08 | Homepage feature completeness | `venom-homepage.js` supports jump-to-top, but `includes/venom/homepage.tpl` does not show a verified `venomJumpToTop` element | Shared shell features should be explicitly present if claimed as implemented | Verify and document the homepage jump-to-top markup before calling homepage shell complete | Medium |
| M-09 | Active design-system parity | `viewinvoice.tpl` loads `theme.css` but not `custom.css` | `custom.css` is part of the active design-system layer | Decide whether standalone invoice should intentionally stay isolated or join the active parity layer | Medium |
| M-10 | Footer implementation hygiene | `main-footer.tpl` still contains inline styles on the language/currency trigger and flag block | Design-system governance should avoid ad hoc inline styling in shared components | Move this into governed styling during the normalization phase, not ad hoc page work | Low |

## 5. Delivery Tracks

### Governance / roadmap
- [x] Lock approved project scope, product summary, and sales-flow constraints in one roadmap file
- [x] Record verified repository inventory for audited public/auth/client/shared files
- [x] Record mismatch register and objective next-phase instruction

### Brand normalization
- [ ] Normalize the shared brand name to `Venom Codes` across logo, homepage, auth, and footer
- [ ] Normalize the shared slogan/subtitle language to the approved software-only product summary
- [ ] Remove cross-file brand drift between `Venom Solutions`, `VENOM CODES`, and sales-copy variants

### Design system normalization
- [x] Public shell classification is present
- [x] Auth shell wrapper is present
- [x] Client shell wrapper is present
- [x] Global theme toggle runtime is present
- [ ] Accent control default state is visually aligned to required `violet`
- [ ] Standalone invoice render parity with the active design-system override layer is verified

### Copy compliance pass
- [x] Software-only legal disclaimer is present in the shared footer
- [ ] Homepage hero copy is reduced to approved-scope claims only
- [ ] Homepage architecture/performance copy is reduced to verified claims only
- [ ] Homepage pricing and inclusions are governed from approved business copy
- [ ] CTA wording is normalized to the native WHMCS order flow

### Auth pages
- [x] Shared auth wrapper exists
- [x] Login page is themed inside the auth wrapper
- [x] Register page is themed inside the auth wrapper
- [x] Password reset container is themed inside the auth wrapper
- [x] Password reset prompt templates are themed inside the auth wrapper

### Client dashboard
- [x] Client workspace header/navigation exists
- [x] Client dashboard home has themed hero/KPI/action sections

### Services
- [x] Services list page is themed and filterable
- [x] Service detail page is themed and preserves native actions
- [ ] Renewal-specific templates/routes are audited as part of the services lifecycle

### Product details
- [x] Product detail status cards and summary areas are implemented
- [ ] Product topology/presentation labels are normalized to governed product language

### Billing / invoices
- [x] Invoice list page is themed
- [x] Invoice detail page is themed
- [ ] Billing pages are fully aligned to the active shared design-system parity layer

### Renewals
- [x] Service detail exposes a native renew action when available
- [ ] Dedicated renewal page/template coverage is verified

### Support
- [x] Support ticket list is themed
- [x] Support submit step one is themed
- [x] Support submit step two is themed
- [x] Support submit confirmation is themed

### Account / security / payment methods
- [x] Password change page is themed
- [ ] Payment method pages are audited and normalized
- [ ] Account profile/security pages beyond password are audited and normalized
- [ ] Shared account-security/payment-method governance copy is normalized

### Order flow alignment
- [x] Core native WHMCS routes remain present in cart, invoices, payment, services, and support links
- [ ] Homepage primary CTA routes into the native cart flow
- [ ] Homepage pricing CTAs route into the native cart flow
- [ ] Register/deploy CTA wording is normalized to the approved native sales-flow language

### QA / release gate
- [x] Repository audit confirms live shell/theme runtime structure
- [ ] Browser validation evidence is recorded for public/auth/client flows
- [ ] Accent/theme parity is verified across the required runtime states
- [ ] Release gate is re-run after brand/design/copy normalization

## 6. Progress Formula

Formula: `Progress % = completed checklist items / total checklist items * 100`

### Overall progress
- Completed checklist items: `28`
- Total checklist items: `47`
- Overall progress: `59.6%`

### Progress by track

| Track | Completed | Total | Progress |
| --- | ---: | ---: | ---: |
| Governance / roadmap | 3 | 3 | 100.0% |
| Brand normalization | 0 | 3 | 0.0% |
| Design system normalization | 4 | 6 | 66.7% |
| Copy compliance pass | 1 | 5 | 20.0% |
| Auth pages | 5 | 5 | 100.0% |
| Client dashboard | 2 | 2 | 100.0% |
| Services | 2 | 3 | 66.7% |
| Product details | 1 | 2 | 50.0% |
| Billing / invoices | 2 | 3 | 66.7% |
| Renewals | 1 | 2 | 50.0% |
| Support | 4 | 4 | 100.0% |
| Account / security / payment methods | 1 | 4 | 25.0% |
| Order flow alignment | 1 | 4 | 25.0% |
| QA / release gate | 1 | 4 | 25.0% |

## 7. Current Recommended Next Step

The next implementation phase must be:

**Freeze roadmap + normalize brand/design/copy governance before expanding new pages**

### Short implementation brief for the next real execution step
- Lock one canonical brand source for `Venom Codes` across logo, homepage, auth, and footer
- Normalize the default accent control state so the shared UI matches the required `violet` default already used by runtime code
- Replace ungoverned homepage sales copy, pricing/inclusions, and CTA labels with approved copy that routes into the native WHMCS cart flow
- Resolve shared-footer placeholders and inline-style governance decisions before any additional public-page expansion
- Re-run page QA only after those governance changes are complete
