---
name: evidence-gated-delivery
description: Evidence-gated delivery for coordinating builders and independent reviewers against executable acceptance criteria. Use when defining multi-agent acceptance or combining bounded polling with build-review-repair workflows; not for standalone test authoring or general scheduling.
---

# Evidence-Gated Delivery

Advance work on observed evidence, not agent confidence. Reviews can report nonexistent defects or miss real ones. Executable checks constrain judgment, but their assertions, coverage, environment, and provenance also need review.

This skill defines a workflow, not a scheduler or an enforced security boundary. Read the project's role and approval rules first. It does not grant permission to dispatch agents, edit products, change acceptance criteria, merge, or publish.

## 1. Bind the task to observable criteria

Read the authorized task, baseline, scope, role assignments, and budget. Use the project's existing records rather than creating a parallel source of truth.

For each blocking criterion, record an ID/version, inputs or preconditions, observation, pass/fail rule, verification method, and responsible verifier. Derive expected behavior from requirements or an external contract, not the candidate implementation. Identify requirements that need human judgment rather than forcing them into artificial assertions.

**Done when:** each blocker has an observable decision rule and assigned verification responsibility; missing requirements remain explicit gaps rather than invented gates.

## 2. Separate construction, execution evidence, and judgment

- The builder implements within scope and supplies a candidate commit or artifact digest, test commands, results, and known gaps. Its green report supports handoff, not independent acceptance.
- An authorized independent reviewer inspects that exact candidate in a clean checkout/environment, reads original requirements and raw evidence, reruns relevant checks, and adds targeted negative or boundary probes. Keep reviewer probes separately identifiable from the candidate.
- Test runners produce observations; the reviewer checks what the assertions mean and whether the intended path actually ran. A second agent repeating the builder's summary is not independent verification.
- Use the project's required session/process separation. Separate sessions still may share files, credentials, services, and model biases; isolate mutable test resources and record shared dependencies. Different model families or human review are additional measures when required by risk or project policy.
- If independent execution is unavailable, label results self-verified or unverified. Do not simulate a second role in the same conversation and claim independence.

**Done when:** the handoff identifies the immutable candidate, authorized verifier, reproducible environment, and evidence locations without conflating builder reports with verifier observations.

## 3. Resolve findings with evidence

Map each finding to a criterion, affected behavior, reproduction, and observed result. Treat an untested suspicion as a hypothesis. Distinguish product failures from setup failures; inaccessible dependencies and missing logs produce unknowns, not passes.

For a suspected false alarm, reproduce against the specified contract and preserve the result. Do not silence the test or dismiss the reviewer merely because the main suite passes. A credible untested risk stays unresolved; if outside agreed criteria, escalate for a scope decision instead of silently expanding or shrinking the gate.

For suspected missed defects, add a focused counterexample or boundary probe. For bug-fix reproduction and retained regression checks, load `regression-guard`. For Python fixture/test structure, load `pytest-test-design`. If a needed skill is unavailable, report the missing guidance and keep the associated claim unverified until equivalent evidence exists.

Record each criterion as pass, fail, or unverified with command, candidate identity, environment, exit status, relevant assertions/results, and raw log location. Track required human decisions separately. Passing tests establish only the checked behavior under the recorded conditions; no test count proves universal correctness.

**Done when:** each blocking finding has supporting evidence or an explicit unresolved status, and contradictions between review and execution have a documented disposition.

## 4. Use a bounded loop only when requested

If recurring execution is authorized, load the installed `loop` skill for scheduling, cadence, budget, and cancellation. Do not copy its scheduler implementation into this workflow. If unavailable, perform only an authorized one-shot check and report that no recurring execution was started.

Each tick reads current state and evidence before taking at most the next authorized transition:

| Observed state | Next action |
|---|---|
| Builder active | Observe progress; do not dispatch duplicate work |
| Candidate handed off | Dispatch independent verification if authorized and not already active |
| Reproducible failure | Return the finding and evidence to the builder within the agreed repair scope |
| Candidate changes | Bind a new handoff; reassess affected evidence and rerun required gates for the new identity |
| Required checks pass | Obtain the designated verdict; proceed only through existing integration/approval rules |
| Missing evidence or conflicting observations | Investigate within budget or report the blocker; do not infer success |
| Human decision required | Surface the concrete decision and stop active advancement; wait only if explicitly authorized |

Persist candidate identity, active dispatch/run IDs, last observation, and next action in the authorized task record. Repeated ticks must not duplicate dispatches, rerun unchanged expensive suites without cause, or re-ask reviewers until one says yes. A timeout, silence, or majority vote cannot replace a missing gate. Stop at completion, cancellation, or the configured budget; report incomplete work without extending authorization.

**Done when:** each transition has a recorded cause, no duplicate work was launched, and the actual loop status and stop condition are explicit.

## 5. Close on the verified identity

Report the candidate identity, criterion outcomes, independent observations, remaining uncertainty, human gates, and whether scheduling is still active. A repair creates a new candidate; do not reuse an old verdict as acceptance of changed artifacts. Preserve failed evidence as well as successful reruns.

Only the designated authority declares acceptance. Merge or publication is a separate authorized action, even when all checks pass. Do not claim runtime enforcement merely because these rules exist in Markdown.

**Done when:** another person can trace the decision to the exact artifact and rerun its checks, and incomplete or unapproved work is not described as accepted.

## Example

A reviewer reports that cancellation leaves a child process alive. The existing test only asserts a returned `cancelled` status. Reproduce with an actual controlled child and observe its termination against the agreed deadline. If it survives, return the evidence for repair and verify the new candidate independently. If it exits, preserve that result and investigate the reviewer's reproduction conditions before deciding the finding is unsupported. Neither the review text nor the old green test settles the question alone.
