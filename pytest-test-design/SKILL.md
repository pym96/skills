---
name: pytest-test-design
description: Design or refactor Python tests around behavioral contracts, isolated fixtures, parametrization, and minimal pytest extensions. Use when organizing a pytest suite, reducing test coupling or duplication, or choosing fixtures versus markers and hooks; not for open-ended debugging or replacing an existing non-Python test stack.
---

# Pytest Test Design

Keep production behavior, test assertions, resource lifecycle, and runner configuration distinct. Separate files help organization; low coupling comes from testing stable contracts rather than private implementation details. High cohesion means each test or helper has one clear responsibility.

## 1. Locate the contract and existing conventions

- Read the affected production interface, nearby tests, pytest configuration, and applicable CI job before proposing structure.
- Identify observable inputs, outcomes, failure behavior, and external dependencies. Derive expectations from requirements, not by copying the implementation into assertions.
- Keep the existing runner and repository conventions. Do not introduce pytest into an unrelated stack or reorganize the whole suite for a local change.
- For a bug fix requiring historical red/green evidence, use `regression-guard` if available. If unavailable, report the missing workflow and do not claim historical verification from a passing test alone.

Done when the target behavior, test layer, affected paths, and validation command are explicit.

## 2. Choose the smallest boundary that preserves the behavior

- Put business behavior in production code and behavioral expectations in tests. Avoid production imports of pytest, test-mode branches, or exposing private state solely to satisfy a test.
- Test through a stable interface. Use unit tests for local rules, integration tests where real component interaction matters, and end-to-end tests where the full user path matters. Do not require all three for every change.
- Substitute expensive or nondeterministic dependencies at meaningful boundaries, such as clocks, networks, or external services. Keep real integrations where their behavior is the subject of the test.
- Do not mock every internal call or assert call order unless that interaction is itself a requirement. Do not add abstraction layers merely to avoid a few lines of test setup.

Done when a behavior-preserving internal refactor should leave the test valid, while a violation of the target contract should make it fail.

## 3. Assign each pytest mechanism a specific job

| Mechanism | Responsibility | Avoid |
|---|---|---|
| Test function and assertions | Explain one scenario and its expected outcome | Hiding the behavior under a generic helper framework |
| Fixture | Provide a dependency and own its setup/cleanup | Shared mutable state or unrelated business assertions |
| `@pytest.mark.parametrize` | Exercise an explicit input/expected-output matrix | Generating expected values using the same logic under test |
| Markers | Label tests for selection or runner behavior | Treating labels as isolation or allowing important tests to disappear from CI |
| Hooks | Extend pytest runner/plugin lifecycle when a concrete requirement needs it | Moving ordinary setup into global hooks or rewriting failed results as success |

A decorator is Python syntax, not a testing architecture. Choose a mechanism for its responsibility, not because it is reusable.

- Prefer the narrowest fixture scope that meets the need. Broader scope saves setup work but introduces shared lifetime; isolate per-test state even when a service is session-scoped.
- Use `tmp_path`, unique resource names, and explicit ownership for files, databases, ports, and processes. Give tests disposable resources instead of production credentials or shared writable data.
- Use `yield` fixtures or appropriate context managers for cleanup. Code after `yield` does not run if setup raises before reaching it; protect partially acquired resources with incremental cleanup or smaller fixtures.
- Keep fixtures local until reuse justifies a nearby `conftest.py`. Register custom markers in project configuration. Add hooks only after fixtures, parametrization, and existing plugins prove insufficient.

Done when each abstraction has a named responsibility and every acquired resource has a cleanup path, including setup failure.

## 4. Verify behavior and independence

- Run the focused test and the relevant existing suite. Check actual outcomes, not merely successful collection or process startup.
- When changing fixture lifetime or mutable state, run affected tests individually and together; repeat or reverse relevant order when there is a specific leakage concern. Passing these checks is evidence, not proof of universal order independence.
- Cover meaningful boundaries and failure cleanup. Avoid tests that only mirror the implementation or confirm mocked return values.
- Record failures separately from unrelated existing failures. Do not weaken assertions, add skips, or extend sleeps to manufacture a green result.

Done when the report includes commands, observed results, and any unverified behavior or resource leaks.

## 5. Connect to CI within the requested scope

- Reuse the existing CI workflow and documented environment. If CI changes are requested, ensure its command discovers the intended tests and propagates failures; review path filters and marker selection.
- CI executes checks; it does not make assertions correct or guarantee coverage. A workflow file does not prove a remote run succeeded, and a successful run is not automatically an enforced merge gate.
- If only local test design was requested, report the existing CI relationship or gap without adding unrelated infrastructure.

Done when the handoff names the changed tests, fixture/hook trade-offs, local validation, and CI status. Distinguish configured, executed, and enforced; mark remote execution unverified unless an actual run was observed.

## Official references

Consult these for version-specific behavior rather than relying on remembered APIs:

- [Fixture lifecycle and safe teardown](https://docs.pytest.org/en/stable/how-to/fixtures.html)
- [Parametrization](https://docs.pytest.org/en/stable/how-to/parametrize.html)
- [Writing hook functions](https://docs.pytest.org/en/stable/how-to/writing_hook_functions.html)
