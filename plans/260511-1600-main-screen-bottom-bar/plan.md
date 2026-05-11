---
title: Main Screen with Bottom Navigation (Home/Custom/History/Setting)
date: 2026-05-11 16:00
status: completed
priority: high
blocks: []
blockedBy: ["260511-1530-clean-architecture-flutter"]
---

# Plan Overview

- Scope mode: **HOLD** (implement only main screen + 4 tabs + routing integration).
- Mode: **--auto** (single feature, moderate router/state impact).
- Reusable code: app shell + GoRouter + localization already exist in `lib/app/**`.
- Minimum changes: add one presentation shell screen and 4 lightweight tab pages.
- Complexity: low-medium (navigation state + router migration from `/` detail page).

## Phases

1. [Phase 01 — Navigation Shell Contract](./phase-01-navigation-shell-contract.md) — completed
2. [Phase 02 — UI Assembly + Router Wiring](./phase-02-ui-assembly-router-wiring.md) — completed
3. [Phase 03 — Tests + Regression Guardrails](./phase-03-tests-regression-guardrails.md) — completed

## Cross-Plan Dependencies

- Existing unfinished plan detected: `plans/260511-1530-clean-architecture-flutter` (status: pending).
- This plan depends on that baseline architecture shape (`blockedBy`).
- Overlap area: `lib/app/router/app_router.dart`, `lib/features/**/presentation/**`.

## Dependency Graph

- P1 defines tab contracts and ownership; blocks P2/P3.
- P2 implements shell and routing; blocks P3.
- P3 validates behavior and prevents regressions.

## File Ownership (no parallel collisions)

- P1 owns spec docs + route/tab naming decisions only.
- P2 owns: `lib/app/router/app_router.dart`, `lib/features/main_screen/**` (new), possibly `lib/features/photo_session/presentation/pages/photo_session_page.dart` (mounting strategy).
- P3 owns: `test/**` navigation/widget tests.

## Not in Scope

- Real business logic for Custom/History/Setting tabs.
- Deep-link subroutes per tab.
- Bottom bar badges, animations, persisted selected tab.

## Model Override

- If needed for deeper tradeoff iteration, set `internal.model.plan`.
