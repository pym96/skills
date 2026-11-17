---
name: executable-contracts
description: Turn recurring mistakes or proposed agent rules into executable contracts. Use when choosing between API constraints, static checks, tests, runtime controls, and delivery gates; not for general debugging or routine test authoring.
---

# Executable Contracts

Define the contract. Prevent violations where practical. Detect and contain the rest.

A skill guides the work; it does not enforce the resulting rule. Enforcement belongs
in the interface, checker, runtime, or delivery system that actually mediates the
behavior. Work within the authorized repository and change scope; this skill does
not grant permission to change security policy, branch protection, or production.

## 1. Ground the contract in a concrete failure

Read the affected interface, implementation, existing checks, and relevant agent
rule before proposing a new mechanism. Identify the observed mistake or requested
constraint and its consequence. Separate reproduced facts from suspected causes.
Do not turn a single workaround or reviewer preference into a universal ban.

Write the smallest contract that captures the requirement:

- **Given:** relevant state, inputs, actors, and dependencies.
- **Must hold:** observable outcome, forbidden effect, or invariant.
- **Violation:** a concrete counterexample and how it would be observed.
- **Scope:** which paths and actors the rule covers, including legitimate exceptions.

Derive expected behavior from the requirement, not from the current implementation
or an LLM's verdict. If the requirement remains subjective, identify the unresolved
judgment instead of manufacturing a deterministic metric.

Done when the contract includes both a violating example and a legitimate example,
or explicitly identifies the missing information that prevents implementation.

## 2. Choose where the contract belongs

First ask whether a small interface or state-model change can remove the invalid
operation. Otherwise choose the least costly mechanism that covers the actual
failure path. Prevention, detection, and containment may need different mechanisms;
do not add every layer by default.

| Failure or requirement | Candidate mechanism | Coverage limit to inspect |
|---|---|---|
| Invalid state or illegal transition | Types, API shape, state machine | Unsafe casts, deserialization, alternate entrypoints |
| Forbidden dependency or syntax | Compiler, lint, dependency-graph check | Unscanned files, suppressions, dynamic loading |
| Wrong observable behavior | Unit, integration, property, or end-to-end tests | Sampled inputs, incorrect oracle, unrealistic substitutes |
| Unauthorized effects or exhausted resources | Permissions, sandbox, quotas, deadlines | Authority of the process, shared resources, cleanup ownership |
| Concurrency or protocol invariant | Model checking or formal proof when justified | Model assumptions and correspondence to implementation |
| Failed change must not advance | CI plus an enforced merge or release gate | Trigger filters, skipped checks, bypass permissions |
| Intent or contextual trade-off | Documentation and human review | Advisory guidance is not enforcement |

Use real dependencies when their interaction is the subject of the contract. Use
controlled substitutes at external boundaries when isolating local behavior; a
mock returning the expected value does not establish real integration correctness.

Prefer existing repository mechanisms. Compare implementation and maintenance
cost, false positives, feedback latency, and residual risk. Do not copy blanket
bans on comments, hooks, or APIs from another team's architecture.

Done when the selected mechanism has a named execution point, coverage boundary,
failure response, and a reason it fits better than the closest alternative.

## 3. Implement the narrowest enforceable change

Reuse the existing language, runner, and build conventions. Keep production policy,
behavioral assertions, resource lifecycle, and runner configuration distinct.
Exercise stable contracts rather than private call order unless the interaction
itself is required behavior.

For an existing codebase, inspect current violations before enabling a new rule.
If migration is needed, define an explicit baseline or scoped rollout that prevents
new violations without silently accepting them. Exceptions need a concrete scope
and reason; do not disable the rule globally to obtain a passing result.

For runtime controls, put timeouts, cancellation, recovery, and cleanup in executable
code with explicit ownership. Test failure during partial setup where relevant.
A test of cleanup is not the cleanup implementation; a polling prompt is not a
durable scheduler.

When updating an agent rule, replace duplicated enforcement wording with a short
pointer to the mechanism and retain any rationale or contextual guidance it cannot
encode. Do not remove guidance until its replacement covers the same requirement.

Done when each targeted contract maps to an implemented mechanism, or is explicitly
reported as advisory, deferred, or blocked. Do not present a proposal as deployed.

## 4. Challenge the mechanism

Run a controlled violating case and a legitimate case. Establish that the violation
is rejected or detected for the intended reason, and that legal behavior remains
possible. For containment, observe the forbidden effect being prevented, not merely
an error message. Use disposable resources; never introduce a failure into production
just to demonstrate a guard.

Exercise plausible bypasses within scope: alternate entrypoints, fixture state,
missing configuration, and failure propagation. Run the focused checks and relevant
existing checks. Broaden validation only for changed behavior or unresolved risk.
If a check cannot run, record it as unverified rather than replacing evidence with
reviewer confidence. A deterministic checker can still encode the wrong contract.

Done when commands and observed results show both detection of the counterexample
and acceptance of legitimate behavior, with remaining gaps stated explicitly.

## 5. Connect the result to delivery

Name who invokes the mechanism and what happens on failure. For CI changes, inspect
actual discovery, trigger filters, exit-code propagation, and required-check settings
within the authorized scope. Do not equate a workflow file, a passing local command,
and an enforced remote gate.

Report only the relevant states: **implemented**, **executed**, and **enforced**,
with evidence for each claimed state. Include the contract, mechanism, negative and
positive results, and residual judgment. Keep execution records in existing project
evidence or the PR; user onboarding documentation should explain usage, not carry
an internal verification transcript.

Done when the recipient can locate the mechanism, reproduce its check, and tell
which failure paths remain dependent on review or unverified assumptions.

## Composition

Read another skill only when its branch is needed:

- `pytest-test-design`: Python fixture, parametrization, and runner design.
- `regression-guard`: bug-fix verification requiring historical red/green evidence.
- `evidence-gated-delivery`: explicitly requested coordination of builders and
  independent reviewers. This skill neither starts workers nor schedules a loop.

If a referenced skill is unavailable, report the missing guidance and use existing
repository conventions within scope. Missing guidance never establishes a passed
check or authorizes bypassing a required review.
