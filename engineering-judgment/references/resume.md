# Resume branch

1. Select contributions relevant to the target role. Separate personal contribution from team context and prioritize the strongest supported value.
   **Completion:** Each selected contribution has a clear owner and a reason the audience should care.

2. Write concise bullets using Problem or Constraint → Design → Result where the material supports it. Lead with the most persuasive element rather than forcing a fixed sentence order. Retain technical names that expose a meaningful mechanism or match the role; remove inventory that adds no explanatory value.
   **Completion:** Each bullet communicates a contribution and its significance rather than merely listing features.

3. Review factual implications and prepare the most likely follow-up for each substantive bullet. Keep preparation notes separate from copy-ready text, and omit them for a wording-only request unless a material gap needs flagging.
   **Completion:** Deliver copy-ready bullets. Where outcomes are unavailable, state the implemented capability or design purpose without manufacturing an improvement; suggest the smallest useful validation separately.

## Calibration example

Given an implemented cancellation mechanism with no measured reliability result:

- Useful: "Designed cancellation propagation for long-running agent tools to address uncontrolled execution risk."
- Unsupported: "Eliminated orphan processes and guaranteed safe execution."

If tests also verify child-process termination in defined scenarios, describe those observations. Do not silently convert their coverage into a universal guarantee. A risk can motivate engineering before a production incident occurs.
