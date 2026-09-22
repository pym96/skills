---
name: write-method-causally
description: Extract, audit, and rewrite academic method descriptions as section-aware causal narratives connecting problem objects, engineering mechanisms, representations, objectives, and scientific purposes. Use when drafting or revising an Abstract, Highlight, Contributions, Method overview, algorithm, or implementation passage; separating How from Why; making method prose crisp rather than procedural; converting component inventories into research prose; or checking causal bridges and claim strength.
---

# Write Method Causally

Turn implementation sequences into scientific arguments at the level of detail
appropriate to the paper section. Recover the causal architecture before
rewriting, but expose that analysis only when the user asks to inspect it.

## Core model

Use this adaptable chain:

```text
problem object
-> identify or assign it with mechanism A
-> construct representation B with mechanism C
-> optimize through objective D
-> compose or decode the result
-> obtain desired system property E
```

Omit stages the method does not contain. Never invent a stage or guarantee to
complete the template.

Distinguish three roles:

- **Scientific role**: the problem, representation, capacity, constraint, or
  property being discussed.
- **Technical realization**: the algorithm, encoding, module, loss, or operation
  that implements it.
- **Causal bridge**: why that realization should serve the scientific role.

Technical vocabulary is not rationale. Force a `So what?` answer for each
engineering choice.

## Workflow

### 1. Choose writing depth

Infer the mode from the section and user intent. Ask only when ambiguity would
materially change the rewrite.

| Mode | Default context | Unit of exposition | Priority |
|---|---|---|---|
| `Compression` | Abstract, Highlight, teaser, contribution pitch | One sentence per conceptual transformation | Recall and causal compression |
| `Overview` | Method opening, pipeline overview, module introduction | One paragraph per conceptual module | Architecture and module contracts |
| `Trace` | Equations, algorithm, implementation, module internals | One operation, definition, or ownership boundary per sentence | Precision and reproducibility |

Move one level toward `Trace` when the user asks for input/output detail,
reproducibility, or stepwise explanation. Move one level toward `Compression`
when the user asks for crisp, concise, less procedural, or less engineering
prose.

Do not announce the mode unless doing so helps the collaboration.

### 2. Establish the claim boundary

Extract before editing:

- the problem object the method acts on;
- the limitation in the base representation or pipeline;
- the property the method intends to change;
- the invariant or capability it intends to preserve;
- the final output and how it is used;
- the evidence available for each claimed effect.

Separate representational capacity from observed quality. A mechanism may
enable a function class without guaranteeing a benchmark improvement.

### 3. Build the internal How/Why model

Reason through this schema even when it will not be shown:

| Stage | Input or problem object | How | Immediate output | Why | Claim basis |
|---|---|---|---|---|---|
| 1 | What enters or must be resolved | Concrete mechanism | What it produces | Scientific purpose | Definition, architecture, objective, or experiment |

Give each mechanism one immediate output and one primary purpose. Split
overloaded stages instead of attaching several vague benefits to one component.

### 4. Collapse operations into conceptual modules

Group mechanisms that serve the same purpose. Prefer three to five role-led
modules over a list of implementation nouns.

Good module identities name scientific responsibilities:

- compositing-aware carrier assignment;
- renderer-consistent surface attachment;
- surface-conditioned appearance representation;
- composition-aligned residual learning.

Treat helper operations as support for the nearest conceptual module. Do not
elevate every implementation detail into a contribution.

### 5. Apply mode-specific detail

#### Compression

Use **main-clause abstraction, subordinate-clause mechanism**:

```text
Main clause          = scientific responsibility or transformation
by/using/through ... = essential engineering realization
result clause        = direct capacity, representation, or constraint
```

Admit a technical detail only when it satisfies at least one test:

1. **Novelty-bearing**: distinguishes the method from its nearest baseline.
2. **Claim-disambiguating**: removing it would make the main claim misleading.
3. **Causal-bridge**: explains why a module can address the stated limitation.

Treat compression as omission or grouping, never semantic weakening. Preserve
canonical domain terms and distinctions supplied by the source or project
glossary. Do not shorten a defined quantity into a broader but different one
such as changing `alpha-compositing contribution` to `alpha contribution`. If a
term is too costly for the section, omit it or define it more compactly rather
than renaming it inaccurately.

Move routine decoding, tensor shapes, coefficient counts, autograd ownership,
standard composition steps, and predictable implementation details to the full
Method unless one of those tests requires them.

Do not hide an operation-level pipeline inside long subordinate clauses. If a
sentence still contains several independent mechanisms, compress them into a
module identity or remove lower-priority details.

#### Overview

Make each paragraph establish one module contract:

