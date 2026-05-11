# Phase 01 — Baseline + Dependency Setup

## Context

Project is still starter template (`lib/main.dart:1-122`). This phase establishes package and folder baseline needed by all later phases.

## Overview

- Date: 2026-05-11
- Priority: high
- Status: completed

## Key Insights

- Early architectural foundation prevents chaotic folder growth.
- Stack decision fixed by user: **Bloc/Cubit + GetIt + GoRouter**.

## Requirements

- Add required dependencies for state, DI, routing, equality, and optional functional error modeling.
- Define canonical folder layout for Clean Architecture.
- Keep app runnable after dependency update.

## Architecture

Data flow introduced (high-level):
UI event → Cubit action → UseCase → Repository abstraction (domain) → Repository impl (data) → Data source → DTO/entity mapping → UI state.

## Related code files

- `pubspec.yaml` — modify — add bloc/get_it/go_router and supporting libs.
- `analysis_options.yaml` — modify — enforce lint rules aligned with architecture boundaries.
- `lib/main.dart` — read-only in this phase.
- `lib/**` — create — folder skeleton placeholders.

## Implementation Steps

1. Add dependencies: `flutter_bloc`, `get_it`, `go_router`, `equatable` (plus optional `dartz`/`fpdart`).
2. Add dev dependencies for architecture-friendly testing/mocking.
3. Create skeleton folders: `app`, `core`, `di`, `features/photo_session/{domain,data,presentation}`.
4. Add lightweight README in `lib/` or `docs/` to define layer rules.

## Todo list

- [x] Dependency list added and version-pinned.
- [x] Folder skeleton committed with clear naming.
- [ ] Static analysis still passes.

## Success Criteria

- `flutter pub get` succeeds.
- `flutter analyze` has no new critical issues.
- Clean folder layout exists and documented.

## Risk Assessment

- Risk: dependency conflicts (Likelihood: low, Impact: medium).
- Mitigation: pin stable versions and run analyze/test immediately.

## Security Considerations

- Verify dependency provenance/popularity before pinning.
- Avoid adding unnecessary third-party packages (YAGNI).

## Backward Compatibility

- No user-facing behavior change yet.
- Existing template app remains runnable.

## Rollback Plan

- Revert `pubspec.yaml` and remove created folders; app returns to starter state.

## Next Steps

Proceed to composition root and app shell wiring.
