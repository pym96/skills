# Skills

Personal agent skill library — reusable, composable building blocks that
gradually form my own workflow.

## Why a monorepo

Each skill is small on its own. The value compounds when they live together:
one place to version, install, and iterate. Add a folder, write a `SKILL.md`,
and it becomes available to every agent that reads this repo.

## Skills

| Skill | What it does |
|---|---|
| [`pytest-test-design`](pytest-test-design/SKILL.md) | Design behavioral Python tests with isolated fixtures, explicit parametrization, and minimal runner extensions. |
| [`regression-guard`](regression-guard/SKILL.md) | Verify fixes with red/green evidence, retain behavioral regression tests, and integrate checks into existing CI. |
| [`project-market-fit`](project-market-fit/SKILL.md) | Match existing projects to hiring needs, research relevance gaps, and prioritize the smallest useful improvement from feedback. |
| [`engineering-judgment`](engineering-judgment/SKILL.md) | Turn technical work into persuasive resume bullets, project deep dives, and system design answers through problem value, trade-offs, mechanisms, and evidence. |
| [`paper-reader`](paper-reader/SKILL.md) | Review paper drafts through explicit reader roles: elevator-pitch, logic-gap, counter-argument, signpost-check, engineer-translation. |
| [`write-method-causally`](write-method-causally/SKILL.md) | Rewrite method sections as causal narratives — separate How from Why, turn component inventories into research prose. |
| [`tool-first-determinism`](tool-first-determinism/SKILL.md) | Enforce tool-first handling for deterministic tasks (counting, arithmetic, string ops) instead of long reasoning. |

## Install

```sh
# Install one skill into your agent's skills directory
./install.sh paper-reader

# Install engineering judgment, including its three scenario references
./install.sh engineering-judgment

# Install project-market fit, including research and improvement references
./install.sh project-market-fit

# Install pytest test design and fixture isolation guidance
./install.sh pytest-test-design

# Install bug-fix verification and regression workflow
./install.sh regression-guard

# Install all skills
./install.sh --all

# Custom destination (default: $CODEX_HOME/skills or ~/.codex/skills)
./install.sh tool-first-determinism --dest ~/.claude/skills
```

Or clone and symlink the folders you want into `~/.claude/skills`,
`~/.codex/skills`, or any agent skills directory.

`project-market-fit` uses `engineering-judgment` for technical analysis and
resume writing, and the separately installed `grilling` skill for interactive
questions. Install `engineering-judgment` with the command above; if either
dependency is unavailable, the skill reports it and follows its limited fallback.

## Layout

```
skills/
├── <skill-name>/
│   ├── SKILL.md        # frontmatter (name, description) + instructions
│   └── ...             # optional references, agents, scripts
└── install.sh
```

## Roadmap

This repo grows with actual usage: a skill earns its place here after proving
useful in real work, not before.