```text
module goal -> input -> representation -> output -> rationale or trade-off
```

Retain enough mechanism to show how modules couple. Define important
intermediate representations and ownership boundaries, but avoid line-by-line
execution narration.

#### Trace

Expand the dataflow explicitly:

```text
input -> operation or equation -> output -> gradient/ownership behavior -> next consumer
```

Prefer exact standard terminology, symbols, conditions, and tensor or sampling
semantics. Crispness must not remove information needed for reproduction.
Do not fabricate equations, ownership behavior, or implementation semantics
that the source does not establish. Mark a missing definition or inspect the
code and documentation instead.

### 6. Write the causal prose

Use a progression appropriate to the method rather than filling a template
mechanically:

```text
We propose X, a [scientific identity] that [goal] while [preserved invariant].
X establishes [module responsibility] by [essential mechanism].
[Representation module] predicts or constructs [scientific object], enabling [capacity].
[Objective module] aligns or directs [learning role] through [objective design].
```

Prefer purpose-first order when a mechanism is difficult to parse. Prefer
module-first order when purpose-first clauses produce repeated `To ...`
sentences.

Use connectors only for real logical functions:

- stage order: `first`, `then`, `finally`, `during training`, `at inference`;
- purpose: `to`, `so that`;
- mechanism: `using`, `through`, `by`;
- immediate consequence: `yielding`, `providing`, `producing`;
- capacity: `enabling`, `allowing`;
- preservation or trade-off: `while`, `without replacing`.

In `Compression`, connectors must advance semantic stages, not individual
tensor operations. Avoid a procedural spine such as `selects -> uses -> maps ->
evaluates -> adds` when those operations belong to fewer conceptual modules.

### 7. Audit claim strength

Match verbs to evidence:

- Use `guarantees` or `ensures` only for a proved or structurally unavoidable
  property.
- Use `preserves` for an architectural invariant that remains unchanged.
- Use `enables` or `allows` for representational capacity.
- Use `encourages`, `promotes`, or `directs` for a loss or training objective.
- Use `improves`, `outperforms`, or `reduces` only with experimental evidence.

Reject these failure modes:

- architecture inventory: `We use A, B, C, and two losses`;
- execution-trace abstract: each main clause narrates a low-level operation;
- subordinate-clause dumping: implementation inventory hidden after `by`;
- terminology erosion: compression changes a defined technical quantity;
- purpose laundering: generic efficiency or robustness without support;
- missing input/output where the selected depth requires it;
- repeated rationale after every component;
- analogy used as evidence;
- experimental outcomes written as mechanism-level guarantees.

### 8. Run the reader tests

Always run the **causal skeleton test**: read only the problem, module identities,
and purpose clauses. Verify that they recover the scientific story.

For `Compression`, also run:

- **Main-clause test**: remove subordinate mechanism clauses; the remaining
  clauses must still explain the method.
- **Verb-spine test**: list the main verbs. They should name scientific
  transformations such as `establishes`, `constructs`, `predicts`, or `aligns`,
  not merely replay an execution trace.
- **Semantic-stage test**: each sentence should advance one conceptual module or
  claim, not one routine operation.

For `Overview` and `Trace`, read only the mechanism clauses and verify that they
form a coherent and sufficiently complete dataflow.

## Output contract

Always perform claim-boundary extraction, How/Why reasoning, and module grouping
internally.

- For **rewrite**, return the revised text and only caveats that materially
  affect correctness. Do not expose the extraction table by default.
- For **extract**, **deconstruct**, or **System-2 analysis**, return the causal
  chain, How/Why table, conceptual modules, and missing bridges. Do not rewrite
  unless requested.
- For **audit** or **review**, lead with logic gaps, depth mismatches, and
  overclaims rather than prose preferences.
- For **explain the changes**, add a concise sentence-level How/Why or
  main-clause/mechanism mapping.
- For **grilling**, expose the current decision and ask one consequential
  question at a time with a recommended answer.

## Minimal example

Weak execution trace for an abstract:

```text
We select boundary elements, compute variance, interpolate features, encode
them with a hash grid, and apply two losses.
```

Compressed causal version:

```text
The method identifies ambiguous boundary elements through prediction variance.
It constructs a continuous feature field by interpolating and encoding their
features at multiple resolutions. Alignment and continuity objectives coordinate
the resulting representations and encourage smooth boundary predictions.
```

Main-clause skeleton:

```text
The method identifies ambiguous elements.
It constructs a continuous feature field.
Objectives coordinate the representations.
```

The skeleton retains the scientific story; the subordinate clauses carry the
essential mechanisms without turning the abstract into an implementation trace.
