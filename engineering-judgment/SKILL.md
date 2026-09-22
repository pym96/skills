---
name: engineering-judgment
description: Engineering judgment for technical resume bullets, project interview deep dives, and system design interview answers. Use when connecting technical work to problem value, design trade-offs, and evidence; not for resume layout or routine implementation.
---

# Engineering Judgment

Turn technical experience into a persuasive account of why a problem matters, why a design fits its constraints, and what establishes its effectiveness.

## Shared principles

- **Sell the contribution.** Use confident language, foreground personal ownership, and explain the strongest defensible significance of real work. A resume is not an experimental report. Do not invent implementations, measurements, responsibilities, deployments, or historical decisions. Retrospective analysis can strengthen an explanation without pretending a comparison was performed at the time.
- **Earn the complexity.** Start with the simplest plausible baseline. If it meets the requirements, say the more complex design lacks demonstrated necessity. Reframe the contribution around exploration, implementation quality, or a concrete future constraint; do not invent a baseline failure.
- **Name the value.** Research, engineering, and learning value are legitimate. Prioritize what matters to the target role without presenting one as another. Deployment analysis is not a deployment outcome.
- **Compare live alternatives.** Compare credible competitors rather than a fixed number of straw men. Explain which constraint would reverse the choice. Use qualitative switching conditions when numerical thresholds are unknown.
- **Explain the mechanism.** Connect each important technical choice to the constraint it addresses and describe how it changes behavior. Technology names alone do not establish a contribution.

## Process

### 1. Select the deliverable

Infer the target audience, requested artifact, and branch from the conversation. Read only the relevant reference:

- Resume writing or revision: [references/resume.md](references/resume.md).
- Explaining or grilling an existing project: [references/project.md](references/project.md).
- Answering a hypothetical system design question: [references/system-design.md](references/system-design.md).

For a combined request, share the analysis and load each requested branch. Do not run an interview merely because the user asks for a quick rewrite.

**Completion:** The deliverable and applicable branch are identified; ask only if ambiguity materially changes the work.

### 2. Build the reasoning chain

Use this chain to find gaps, not as a template that every final sentence must fill:

| Element | What to establish |
| --- | --- |
| Problem | Who or what is affected, why it matters, and what kind of value solving it creates. |
| Constraint | Why the simplest baseline does or does not suffice under actual requirements. |
| Decision | The chosen approach, its credible alternatives, and conditions that would change the choice. |
| Mechanism | How the design addresses the central tension; where it can fail. |
| Evidence | Observed results and their scope for existing work; a validation plan for a proposed system. |

Inspect available, relevant artifacts before asking questions that files can answer. Keep a working distinction between user-reported facts, artifact-supported facts, retrospective reasoning, and proposed work. Do not require repository proof for every user-reported contribution or clutter the final artifact with these labels.

When grilling, ask one question per turn and wait. Target the highest-impact unresolved dependency, include a recommended answer or reasoning direction, and challenge vague answers with a concrete scenario. Recommendations are proposals, not facts about the user's history. Carry forward settled answers.

**Completion:** Each element relevant to the requested deliverable has a usable answer or an explicit gap. Missing evidence need not block a useful draft; never silently fill it with invented history.

### 3. Produce and challenge the artifact

Apply the selected branch's output and completion criteria. Match the user's language unless another output language is requested.

Challenge the strongest claim: would the wording survive a question about ownership, baseline, mechanism, or result? Narrow misleading factual implications while preserving confident positioning. A tested behavior, a benchmark improvement, and production reliability are different outcomes.

**Completion:** The requested artifact is delivered, each concrete claim respects its known scope, and material unresolved gaps are identified separately with a practical next action. In an ongoing grill, continue one question at a time until relevant dependencies are resolved or the user asks to wrap up; then summarize remaining gaps.
