
A collection of skills from random projects 

## Skills

| Skill |
| --- | --- |
| [Finance UI](skills/finance-workstation-ui/) | Dense quantitative-finance, trading, risk, market-research, and model-evaluation interfaces where evidence and operational state must remain legible. |
| [Institutional Editorial Web](skills/institutional-editorial-web/) | Maintaining an established Institutional Editorial design system for content-led websites and project-scoped Quarto portfolios. |
| [MyoSuite Gait Controller](skills/myosuite-gait-controller/) | Verified MuJoCo/MyoSuite gait control, event-aligned kinematic playback, model mapping, and musculoskeletal rendering. |
| [Real-Time Neural Field](skills/real-time-neural-field/) | Stable, event-aligned EEG, fMRI, or connectomics animation with explicit normalization, interpolation, timing, and stale-frame behavior. |
| [Resume Optimizer](skills/resume-optimizer/) | Evidence-grounded job fit assessment and requested CV tailoring inside a protected career sandbox. |


```bash
./scripts/link-user-skills.sh
```
Script creates a symlink for skill without deleting user skills and Codex should detect changes automatically. Create a project link to the same canonical package for skills that need to be discoverable from a specific project path.

```bash
./scripts/link-project-skills.sh /path/to/project skill-name [additional-skill-name ...]
```


## Layout

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
