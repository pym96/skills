---
name: systems-design-reasoning
description: Systems design reasoning through resource sharing, isolation, composition, and abstraction. Use when comparing infrastructure architectures or explaining how resource and boundary choices produce whole-system behavior; not for routine implementation or resume wording.
---

# Systems Design Reasoning

Use the user's heuristic as a set of questions, not a universal law:

> Share what is common. Isolate what must be independent. Compose what already exists. Abstract what is complex.

Optimize for the requested system outcome, not maximum sharing, isolation, reuse, or abstraction. Keep analysis proportional: a conceptual question needs a short causal explanation; an architecture decision needs explicit alternatives and evidence. Analysis alone does not authorize implementation or experiments.

## 1. Establish the system and its constraints

Identify the workload, desired outcome, constrained resources, owners or tenants, and relevant trust and failure boundaries. State the observation window and what lies outside the system. Use available context; label missing quantities as assumptions and ask only when they change the choice.

Separate workload independence from an implementation guarantee. Finite resources motivate management, but do not prove pooling is preferable; scale can also justify simpler boundaries or dedicated resources.

**Done when:** the outcome and constraints explain what a good design must preserve, and the baseline is concrete enough to compare.

## 2. Map resources and boundaries

For each resource material to the decision, identify its owner, consumers, mutable state, allocation/lifetime, and access path. Distinguish reusing an implementation from sharing a live resource: two isolated deployments can reuse the same code without sharing memory or credentials.

Use this compact inventory when multiple resources interact:

| Resource/state | Shared by whom | Required independence | Enforcement mechanism | Failure or contention impact |
|---|---|---|---|---|

Name the kind of independence: scheduling, memory access, filesystem visibility, authorization, consistency, quotas, or fault containment. Do not equate a separate task, session, process, transaction, or namespace with every kind of isolation. Trace the actual read/write/control paths, including inherited credentials and shared services. Mark uninspected mechanisms as unverified.

**Done when:** every material sharing relationship has a stated boundary and mechanism, or an explicit gap; “isolated” never stands alone as evidence.

## 3. Apply the four lenses to actual alternatives

| Lens | Decision to make | Cost or failure to examine |
|---|---|---|
| Reuse and sharing | What can reuse code or share expensive capacity without violating the contract? | Contention, coordination, noisy neighbors, correlated failures, and cross-tenant state leakage |
| Isolation | What state, authority, capacity, or failure must remain independent? | Extra copies, idle capacity, startup/communication overhead, and enforcement complexity |
| Composition | Which existing mechanisms can meet the requirement together? | Mismatched ownership, timeout, cancellation, retry, cleanup, and consistency contracts |
| Abstraction | Which stable interface hides details that callers need not manage? | Hidden costs/failures, weak observability, leaky guarantees, and difficult escape paths |

Explain each proposed mechanism as constraint → mechanism → expected effect → cost. Keep unrelated lenses out of a narrow answer rather than inventing four changes. A wrapper is not automatically a useful abstraction, and combining individually correct components does not prove an end-to-end guarantee.

Compare the simplest viable baseline with credible alternatives. State which requirement or workload change would reverse the preference; do not invent numeric thresholds to make the comparison look precise.

**Done when:** the recommendation has a causal advantage under stated constraints, an acknowledged cost, and a condition that would favor another design.

## 4. Follow effects across the whole system and over time

Trace at least the consequential interaction introduced by the choice: where does cost move, who pays, and when does it become visible? Distinguish a causal chain from a feedback loop; only call it a loop if the effects return to influence an earlier variable.

When relevant, examine reinforcing feedback, balancing feedback, delays, bottleneck shifts, saturation, and failure propagation. For example, added retries may amplify overload; a delayed scaling response may overcorrect. Treat these as hypotheses unless the workload and measurements establish them. Local speedups and passing component checks do not by themselves establish end-to-end improvement.

**Done when:** the important downstream effect and time horizon are explained, with measured facts separated from predictions and unknowns.

## 5. Produce a decision that can be checked

For a design task, return the outcome/constraints, resource-boundary map, selected mechanism and alternative, cost transfer, and smallest useful validation plan. For teaching, use the same reasoning in one worked example and a concise takeaway rather than a full report.

Tie each important guarantee to an observation: what input or fault would challenge it, what should happen, what must not happen, and what result would reject the claim? Use realistic dependency boundaries; a mocked success cannot establish actual process termination or infrastructure isolation. Propose only the checks needed for unresolved claims; run them only within the task's authorization. Do not promote illustrative examples into project facts.

**Done when:** the reader can explain why the design fits, when it stops fitting, and what evidence is still needed.

## Worked example: pooled agent execution

Suppose several tenants need shell execution with bounded latency and no cross-tenant file or credential access. A shared worker pool may reuse idle capacity, but separate conversation IDs do not enforce those access guarantees. Compare a common queue with independently restricted execution environments against dedicated workers; inspect actual mounts, identities, credentials, and resource controls before claiming isolation.

A composed executor needs an explicit cancellation-and-cleanup contract. Its API should expose job identity, status, deadlines, and actionable failures while hiding environment construction details. Pooling may reduce idle capacity yet increase queueing and correlated-failure impact; measure end-to-end tail latency and challenge cross-tenant access and cleanup under the stated threat model. If those checks are only proposed, report a design hypothesis, not a verified secure platform.
