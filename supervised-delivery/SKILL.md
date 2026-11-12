---
name: supervised-delivery
description: Run a bounded Master–Working–Regulator workflow with recurring progress checks and independent evidence-based review.
disable-model-invocation: true
---

# Supervised Delivery

A user-invoked entrypoint for coordinated work: Master controls scope and progression, Working produces the candidate, and Regulator independently checks it. Independent review improves confidence; it does not guarantee correctness.

## 1. Bind the invocation

Accept `$supervised-delivery <task>`, with optional interval, deadline, resource budget, and completion condition. The invocation requests this collaboration pattern for that task only; it does not change defaults for every future conversation. A request to write or discuss this skill does not activate it. If the task is missing, ask for the task instead of resuming unrelated work.

Read applicable project rules and current task records. Preserve existing immutable roles and WorkOrder requirements. An invocation does not turn a Researcher or Builder session into Master; if incompatible, provide a concrete handoff for an authorized coordinator and report the mismatch before dispatch.

Resolve the target artifact, allowed write paths/actions, baseline, acceptance conditions, and available budget from context. Do not ask again for settled authorization. Distinguish delivery from merge, deployment, publication, and disclosure; include those only when already authorized.

**Done when:** the task, coordinator authority, boundaries, and stopping condition are explicit.

## 2. Load the workflow mechanisms

- Load `evidence-gated-delivery` for criteria, immutable handoffs, independent checks, findings, repair transitions, and final evidence. It is the single source of truth for those rules.
- Load the installed `loop` skill for cadence defaults, execution mechanism, wait behavior, deadlines, and cancellation. Use one coordinator loop; do not nest recurring loops in each worker.
- Use available agent-dispatch tools. When using Orca workers, load the installed `orchestration` skill for its actual dispatch and message protocol. Do not assume that knowing a session ID provides a callable transport.

If either core skill is missing, report its name and prepare the bounded task handoff without claiming this workflow is running. If agent dispatch or required independence is unavailable, do not substitute role-play or silently collapse all work into one agent. A proposed one-shot or self-reviewed fallback must be labeled and accepted as a changed workflow.

**Done when:** required guidance is loaded and actual scheduling/dispatch capabilities are identified, or the missing capability is clearly reported without activating a partial workflow.

## 3. Assign three distinct responsibilities

| Role | Owns | Must not substitute for |
|---|---|---|
| Master | Outcome, dependencies, scope, budget, dispatch, progress state, and authorized final integration | Building the candidate or independently verifying its own work |
| Working | Implementation or research/writing deliverable, self-checks, raw evidence, immutable handoff | Regulator acceptance |
| Regulator | Independent inspection of the candidate against original criteria, targeted counterexamples, and evidence-backed verdict | Repairing the candidate it is reviewing |

Bind real worker/session IDs to roles, following the project's separation requirements. Give Working and Regulator the original task and criteria directly; Regulator must not depend solely on Working's interpretation. Independent conversations are not automatically isolated filesystems or credentials: select clean snapshots/worktrees and separate mutable test resources as needed.

Use existing role/task templates if available. Otherwise send a compact assignment containing: objective, inputs/baseline, allowed scope, expected artifact, criteria and verification responsibilities, budget/deadline, and handoff destination. Give the human a concrete scope-and-output summary before dispatch.

**Done when:** assignments are concrete, role identities and task IDs are recorded, and independence can be achieved by the available execution mechanism.

## 4. Route domain work, then supervise

Load only skills required by the deliverable, and pass the relevant guidance to its owner:

- Architecture trade-offs: `systems-design-reasoning`.
- Bug-fix evidence: `regression-guard`; Python test organization: `pytest-test-design`.
- Project/interview explanation: `engineering-judgment`.
- Other work: select applicable installed guidance or use the task's stated method; do not invent dependencies.

Match evidence to the task. Code may need executable tests; research needs original-source checks and counterevidence; writing needs factual/source and brief compliance checks. Do not fabricate a pytest gate for non-executable claims. Load optional domain skills only when present and relevant; their absence must not be mistaken for evidence.

Dispatch Working within scope. Regulator may prepare from the original criteria while work proceeds, but reviews the identified candidate only after handoff. Start the coordinator's bounded loop using `loop`; apply the transition rules in `evidence-gated-delivery`. Process worker completion events promptly when supported rather than waiting for a polling interval unnecessarily.

Maintain one authorized task record containing role IDs, active operations, candidate identity, criterion version, remaining budget, last observation, and next action. On resume, reconcile actual worker and scheduler state before any redispatch. Recovery does not reset budgets or revive expired authorization. Ask for missing decisions only when they block the next action; elapsed waiting never supplies approval.

**Done when:** work advances through observed build/review/repair events without duplicate dispatch or responsibility crossover, and each active operation has an owner and deadline.

## 5. Close the run

Apply `evidence-gated-delivery` to the final candidate and verdict. Close the owned loop using `loop`; settle or stop owned workers and other operations through available controls, reporting anything whose termination cannot be confirmed. Limit cleanup to task-owned resources and preserve evidence and user changes.

Return the artifact/version, what Working delivered, what Regulator independently established, unresolved or human-gated items, and actual loop/worker status. At a deadline, deliver an incomplete handoff rather than declaring success or silently extending execution. Do not equate a technical pass with authorization to publish.

**Done when:** the final status is traceable to evidence and every owned activity is finished, confirmed stopped, or explicitly disclosed as still active/unknown.

## Invocation example

`$supervised-delivery Improve the request-timeout handling in the specified repository. Master coordinates; Working fixes it; a separate Regulator verifies the candidate. Check progress every 5 minutes, stop after 2 hours or verified completion, and do not merge or publish.`

Use this same entrypoint for a research memo or other scoped deliverable by changing the task and its evidence requirements. Invocation syntax is a prompt convention; the installed loop and orchestration capabilities perform the actual execution.
