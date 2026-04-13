# Figma Fidelity Audit

Last updated: 2026-04-13

Figma MCP evidence used in this stricter pass:
- Root canvas screenshot: `0:1`
- Onboarding slide 1: `3:82`
- Onboarding slide 2: `3:149`
- Onboarding slide 3: `3:31`
- Splash: `3:126`
- Welcome choice: `3:210`
- Bottom nav component: `7:104`

Status guide:
- `reviewed-close`: checked against Figma screenshot or frame structure and already close
- `reviewed-partial`: checked against Figma and still visibly off in layout, spacing, artwork, or typography
- `screen-exists`: screen exists in app, but not yet re-audited against Figma in this stricter pass
- `pending-review`: frame/group exists in the Figma source but still needs a real side-by-side review

Important note:
- The older checklist marked too many screens as `done`.
- That was too optimistic for a real `95%` fidelity target.
- This version is stricter and is the one to trust while we continue polishing.

Intentional deviations that should NOT be treated as bugs:
- The iPhone hardware frame, status icons, dynamic island, and home indicator are intentionally removed from the shipped Flutter UI when they are only presentation chrome in Figma.
- Small icon substitutions are acceptable when the deployed app uses a close built-in Flutter icon instead of the exact Figma asset.

## Entry
- `reviewed-partial` Splash
  Note: dark mood is much closer now, and phone chrome removal is intentional, but final spacing and logo/glow polish still need work.
- `reviewed-partial` Onboarding slide 1
  Note: layout is now much closer to the Figma frame, but the city artwork is still an approximation.
- `reviewed-partial` Onboarding slide 2
  Note: checked again against Figma MCP frame `3:149`; map card structure is close, but the map artwork, avatar card, and lower spacing still need another pass.
- `reviewed-partial` Onboarding slide 3
  Note: checked again against Figma MCP frame `3:31`; SOS composition is close, but chip placement, pulse treatment, and lower copy spacing still need tighter matching.
- `reviewed-partial` Welcome choice
  Note: hero composition is closer, and phone chrome removal is intentional, but glow placement, spacing, and exact typography still need work.
- `reviewed-partial` Login
  Note: phone chrome removal is intentional, but the exact shield block, social row styling, and spacing rhythm still need another pass.
- `reviewed-partial` Signup
  Note: structure and hierarchy are much closer, but the exact field tinting, lower legal copy, and top spacing still need tighter parity.

## Permissions And Setup
- `screen-exists` Location permission
- `screen-exists` Notification permission
- `screen-exists` Call permission
- `screen-exists` Background tracking permission
- `screen-exists` Permission success
- `screen-exists` Create profile
- `screen-exists` Add avatar
- `screen-exists` Trusted contacts
- `screen-exists` Edit trusted contact
- `screen-exists` Home address
- `screen-exists` Work / school
- `screen-exists` Setup completed

## Home And Planning Overview
- `reviewed-partial` Main home dashboard
  Note: layout, search, status card, and action tiles are much closer now, but the map art and exact iconography still need another pass.
- `reviewed-partial` Quick go home
  Note: bottom card and route composition are closer, but the route path and floating controls still need fine alignment.
- `reviewed-partial` Recent destinations
  Note: hierarchy and card structure are closer, but the hero image and list card rhythm still need more polish.
- `reviewed-partial` Safety status overview
  Note: strong structural match, but spacing and ring styling still need tighter parity.
- `reviewed-partial` Smart city alerts
  Note: filter chips and feed composition are close, but the live footage tile and exact alert card styling still need refinement.
- `screen-exists` Trips hub

## Route Planning
- `reviewed-partial` Destination search
  Note: search structure, ranking affordance, and preview block are closer, but spacing and exact chip/input treatment still need tuning.
- `reviewed-partial` Destination results
  Note: featured result card is closer now, but image treatment and density still need another visual pass.
- `reviewed-partial` Map route options
  Note: dark map mode, live badge, and bottom route sheet are closer, but route geometry and icon placement still need fine alignment.
- `reviewed-partial` Route comparison
  Note: bottom-sheet composition and selected-state cards are closer, but spacing and exact tag/button hierarchy still need another pass.
- `reviewed-partial` Route safety details
  Note: strong structural match, but the dark analytics spacing and mini-map styling still need tighter parity.
- `reviewed-partial` Route recommendation AI
  Note: orb, copy hierarchy, and metrics are closer, but the scan visual and supporting badges still need refinement.
- `reviewed-partial` Start trip confirmation
  Note: layout and guardian section are closer, but portrait treatment and lower toggle spacing still need more polish.

## Live Trip
- `screen-exists` Active trip main
- `screen-exists` Live navigation
- `screen-exists` Live contact tracking
- `screen-exists` Check-in prompt
- `screen-exists` I'm fine state
- `screen-exists` Need help flow
- `screen-exists` Trip progress update
- `screen-exists` Floating SOS expanded

## Emergency
- `screen-exists` SOS hold activation
- `screen-exists` SOS countdown
- `screen-exists` Emergency alert sent
- `screen-exists` Priority contact auto call
- `screen-exists` Nearby safe points
- `screen-exists` Emergency hotline

## Companion
- `reviewed-partial` Companion mode enabled
  Note: there is no dedicated screen for this state yet. The current `CompanionModeMainScreen` blends the enabled state and the main companion dashboard into one screen, so this should be treated as a real missing frame/state.
- `screen-exists` Companion mode main
- `screen-exists` Fake call incoming
- `screen-exists` Active fake call
- `screen-exists` Companion chat / voice assist

## Post Trip
- `screen-exists` Arrival success
- `screen-exists` Notify contacts
- `screen-exists` Rate route safety
- `screen-exists` Trip summary analytics

## Safety Map
- `screen-exists` Safety map main
- `screen-exists` Safe points nearby
- `screen-exists` Incident reports heatmap
- `screen-exists` Report new incident
- `screen-exists` Submit report confirmation

## Settings
- `screen-exists` Settings dashboard
- `screen-exists` Privacy settings
- `screen-exists` Accessibility settings
- `screen-exists` SOS customization
- `screen-exists` Notification preferences

## System States
- `screen-exists` No internet connectivity
- `screen-exists` No trusted contacts
- `screen-exists` GPS signal lost
- `screen-exists` Empty trip history
- `screen-exists` Permission denied
- `screen-exists` Server maintenance

## Highest Priority Review Order
1. Live trip and emergency
2. Settings and system states
3. Setup screens
4. Post-trip and safety map

## Known Structural Findings
- `Onboarding` had two competing implementations; the flow is now being forced through the fidelity version.
- The old checklist should no longer be used to judge whether the app is at `95%`.
- The main risk is not missing screens anymore.
- The main risk is screens that exist but are still too simplified compared with the Figma compositions.
- `Bottom navigation` is structurally mismatched today:
  Figma MCP component `7:104` shows a 4-tab shell only: `Home`, `Map`, `Trips`, `Settings`.
  The current router still contains an extra `Contacts` branch, so the shipped shell does not yet match the Figma navigation model.
- `Companion mode enabled` appears in the Figma structure, but there is no dedicated route/screen for it yet.
- `Phone chrome` should not be re-added just because it appears in Figma screenshots; the user explicitly asked to exclude it for real device deployment.
