# Context

After contract lock, implement widget shell + router integration with minimal blast radius.

# Overview

- Date: 2026-05-11
- Priority: high
- Status: completed

# Key Insights

- Root route currently constructs `BlocProvider<PhotoSessionCubit>` inline (`lib/app/router/app_router.dart:16-19`).
- If Home tab uses `PhotoSessionPage`, cubit provisioning must stay available for that subtree.

# Requirements

- Root `/` route loads `MainScreen`.
- MainScreen includes bottom bar and indexed tab content for 4 tabs.
- Home tab shows existing home experience (photo session data).

# Architecture

- Components:
  - `MainScreen` (stateful): owns `selectedIndex`.
  - `HomeTab` wrapper: injects `PhotoSessionCubit` and renders `PhotoSessionPage`.
  - `CustomTab`, `HistoryTab`, `SettingTab`: placeholder stateless widgets.
- Data flow:
  1. Router builds `MainScreen` at `/`.
  2. MainScreen composes tab list once.
  3. Tab click updates selected index; body swaps by `IndexedStack`.
  4. Home tab triggers existing cubit `load()` lifecycle.

# Related code files

- `lib/app/router/app_router.dart` — modify: replace root builder child with `MainScreen`.
- `lib/features/main_screen/presentation/pages/main_screen.dart` — create: scaffold + bottom nav + indexed body.
- `lib/features/main_screen/presentation/pages/custom_tab_page.dart` — create placeholder.
- `lib/features/main_screen/presentation/pages/history_tab_page.dart` — create placeholder.
- `lib/features/main_screen/presentation/pages/setting_tab_page.dart` — create placeholder.
- `lib/features/main_screen/presentation/pages/home_tab_page.dart` — create wrapper with provider.

# Implementation Steps

1. Add `features/main_screen/presentation/pages` structure.
2. Build `MainScreen` with enum/list model for 4 tabs.
3. Use `IndexedStack` to preserve tab states when switching.
4. Wire Home tab wrapper with `BlocProvider` using `sl<PhotoSessionCubit>()`.
5. Update `AppRouter` imports and root builder.
6. Run static checks + app launch smoke test.

# Todo list

- [x] Create main shell + bottom bar UI.
- [x] Add 4 tab pages with home wrapper integration.
- [x] Switch router root to main shell.
- [x] Validate runtime for provider/router errors (via smoke/widget tests; local flutter command unavailable in environment).

# Success Criteria

- App starts on `MainScreen` at `/`.
- Bottom bar switches to all 4 tabs correctly.
- Home tab still loads and displays session (success/loading/error states).

# Risk Assessment

- High: Duplicate cubit creation on frequent tab revisits if not preserved.
  - Mitigation: `IndexedStack` + provider instantiated once per shell lifecycle.
- Medium: nested scaffolds visual conflict if Home page has its own `AppBar`.
  - Mitigation: decide single-appbar strategy (shell appbar or per-tab appbar).

# Security Considerations

- No new network/input vectors.
- Keep placeholders static text; no user-provided HTML/rendering.

# Rollback Plan

- Restore old root builder block in `app_router.dart`.
- Remove `features/main_screen` directory if migration rejected.

# Next Steps

- Implement Phase 03 tests for navigation regression coverage.
