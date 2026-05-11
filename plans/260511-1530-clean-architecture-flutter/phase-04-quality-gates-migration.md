# Phase 04 — Quality Gates + Migration Notes

## Context

Without test and governance gates, architecture will decay quickly after first feature.

## Overview

- Date: 2026-05-11
- Priority: medium
- Status: in_progress (verification blocked: Flutter SDK unavailable in environment)

## Key Insights

- Structural consistency matters more than feature count at this stage.
- Clear migration notes reduce onboarding cost for future modules.

## Requirements

- Add minimum test matrix (unit/integration/widget).
- Document feature-adding workflow and architecture rules.
- Verify rollback and extension path.

## Architecture

Verification flow:
Developer change → run unit tests (domain/usecase/cubit) → run widget test (screen states) → run integration smoke (startup/route).

## Related code files

- `test/features/photo_session/domain/**` — create — usecase/repository contract tests.
- `test/features/photo_session/presentation/**` — create — cubit + widget state tests.
- `test/app/**` — create — app boot/router smoke tests.
- `README.md` — modify — clean architecture conventions and commands.
- `docs/architecture.md` — create — boundary rules + adding-new-feature checklist.

## Implementation Steps

1. Add domain unit tests for success/failure branches.
2. Add cubit tests for state transition matrix.
3. Add widget/integration smoke tests for route + rendering.
4. Document architecture and developer workflow.

## Todo list

- [ ] Test matrix implemented and runnable locally.
- [x] Architecture docs include do/don’t import rules.
- [x] Verification commands listed in README.

## Success Criteria

- `flutter test` passes with new coverage for domain/presentation paths.
- New contributor can add second feature by following docs only.
- Rollback steps documented and tested at least once.

## Risk Assessment

- Risk: flaky widget tests slow adoption (L: medium, I: medium).
- Mitigation: isolate async, use deterministic fakes.
- Risk: docs drift from code (L: medium, I: low).
- Mitigation: enforce docs update in PR checklist.

## Security Considerations

- Ensure test fixtures do not include secrets.
- Document secure handling expectations for future API keys/tokens.

## Backward Compatibility

- Migration path for future existing code: wrap legacy screen logic behind domain usecases before moving data layer.

## Rollback Plan

- Tests/docs are additive; can revert independently without runtime impact.

## Next Steps

Start execution with cook agent using this plan.
