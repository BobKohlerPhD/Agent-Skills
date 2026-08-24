# Agent Skills

A curated collection of reusable Agent Skills for Codex and other hosts that follow the open Agent Skills format.

This repository is the canonical source for the skills. Agent Skill Manager is maintained separately and audits this collection without owning or modifying it.

## Skills

| Skill | Use it for |
| --- | --- |
| [Finance Workstation UI](skills/finance-workstation-ui/) | Dense quantitative-finance, trading, risk, market-research, and model-evaluation interfaces where evidence and operational state must remain legible. |
| [Institutional Editorial Web](skills/institutional-editorial-web/) | Maintaining an established Institutional Editorial design system for content-led websites and project-scoped Quarto portfolios. |
| [MyoSuite Gait Controller](skills/myosuite-gait-controller/) | Verified MuJoCo/MyoSuite gait control, event-aligned kinematic playback, model mapping, and musculoskeletal rendering. |
| [Real-Time Neural Field](skills/real-time-neural-field/) | Stable, event-aligned EEG, fMRI, or connectomics animation with explicit normalization, interpolation, timing, and stale-frame behavior. |
| [Resume Optimizer](skills/resume-optimizer/) | Evidence-grounded job fit assessment and requested CV or cover-letter tailoring inside a protected career sandbox. |

Each package contains a required `SKILL.md` and may include UI metadata, focused references, scripts, assets, or routing fixtures.

## Local discovery

Codex loads personal skills from `$HOME/.agents/skills` and supports symlinked skill directories. Clone this repository, then run:

```bash
./scripts/link-user-skills.sh
```
The script creates or refreshes one symlink per skill without deleting unrelated user skills. Codex detects skill changes automatically; restart it if an update does not appear.

For a skill that should also be discoverable from a specific project path, create a project-local link to the same canonical package:

```bash
./scripts/link-project-skills.sh /path/to/project skill-name [additional-skill-name ...]
```

Both the user and project links resolve to this repository. Editing a file through any linked path therefore edits the same canonical file; there are no synchronized copies to drift. Project links are local workspace configuration and should be ignored by the project repository unless that repository deliberately standardizes the same sibling layout.

See the [official OpenAI skill documentation](https://learn.chatgpt.com/docs/build-skills) for the current skill format, discovery scopes, and invocation behavior.

## Quality checks

Install Agent Skill Manager from its separate repository, then audit this checkout:

```bash
python -m pip install "git+https://github.com/BobKohlerPhD/Agent-Skill-Manager.git@a6ef74d"
asm --root . audit --strict
```

The same strict audit runs in GitHub Actions on pushes and pull requests to `main`.

## Repository layout

```text
Agent-Skills/
├── .github/workflows/skill-quality.yml
├── asm-config.json
├── README.md
├── scripts/link-project-skills.sh
├── scripts/link-user-skills.sh
└── skills/
    └── <skill-name>/
        ├── SKILL.md
        ├── agents/openai.yaml
        ├── references/          # optional
        ├── scripts/             # optional
        ├── assets/              # optional
        └── tests/routing.yaml   # repository quality fixture
```
