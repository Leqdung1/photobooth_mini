# Phase 03 — Feature Vertical Slice (Photo Session)

## Context

Architecture must be proven with one end-to-end feature (not just folders). Use a simple `photo_session` flow as reference module.

## Overview

- Date: 2026-05-11
- Priority: high
- Status: completed

## Key Insights

- A single vertical slice is enough to validate boundaries and developer workflow.
- Over-building multiple features now increases complexity with no signal gain.

## Requirements

- Implement domain entities/usecases/repository abstraction.
- Implement data source + repository implementation + mapping.
- Implement presentation with Cubit + states/events + screen.
- Route to screen via GoRouter.

## Architecture

Data in:
User taps action on screen.

Transform:
Cubit emits loading → calls UseCase → repository abstraction → repository impl → data source (mock/local for MVP) → map to entity.

Data out:
Cubit emits success/failure state → UI rebuild.

## Related code files

- `lib/features/photo_session/domain/**` — create — entities, repository contract, usecase.
- `lib/features/photo_session/data/**` — create — models, datasource, repository impl.
- `lib/features/photo_session/presentation/**` — create — cubit, states, page/widgets.
- `lib/di/**` — modify — feature registrations.
- `lib/app/router/**` — modify — feature route mapping.

## Implementation Steps

1. Define domain API first (entity + repository + usecase).
2. Implement data layer against local/mock source for deterministic behavior.
3. Build Cubit and UI state model.
4. Wire route and DI, then validate screen flow.

## Todo list

- [x] Domain layer has zero Flutter imports.
- [x] Cubit handles loading/success/error states explicitly.
- [x] Feature integrated into router and accessible from initial app path.

## Success Criteria

- Demonstrable feature journey runs end-to-end.
- Layer boundaries respected (import direction check).
- Error path tested (not only happy path).

## Risk Assessment

- Risk: layer leakage (UI directly calling data source) (L: medium, I: medium).
- Mitigation: code review checklist + lint/import convention doc.
- Risk: fake datasource assumptions break when real API arrives (L: medium, I: medium).
- Mitigation: keep repository contract stable and transport-agnostic.

## Security Considerations

- Validate user input before passing to usecase.
- No sensitive logging in presentation or data layers.

## Backward Compatibility

- No existing user data to migrate.
- Future API integration remains compatible via repository contract.

## Rollback Plan

- Remove `photo_session` module and route; app still boots through core shell.

## Next Steps

Add tests + migration documentation as final gate.
