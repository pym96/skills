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
| [`supervised-delivery`](supervised-delivery/SKILL.md) | Compatibility entrypoint; use evidence-gated-delivery for the canonical workflow. |
| [`systems-design-reasoning`](systems-design-reasoning/SKILL.md) | Analyze resource sharing, enforced boundaries, composition, and abstraction through constraints and whole-system trade-offs. |
| [`optimization-review`](optimization-review/SKILL.md) | Decide whether to replace an existing implementation by checking what callers can observe and comparing the full cost under the target workload. |
| [`evidence-gated-delivery`](evidence-gated-delivery/SKILL.md) | Master–Working–Regulator orchestration, bounded loop supervision, and independent evidence gates. |
| [`executable-contracts`](executable-contracts/SKILL.md) | Turn recurring mistakes into API constraints, executable checks, runtime controls, or enforced delivery gates. |
| [`pytest-test-design`](pytest-test-design/SKILL.md) | Design behavioral Python tests with isolated fixtures, explicit parametrization, and minimal runner extensions. |
| [`regression-guard`](regression-guard/SKILL.md) | Verify fixes with red/green evidence, retain behavioral regression tests, and integrate checks into existing CI. |
| [`project-market-fit`](project-market-fit/SKILL.md) | Match existing projects to hiring needs, research relevance gaps, and prioritize the smallest useful improvement from feedback. |
| [`engineering-judgment`](engineering-judgment/SKILL.md) | Turn technical work into persuasive resume bullets, project deep dives, and system design answers through problem value, trade-offs, mechanisms, and evidence. |
| [`paper-reader`](paper-reader/SKILL.md) | Review paper drafts through explicit reader roles: elevator-pitch, logic-gap, counter-argument, signpost-check, engineer-translation. |
| [`write-method-causally`](write-method-causally/SKILL.md) | Rewrite method sections as causal narratives — separate How from Why, turn component inventories into research prose. |
| [`tool-first-determinism`](tool-first-determinism/SKILL.md) | Enforce tool-first handling for deterministic tasks (counting, arithmetic, string ops) instead of long reasoning. |

## Install

With [Node.js](https://nodejs.org/) 22.20 or later and Git installed, run:

```sh
npx skills@latest add pym96/skills
```

In an interactive terminal, choose the skills, target agents, project or global
scope, and installation method in the prompts. When run inside a detected agent,
the CLI can skip prompts; use the explicit commands below to select what to install. This uses the community [Skills CLI](https://github.com/vercel-labs/skills)
from npm to fetch this GitHub repository; you do not need to clone it or install
a separate package from this repo. npm may first ask permission to download the CLI.

List available skills without installing:

```sh
npx skills@latest add pym96/skills --list
```

For a specific skill, these commands install into the current project without
installer prompts (replace `engineering-judgment` with a name from the table):

```sh
# Codex
npx skills@latest add pym96/skills --skill engineering-judgment --agent codex --yes

# Claude Code
npx skills@latest add pym96/skills --skill engineering-judgment --agent claude-code --yes
```

Add `--global` for a user-wide installation. To install every skill for one
agent, use `--skill '*' --agent codex --yes` (or `--agent claude-code`).
The quotes around `'*'` prevent shell expansion. The CLI's `--all` flag targets
all supported agents, so use the explicit agent option above when you only want one.
Bundled references are installed with each skill. Skills mentioned as dependencies
in the sections below still need to be installed separately.

Restart your agent after installation so it can discover the skills.
See the [CLI reference](https://github.com/vercel-labs/skills/blob/main/docs/commands.md)
for more options. These commands were checked with Skills CLI 1.9.0; `@latest`
tracks upstream releases.

### Existing shell installer

The original installer remains available for a local checkout. It requires a
POSIX shell and copies skills to `$CODEX_HOME/skills` or `~/.codex/skills` by default:

```sh
git clone https://github.com/pym96/skills.git
cd skills

./install.sh engineering-judgment
./install.sh --all

# Custom destination, for example Claude Code
./install.sh paper-reader --dest ~/.claude/skills
```

Existing destinations are skipped unless you add `--force`. You can also symlink
the folders from your checkout into your agent's skills directory.

`project-market-fit` uses `engineering-judgment` for technical analysis and
resume writing, and the separately installed `grilling` skill for interactive
questions. Install `engineering-judgment` with the command above; if either
dependency is unavailable, the skill reports it and follows its limited fallback.

`systems-design-reasoning` analyzes architecture choices and their mechanisms.
`engineering-judgment` helps express technical work for projects, resumes, and
interviews; neither skill requires the other.

## Composing delivery and testing

Invoke `/evidence-gated-delivery 5m 2h best effort` to supervise the current
explicit authorized task with Master, Working, and an independent Regulator.
`5m` is the check interval; `2h` is the total time budget. `best effort` permits
bounded progress and repair, not weaker acceptance. Add a task if none is bound.
The recurring workflow requires a separately installed `loop` skill and actual
agent-dispatch capabilities; missing capabilities stop activation. Installation
starts no workers or schedules and does not override project roles or approvals.
`supervised-delivery` remains only a compatibility entrypoint.

`evidence-gated-delivery` defines when a candidate can advance and what independent
verification must establish. It uses `regression-guard` for bug-fix evidence and
`pytest-test-design` for Python test structure. Install those skills when needed;
missing guidance does not count as successful verification.

For explicitly requested periodic work, it uses a separately installed `loop`
skill. This repository does not supply a scheduler or start recurring work on
installation. Project role, permission, and human approval rules remain in force.

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

`executable-contracts` selects where a requirement should be enforced. It uses `pytest-test-design` for Python test structure and `regression-guard` for historical fix verification; it does not replace either skill or start a delivery workflow. Install it with `./install.sh executable-contracts`.
