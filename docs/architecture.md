# Clean Architecture Guidelines

## Layer Direction

Dependencies must point inward:

- `presentation` → `domain`
- `data` → `domain`
- `domain` depends only on `core` and pure Dart packages.

## Feature Structure

Each feature follows:

- `domain/` entities, repository contracts, use cases
- `data/` models, data sources, repository implementations
- `presentation/` cubits, states, pages/widgets

## DI Rules

- Register all dependencies in `lib/di/injection.dart`.
- Presentation receives collaborators via DI only.

## Developer Checklist for New Feature

1. Define domain contract first.
2. Implement data source + repository implementation.
3. Add Cubit and explicit loading/success/failure states.
4. Wire route in `AppRouter`.
5. Add unit/cubit/widget tests for success and error paths.
