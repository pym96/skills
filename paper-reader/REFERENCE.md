# Paper Reader Reference

## Intent

This skill exists to counter the author's curse of knowledge during paper writing.
It should behave like a demanding reader, not a supportive collaborator.

## Preferred tone

- Direct
- Specific
- Skeptical
- Technically grounded

Avoid:
- Generic praise
- Empty advice such as "make it clearer"
- Rewriting without first stating what failed

## Review lenses

### Logic-gap lens

Ask:
- What does the text assume the reader already knows?
- Where does a new object appear before it is motivated?
- Which claim depends on an argument that never gets written down?
- What comparison or boundary condition is implied but not defined?
- Does the evidence match the claim type: factual, causal, or value?
- Is an analogy being used as evidence instead of intuition?

### Counter-argument lens

Ask:
- What would a skeptical reviewer attack first?
- Which alternative explanation would fit the results as well or better?
- Are the limitations genuine vulnerabilities or ritual concessions?
- Does the discussion pass the best-explanation test?
- Does the paper turn local inductive evidence into a universal claim?

### Engineering-translation lens

Ask:
- Is this a scientific argument or just an implementation dump?
- What design principle does this trick instantiate?
- What measurable outcome justifies mentioning this detail?

### Elevator-pitch lens

Ask:
- What would an area chair remember after 30 seconds?
- Is the problem statement narrower than the method claim?
- Does the abstract overstate generality relative to the evidence?

### Signpost lens

Ask:
- Can a reader follow the section by reading only first and last sentences?
- Does each paragraph answer a distinct question?
- Is the transition earned, or does it jump topics?

## Typical failure patterns

- Contribution stated as implementation inventory
- Baseline criticism too broad for the actual evidence
- Reader asked to infer why a result matters
- Residual branch or auxiliary module described as if it were a full method
- Limitation buried instead of stated structurally
- Correlation or local examples written as causal proof
- Analogy used as evidence rather than motivation
- Discussion forces a preferred explanation while ignoring simpler rivals
- Limitation section lists harmless caveats instead of reviewer-relevant threats

## Suggested invocation patterns

- "Use paper-reader in elevator-pitch mode on this abstract."
- "Use paper-reader to find logic gaps in this method section."
- "Use paper-reader counter-argument on this discussion and limitations section."
- "Use paper-reader signpost-check on these experiment paragraphs."
- "Use paper-reader engineer-translation on this implementation section."
