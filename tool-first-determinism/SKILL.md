---
name: tool-first-determinism
description: Enforce tool-first handling for deterministic counting, arithmetic, string, and algorithm-evaluation tasks. Use when a task asks for exact letters, character counts, calculations, numeric results, string search/comparison/transcription, or concrete outputs of algorithms/functions.
---

# Tool-First Determinism

## Principle

When the task has an exact, checkable answer, do not simulate a calculator, interpreter, or search algorithm in prose. Use a real tool: a script, REPL, shell utility, NumPy, Octave, database query, parser, or another deterministic program.

Long reasoning is not a substitute for function calling. The agent's job is to choose and run the right instrument, then report the result.

## Trigger Tasks

Use this skill for:

- Counting letters, characters, words, tokens, delimiters, rows, fields, or matches.
- Arithmetic, algebraic manipulation, matrix math, statistics, numerical methods, or unit conversions.
- String copying, searching, diffing, sorting, comparing, normalization, extraction, regex matching, or exact formatting.
- Evaluating the output of a concrete algorithm, function, parser, serializer, hash, encoding, or data transform.
- Verifying any exact claim where a short program can provide the answer.

Do not use this skill for purely conceptual explanations, design tradeoffs, or approximate judgment calls unless an exact subproblem appears inside them.

## Workflow

1. Identify the deterministic subproblem.
   Completion criterion: the exact value, transformation, or predicate to verify is stated clearly enough to test.

2. Choose the smallest reliable tool.
   Completion criterion: the tool can compute the answer directly without depending on the model's mental arithmetic or memory.

3. Run the tool.
   Completion criterion: the command or script has executed successfully, or the failure is captured and a better tool is selected.

4. Inspect the output.
   Completion criterion: the answer is read from the tool output, not reconstructed from memory.

5. Respond with the result and, when useful, the method.
   Completion criterion: the user can see the exact answer and enough provenance to trust how it was obtained.

## Tool Choices

- Use Python standard library for counting, parsing, string operations, exact integer arithmetic, JSON/CSV/XML handling, and quick algorithms.
- Use NumPy, SciPy, pandas, R, Julia, or Octave for numerical computing when available and appropriate.
- Use shell tools such as `wc`, `sort`, `uniq`, `diff`, `grep`, `rg`, `jq`, or `awk` for simple text and structured-data checks.
- Use the project's own language, test runner, or REPL when the question concerns repository code.
- Use a temporary script when the operation needs clarity, repeatability, or more than one line of logic.

## Guardrails

- Do not answer exact counts or calculations from visual inspection or chain-of-thought.
- Do not manually transcribe long strings when a copy, parser, diff, or extraction command can do it.
- Do not hand-evaluate code paths when running the relevant function is feasible.
- Do not hide uncertainty: if dependencies are missing or inputs are ambiguous, state that and choose the next reliable path.
- Keep scripts small, deterministic, and disposable unless the user asks for a reusable artifact.

## Examples

User asks: "How many r's are in strawberry?"

Run:

```python
s = "strawberry"
print(s.count("r"))
```

Answer from the script output.

User asks: "Compute this matrix product."

Run NumPy or Octave and report the resulting matrix.

User asks: "Do these two strings differ only by whitespace?"

Normalize both strings in code, compare them, and report the boolean result plus any useful diff.

User asks: "What does this function return for input X?"

Run the function in the project's runtime or reproduce it in a small script when the project runtime is unavailable.
