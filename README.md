# SafeWalk

SafeWalk is a Flutter app scaffold driven by the latest Figma structure for the WalkStack design file. The current codebase focuses on app architecture, route wiring, shared UI scaffolds, and Supabase-backed data boundaries rather than finished feature logic.

## Source Of Truth

- UI source of truth: `docs/figma_ui_structure.md`
- App router: `lib/app/router/app_router.dart`
- Route constants: `lib/app/router/app_routes.dart`
- Shared navigation shell: `lib/shared/navigation/app_navigation_shell.dart`
- Supabase schema: `supabase/migrations/0001_safewalk_schema.sql`

## Architecture

- `go_router` manages the app route tree and bottom-navigation shell.
- `flutter_riverpod` is used for app-level providers such as router and theme mode.
- `supabase_flutter` is initialized at bootstrap and backed by repository interfaces in `lib/data/`.
- Feature modules are split by Figma flow area: `entry`, `setup`, `planning`, `trip_live`, `emergency`, `companion`, `post_trip`, `safety_map`, `settings`, and `system_states`.

## Figma-Derived Navigation

- Entry: splash, onboarding, welcome, sign in, sign up
- Setup: permissions, profile, avatar, contacts, saved places, setup complete
- Main shell: home, trips, contacts, map, settings
- Planning: destination search, results, route options, comparison, safety details, recommendation, start confirmation
- Live trip: active trip, navigation, contact tracking, check-in, SOS expansion
- Emergency: SOS hold, countdown, alert sent, priority call, nearby safe points, hotline
- Companion: companion mode, fake call, active fake call, chat and voice assist
- Post-trip: arrival success, notify contacts, route rating, summary
- System states: no internet, no trusted contacts, GPS lost, empty history, permission denied, maintenance

## Setup

1. Install Flutter 3.3+.
2. Run `flutter pub get`.
3. Create a local `.env` or pass `--dart-define=SUPABASE_URL=... --dart-define=SUPABASE_ANON_KEY=...`.
4. Apply `supabase/migrations/0001_safewalk_schema.sql` to your Supabase project.
5. Run the app with Flutter.

## Notes

- Fresh Figma MCP reads later hit rate limits, so the scaffold uses the successful MCP frame inventory and screenshot already captured earlier in this thread for the same file.
- This scaffold intentionally avoids older local UI notes and follows the latest Figma-derived screen structure.
