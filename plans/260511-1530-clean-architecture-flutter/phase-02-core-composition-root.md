# Phase 02 — Core + App Composition Root

## Context

After baseline setup, architecture needs a stable composition root and app shell to prevent dependency leakage across layers.

## Overview

- Date: 2026-05-11
- Priority: high
- Status: completed

## Key Insights

- `main.dart` currently couples app bootstrap/UI directly (`lib/main.dart:3-35`).
- Composition root must centralize DI registration and router init.

## Requirements

- Introduce app entrypoint boundaries: bootstrap, app widget, router, theme.
- Define `core` primitives: failure model, usecase contract, constants.
- Register dependencies using GetIt by layer.

## Architecture

Data flow:
`main()` → bootstrap init → DI container setup → App widget → GoRouter routes → Feature presentation.

Dependency direction:
Presentation → Domain → Data. Core is shared, inward-only abstractions.

## Related code files

- `lib/main.dart` — modify — delegate boot to app/bootstrap layer.
- `lib/app/` — create — `app.dart`, router config, theme setup.
- `lib/di/` — create — service locator init entrypoints.
- `lib/core/` — create — failures, usecase base, typedefs.

## Implementation Steps

1. Replace monolithic `main.dart` with thin bootstrap call.
2. Add `App` root widget and centralized `GoRouter` config.
3. Add DI registration modules (core first, then feature modules).
4. Add architecture guard comments/docs for import direction.

## Todo list

- [x] App boots through composition root.
- [x] Route table defined in a single place.
- [x] DI container contains only abstraction-first registrations.

## Success Criteria

- App launches and navigates initial route.
- No direct data-layer import inside presentation except through DI wiring files.
- Lints/analyze pass.

## Risk Assessment

- Risk: service locator misregistration causing runtime crashes (L: medium, I: high).
- Mitigation: startup smoke test + explicit registration order + missing-registration asserts.

## Security Considerations

- Avoid exposing secrets/config in client bootstrap.
- Keep failure messages sanitized for UI-level display.

## Backward Compatibility

- Maintains existing app startup contract (`main()` entry still same from platform POV).

## Rollback Plan

- Restore old `main.dart`; disable DI/router shell; keep dependencies untouched.

## Next Steps

Implement one complete feature slice to validate architecture viability.
