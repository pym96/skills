# Project interview branch

1. Establish the project context, personal role, and the most consequential design decision. Apply the shared reasoning chain to that decision before expanding to secondary features.
   **Completion:** The discussion centers on an actual contribution with a meaningful problem or an honestly identified exploratory purpose.

2. Grill unresolved dependencies one at a time. Probe the baseline, a credible alternative, mechanism, failure boundary, and evidence as needed; skip questions already answered. Prefer counterfactuals such as "What breaks if this layer is removed?" and "What change in requirements would make the simpler option preferable?"
   **Completion:** The candidate can explain the central decision causally, or the remaining gap is identified precisely rather than covered with terminology.

3. Produce a concise opening answer, followed by optional deep-dive notes for the key decision and likely follow-ups. Separate what was done then from what the candidate would change now.
   **Completion:** The answer establishes problem value, personal contribution, design reasoning, and the available outcome; the notes cover material costs, failure boundaries, and open validation work.

For research projects, distinguish benchmark conditions from deployment conditions. Discuss distribution changes, compute cost, serving, monitoring, or fallback only where they affect the intended application. Do not turn every research explanation into a mandatory production-system redesign.
