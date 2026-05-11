# Context

User request: create `main_screen` with bottom bar switching between: home, custome, history, setting. Current app routes `/` directly to `PhotoSessionPage` via `GoRouter` (`lib/app/router/app_router.dart:11-23`).

# Overview

- Date: 2026-05-11
- Priority: high
- Status: completed

# Key Insights

- App already uses `GoRouter` + `flutter_bloc`; new navigation should avoid duplicating route-level state.
- Requested `custome` likely means `custom`; keep UI label configurable to match product wording.
- Existing home-like screen can be current `PhotoSessionPage` to reduce scope.

# Requirements

- A single `MainScreen` with `BottomNavigationBar` (or `NavigationBar`) and 4 tabs.
- Tabs: Home, Custom(e), History, Setting.
- Switching tab changes visible content without app crash/rebuild loops.
- Preserve back button behavior (Android) predictably from root shell.

# Architecture

- Data flow:
  1. User taps bottom item.
  2. `selectedIndex` in `MainScreen` state updates.
  3. Indexed body renders corresponding tab widget.
  4. Home tab hosts existing `PhotoSessionPage` (or wrapper) as content.
- State scope: local UI state in shell; no domain state coupling.
- Failure boundary: tab widgets isolated; one tab error does not break nav chrome.

# Related code files

- `lib/app/router/app_router.dart` — action: modify (root route to main shell).
- `lib/features/photo_session/presentation/pages/photo_session_page.dart` — action: read/possible light modify (embed compatibility).
- `lib/features/main_screen/presentation/pages/main_screen.dart` — action: create.
- `lib/features/main_screen/presentation/widgets/*.dart` — action: optional create for tab bodies.

# Implementation Steps

1. Finalize tab naming contract (display label + internal enum keys).
2. Define shell widget contract: selected index, tab definitions, root scaffold.
3. Decide Home tab mounting strategy:
   - Recommended: reuse `PhotoSessionPage` as Home tab body.
   - Alternative: create light Home page and navigate to photo session later.
4. Define safe placeholders for Custom/History/Setting.

# Todo list

- [x] Freeze tab contract and naming (`home`, `custom`, `history`, `setting`).
- [x] Lock Home tab reuse decision and embedding constraints.
- [x] Document shell state + back-navigation behavior.

# Success Criteria

- Exact 4 bottom items render in fixed order.
- Tab switch latency visually instant (<100ms perceived).
- No route exceptions or missing provider exceptions at startup.

# Risk Assessment

- High: Provider scope break when moving `PhotoSessionPage` under new shell.
  - Likelihood: medium; Impact: high.
  - Mitigation: move `BlocProvider` creation to Home tab wrapper or shell-level provider.
- Medium: naming mismatch (`custome` vs `custom`) causes copy inconsistency.
  - Mitigation: centralize labels in constants/l10n keys.

# Security Considerations

- No new auth/data surface.
- Ensure no debug-only data exposure in placeholder tabs.

# Rollback Plan

- Revert router root from `MainScreen` back to direct `PhotoSessionPage` route.
- Keep new `main_screen` files orphan-safe and deletable.

# Next Steps

- Proceed to Phase 02 for concrete file-level implementation sequence.
