# System design interview branch

1. Establish the objective and decision-driving constraints before selecting technologies. Ask for missing inputs that would change the architecture; otherwise declare workable assumptions. In mock-interview mode, ask one question at a time. For a requested complete answer, proceed under labeled assumptions.
   **Completion:** Success criteria and the constraints governing the first design choice are clear.

2. Propose the simplest end-to-end baseline. Add a mechanism only in response to an identified limitation under those constraints. Compare credible alternatives and state when the choice would change.
   **Completion:** Each major component has a causal role, and the design's critical execution or data path can be explained.

3. Define how to validate the proposal: relevant metrics, representative and adverse inputs, acceptance criteria, and how to respond to failure. Include monitoring, fallback, or staged rollout where the scenario requires them. Treat numerical targets as assumptions or proposals unless supplied, and define how unknown thresholds would be measured.
   **Completion:** Deliver a coherent design answer with trade-offs, material failure boundaries, and a testable validation plan. Do not present predicted benefits as measured results.

If the candidate has not seen the problem before, guide them through objectives, constraints, controllable variables, baseline limitations, and mechanisms. Evaluate the reasoning and its sensitivity to assumptions rather than recall of a named architecture.
