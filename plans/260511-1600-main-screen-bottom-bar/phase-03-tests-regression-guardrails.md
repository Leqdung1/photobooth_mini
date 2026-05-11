# Context

Protect navigation shell behavior with widget-level regression tests.

# Overview

- Date: 2026-05-11
- Priority: medium
- Status: completed

# Key Insights

- Feature risk is UI-state/routing regression, not business-domain logic.
- Existing project already includes `flutter_test`, sufficient for widget coverage.

# Requirements

- Verify 4 bottom items render.
- Verify tapping each tab swaps visible body.
- Verify Home tab still shows photo-session loading lifecycle (at least smoke level).

# Architecture

- Test matrix:
  - Unit: optional helper mapping (tab enum/index) if extracted.
  - Widget: `MainScreen` bottom bar + tab switch behavior.
  - Integration/light e2e: app bootstrap route `/` lands at shell and remains interactive.
- Data flow under test: gesture → state update → widget subtree switch.

# Related code files

- `test/features/main_screen/main_screen_test.dart` — create.
- `test/app/router/app_router_smoke_test.dart` — create/modify.
- `lib/features/main_screen/**` — read-only for assertions.

# Implementation Steps

1. Build widget test harness with MaterialApp context.
2. Assert labels/icons for Home/Custom/History/Setting present.
3. Simulate taps and assert expected tab body marker text.
4. Add smoke test for router root launch with `MainScreen`.
5. Add verification commands to phase checklist.

# Todo list

- [x] Add widget tests for 4-tab rendering and switching.
- [x] Add router startup smoke test.
- [x] Record local verification commands/results (`flutter test ...` attempted; blocked: `flutter` command not found in this environment).

# Success Criteria

- `flutter test` passes for added navigation tests.
- Failing behavior reproduced if one tab is removed/miswired (test sensitivity check).

# Risk Assessment

- Medium: brittle tests if relying on localized text only.
  - Mitigation: add stable Keys for tab items and body markers.
- Low: false confidence from smoke-only home check.
  - Mitigation: assert at least one known home-state widget path.

# Security Considerations

- Tests must not embed secrets or environment-specific endpoints.

# Rollback Plan

- Revert only new tests if flaky, keep production feature intact temporarily.
- Open follow-up stabilization task before merge if rollback used.

# Next Steps

- Handoff to `/cook --auto` for implementation.
