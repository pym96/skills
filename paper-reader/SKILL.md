---
name: paper-reader
description: "Review academic paper drafts through explicit reader roles: elevator-pitch, logic-gap, counter-argument, signpost-check, and engineer-translation. Use when writing or revising papers and the user asks for reviewer perspective, logic-gap checking, discussion or limitations threat modeling, paragraph signposts, or clearer academic prose."
---

# Paper Reader

Use this skill to switch from author mode to reader mode when revising paper drafts.
Pick one workflow based on the section type and the user's request.
For multi-section or deep reviews, use [REFERENCE.md](REFERENCE.md) for lens prompts and failure patterns.

## Quick start

- If the user gives `Abstract` or `Introduction`, use `elevator-pitch`.
- If the user gives `Method`, formulas, or system claims, use `logic-gap`.
- If the user gives `Discussion`, `Limitations`, or result interpretation near the end of `Experiments`, use `counter-argument`.
- If the user gives `Implementation` or systems detail, use `engineer-translation`.
- If the user gives `Related Work`, rebuttal structure, or long sections whose organization is hard to follow, use `signpost-check`.
- If the user does not specify a mode, infer it from the section and state the chosen mode in one short line.

## Output contract

Unless the user asks otherwise, structure the response as:

1. `Findings`
2. `Why it matters`
3. `Rewrite suggestions`

For review-style outputs, prefer harsh but concrete criticism over encouragement.
Quote only short phrases from the user's text when necessary for localization.

## Workflows

### `logic-gap`

Use for `Method`, formulas, algorithm flow, and system design claims.

Tasks:
- Scan sentence by sentence for unstated assumptions and skipped reasoning.
- Flag variables, symbols, modules, or branches introduced without definition.
- Run a `claim-type audit`: separate factual, causal, and value claims, then flag proof that does not match the claim type.
- Run an `analogy-as-evidence audit`: flag analogies, inspirations, or resemblances that are doing proof-work without direct evidence.
- Ask whether the coupling boundary to prior components is clear.

Return:
- `Logic-gap list` with local references
- `Missing definitions`
- `Claim-type mismatches`
- `Minimum fixes needed to make the section reviewable`

### `counter-argument`

Use for `Discussion`, `Limitations`, result interpretation, and the end of `Experiments`.

Tasks:
- Build a `reviewer threat model`: identify what a skeptical reviewer would attack.
- Check whether limitations are genuine vulnerabilities or superficial concessions.
- Run a `best-explanation test`: ask whether the author's explanation is the simplest complete account of the evidence.
- Flag rival explanations, missing boundary conditions, and slippery-slope claims that overstate implications.
- Distinguish local inductive evidence from deductive or universal claims.

Return:
- `Anticipated objections`
- `Alternative explanations ignored`
- `Superficial limitations`
- `Suggestions for acknowledging and neutralizing these threats`

### `engineer-translation`

Use for `Implementation Details`, optimization tricks, CUDA/PyTorch discussion, and systems paragraphs.

Tasks:
- Detect prose that reads like code comments or lab notes.
- Lift low-level implementation detail into design rationale.
- Force a `So what?` answer for each engineering decision.
- Connect implementation choices to accuracy, speed, memory, robustness, or usability.

Return:
- `Too low-level passages`
- `Why the current phrasing is weak`
- `Rewrite of the two worst passages`

### `elevator-pitch`

Use for `Title`, `Abstract`, `Introduction`, and submission metadata such as `Benefit` or `Contribution`.

Tasks:
- Summarize the paper's core contribution in one sentence.
- Check whether the summary matches the user's intended claim.
- Test whether `limitation -> gap -> solution -> evidence` flows naturally.
- Flag vague novelty language, weak motivation, and over-claiming.

Return:
- `One-line summary the reader would retain`
- `Where the framing fails`
- `How to sharpen the story`

### `signpost-check`

Use for long `Related Work`, long `Experiments`, discussion organization, and rebuttal drafts.

Tasks:
- Extract each paragraph's opening sentence and closing transition.
- Judge whether the section remains logically traceable from those lines alone.
- Flag paragraphs whose topic sentence does not orient the reader.
- Suggest better signpost sentences and transitions.

Return:
- `Paragraph map`
- `Broken transitions`
- `Suggested topic sentences`

## Escalation rule

If multiple workflows apply, use the most reader-critical one first:

1. `elevator-pitch`
2. `logic-gap`
3. `counter-argument`
4. `signpost-check`
5. `engineer-translation`

If the user asks for deep revision, first critique, then rewrite.
