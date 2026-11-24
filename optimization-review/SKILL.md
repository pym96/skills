---
name: optimization-review
description: Review a proposed optimization to an existing system when deciding whether to replace the current implementation or checking a claimed improvement against caller guarantees and workload costs.
---

# Optimization review

1. **Identify what a caller can rely on.** Pick one operation affected by the change. Describe an input and an observable outcome, including the meaning of success. Consider freshness, ordering, side effects and failure only where the change could affect them. Record which differences the contract permits. Finish with a concrete sequence of operations that would expose a broken guarantee. If a proposal needs a weaker guarantee, present that as a product decision before counting its savings.

2. **Establish a baseline for the target workload.** Name the current implementation, the cost worth reducing, its unit and the workload over which it matters. Include the frequency of reads, writes or failures when that frequency could reverse the decision. Identify the measurement behind the baseline or label it as an estimate.

3. **Trace where the work moves.** Compare the baseline with the proposed change. Follow one request and one relevant update or failure. Identify the changed representation, when the work happens, and who owns any new state and maintains it. Account for setup and upkeep over the same observation window as the savings. State a condition under which the baseline wins. Quantify it when the units and inputs support the comparison.

4. **Decide from two observations.** Specify a behavioral check using the sequence from step 1, and a cost comparison with equivalent inputs and guarantees. Report observed results separately from predictions. Where evidence is missing, name the smallest check that could change the decision. Close with a recommendation to adopt the change, keep the baseline, or defer the choice pending that check.

**Example.** A code search tool promises that the next search sees a completed edit. Rename a unique symbol, wait for the edit acknowledgment and search for its new and old names. A background index can answer quickly yet still miss the new name or return the old one. One candidate design records the indexed file revision and scans changed files until indexing catches up. Include those fallback scans and index maintenance when comparing it with scanning the whole repository. A warm, read-only benchmark leaves out exactly the cost introduced to preserve freshness.
