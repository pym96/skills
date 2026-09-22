# Define the next investment

## 1. Specify a bounded task

For either a validation task or a project change, record:

| Field | Required content |
| --- | --- |
| Fit-map entry | The role task and problem basis this investment addresses. |
| Gap | What exists; whether evidence or implementation is missing. |
| Minimum task | The smallest experiment or change and its baseline. |
| Acceptance | What will be measured, under which conditions, and what result changes the decision. Label proposed targets. |
| Cost | Effort, uncertainty, dependencies, and fit to the available time; use relative effort if the budget is unknown. |
| Stop or pivot | When to abandon, simplify, or redirect the task. |
| Narrative payoff | What a successful result could support in the application, explicitly conditional until completed. |

**Done when:** Every recommended task has these fields; no feature is justified solely by a technology keyword.

## 2. Prioritize

Rank by role relevance, strength of demand evidence, uncertainty reduction, effort, and reuse across target roles. Explain the decisive trade-off rather than assigning arbitrary numerical scores. Select a bounded first task, not an expanding backlog.

- Cancellation exists but child-process behavior is untested: test it before proposing a runtime rewrite.
- A reconstruction project is weakly related to a retrieval role: consider a different project before adding a nominal retrieval component.

**Done when:** The user can tell why the first task is worth doing before the alternatives, or why no change is warranted.

## 3. Evaluate executed work

Compare actual results against the task's baseline and acceptance method. Record evaluation conditions and limitations; distinguish failed acceptance from an incomplete or blocked evaluation. Return these observations to the main skill's feedback loop.

**Done when:** Each executed task has an observed outcome and a supported continue, stop, or pivot decision—or a specific blocker. Expected benefits are never recorded as measured results.
