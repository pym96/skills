---
name: regression-guard
description: Regression guard for verifying bug fixes, retaining reproductions as automated tests, and wiring them into existing CI. Use when a user asks to verify a fix, prevent a bug from returning, or automate regression checks; not for open-ended root-cause diagnosis or feature-first TDD.
---

# Regression Guard

Turn a reported defect into a reproducible check that fails for the intended reason on the broken version, passes on the fixed version, and runs on later changes.

Fix verification asks whether this defect is corrected. Regression testing checks whether changes broke existing behavior, including but not limited to recurrence of old defects. CI supplies automated execution and feedback; a workflow file alone is not evidence of a successful run or an enforced merge gate.

## 1. Establish the behavioral contract

Identify the reproduction input, prerequisites, actual behavior, expected behavior, and affected revision. Derive expectations from requirements or a justified external contract, not from what the patched implementation happens to do. Inspect the existing test runner and CI entry points.

Stay within the requested stage: verification-only work does not authorize product changes; CI integration does not authorize changing repository protection or credentials. If the cause or intended behavior is unresolved, report that gap before claiming fix verification.

**Done when:** the defect has an executable reproduction or a specific documented blocker, and an observable pass/fail condition tied to its expected behavior.

## 2. Establish red, then verify green

Run the regression check against the broken revision and the candidate fix under comparable inputs and environments. If the fix already exists, use a disposable worktree or an isolated copy for the old version; never revert the user's working tree. Apply only the necessary test to the broken version and record any compatibility adaptation.

- Red must fail because of the target defect. Import errors, unavailable dependencies, timeouts caused by the harness, and setup failures do not establish reproduction.
- Green must exercise the same behavioral assertion. Do not weaken assertions, widen tolerances without justification, skip the case, or replace the failing dependency with a mock that removes the defect.
- If a broken version cannot be tested, report "candidate passed; reproduction unverified" with the reason. A controlled reintroduction of the defect can provide supplementary evidence, but is not a historical reproduction.
- For intermittent or timing defects, control synchronization and record attempts and failures. One passing run does not establish a fix; use an explicit repeat budget tied to observed reproduction frequency and report remaining uncertainty.

**Done when:** both executions have revision, command, environment and observed result recorded, or the missing half is explicitly marked unverified.

## 3. Retain the smallest effective regression test

Use the lowest test layer that preserves the failure mechanism. A unit test suits local logic; an integration test suits component contracts; an E2E test is appropriate when only the full user flow exposes the defect. Do not require all three layers for every bug.

Reuse a suitable existing test rather than duplicate it. Assert observable behavior, not private implementation structure. Add nearby boundary or negative cases only where the fix could plausibly affect them. Isolate files, ports, databases and child processes; use explicit synchronization rather than arbitrary sleeps. Retain minimal fixtures without secrets or personal data.

Run the focused check and the relevant surrounding suite, including required repository checks. Keep unrelated pre-existing failures separate from new failures; do not delete or relabel them to obtain green.

**Done when:** the case is discoverable by the normal runner, passes in isolation and with the relevant suite, and leaves no owned resources behind. Report any unrun required checks.

## 4. Connect to CI when requested

Prefer the existing workflow and test command. Check that the retained test is actually selected, required setup is present, and failures propagate as a nonzero job result. Check event, branch and path filters against the changes the test protects. Do not hide failures behind continue-on-error or unconditional success.

If no CI exists, propose or implement the smallest workflow within the user's authorized scope. External credentials, special hardware or paid services must not be silently assumed. Retain useful failure diagnostics while excluding secrets.

Validate configuration locally. When an authorized push or PR triggers CI, inspect the run for the exact candidate commit and confirm the relevant job and test ran. If remote execution is unavailable, say "CI configured; remote run unverified." Do not call the workflow a required merge gate unless repository rules actually enforce it.

**Done when:** the trigger and test-selection path are established, local checks are recorded, and remote execution is either evidenced for the candidate SHA or explicitly unverified.

## 5. Hand off the evidence

Report concisely:

- Defect and expected behavior.
- Broken/candidate revisions and red/green commands with results.
- Retained test path and affected-suite results.
- CI workflow/job/run link, or why this stage was not requested or remains unverified.
- Remaining limitations, including flakes, environmental gaps or skipped checks.

If independent acceptance is required, provide the fixed candidate identity and raw evidence to the designated reviewer. Builder self-tests support the handoff; they do not constitute independent acceptance. Never invent a reviewer or silently expand authority to merge or publish.

**Done when:** another engineer can locate and rerun the evidence, and the report distinguishes what was verified from what remains unknown.

## Example

A cancellation bug leaves a worker child running. Reproduce it with a controlled long-running child, cancel the parent operation, and check that the child exits within the agreed deadline. A test that checks only the returned "cancelled" status misses the defect. Run the process-level test on both versions, retain it in the integration suite, and include that suite in CI when authorized.
