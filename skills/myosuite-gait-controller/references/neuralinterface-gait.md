# NeuralInterface gait contract

Read this reference only when the active repository is the `NeuralInterface` project. Confirm that the source topology described below is present before relying on the project-specific guidance.

## Implementation mode

The current path is event-aligned **kinematic playback**:

- `core/mapping.py` integrates a two-neuron Matsuoka oscillator and returns a complete `qpos` target.
- `core/simulation.py::step_kinematic()` writes that target directly to simulation data and calls `mujoco.mj_forward()`.
- `scripts/generate_visuals.py` repeats the kinematic update between rendered frames.

This path does not apply actuator controls and does not call `mujoco.mj_step()` for locomotion. Describe its output as a synchronized musculoskeletal visualization, not proof of dynamically stable gait or clinical restoration.

## Current environment

Verify at runtime before editing:

- Environment: `myoSarcLegWalk-v0`
- Model state: `nq=35`, `nv=34`, `nu=80`
- Model timestep observed in the current environment: `0.001`
- Project CPG integration step: `0.01`
- Current render cadence: 15 FPS

Current source accesses the model through `env.unwrapped.sim`. New code should prefer the current public object exposed by the installed MyoSuite version when available, while remaining compatible with the checked-out environment.

## Verified joint mapping

Resolve names against the live model; the current model reports these qpos addresses:

| Purpose | Joint name | Current qpos address |
|---|---|---:|
| Root free joint | `root` | 0 |
| Right hip flexion | `hip_flexion_r` | 7 |
| Right knee | `knee_angle_r` | 12 |
| Right ankle | `ankle_angle_r` | 15 |
| Left hip flexion | `hip_flexion_l` | 21 |
| Left knee | `knee_angle_l` | 26 |
| Left ankle | `ankle_angle_l` | 29 |

Use MuJoCo named access or derive the address from `jnt_qposadr`; keep numeric values only as checked compatibility assertions.

## Current oscillator and pose presets

The project currently uses:

- Matsuoka parameters `w=2.0`, `b=2.5`, `tau=0.12`, and `tau_a=0.3`.
- Initial states `u=[0.1, 0.0]` and `v=[0.0, 0.0]`.
- Drive `1.8` outside the exact `break cnt` event and `0.0` during it.
- Anti-phase hip, knee, and ankle mappings in `GaitRestorationMapper.map()`.
- Direct root progression derived from oscillator magnitude.
- A separate stooped pose during the annotated freeze interval.

These are project presets. Preserve them unless the requested change or observed failure justifies a revision, and compare the resulting trajectory before and after.

## Renderer preset

`MyoSim` currently configures:

- a larger plane geometry;
- a 1920×1080 offscreen renderer;
- skeleton and muscle geometry groups;
- transparent visualization;
- a root-tracking camera;
- post-render sharpness enhancement.

Keep these settings outside the controller contract. Ensure renderer and environment cleanup occurs even if export fails.

## Useful inspection

From the project root, use its virtual environment and disable bytecode writes when only inspecting:

```bash
env PYTHONDONTWRITEBYTECODE=1 venv/bin/python -c "import gymnasium as gym, myosuite; env=gym.make('myoSarcLegWalk-v0'); print(env.unwrapped.sim.model._model.nq); env.close()"
```

Run full visualization generation only when the requested change warrants its data and rendering cost:

```bash
venv/bin/python scripts/generate_visuals.py --participant sub-XXXX
```
