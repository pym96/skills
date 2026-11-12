---
name: supervised-delivery
description: Compatibility entrypoint for the evidence-gated-delivery collaboration workflow.
disable-model-invocation: true
---

# Supervised Delivery — Compatibility Entrypoint

The canonical workflow is now `evidence-gated-delivery`. Load that installed skill and forward the user's task, timing, and constraints unchanged. Its invocation, role, evidence, and stopping rules are the single source of truth. If it is missing, report the missing skill without starting work.

Prefer `/evidence-gated-delivery 5m 2h best effort` for future runs. Preserve existing explicit task/deadline arguments; do not invent a schedule when none was requested. A request to edit or discuss this entrypoint does not activate a run.
