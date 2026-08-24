---
name: myosuite-gait-controller
description: Build or debug verified MuJoCo/MyoSuite gait control, event-aligned kinematic playback, and musculoskeletal rendering when a target model can be inspected. Do not use for generic MuJoCo work, unmapped models, or claims that an animation proves gait restoration, patient outcomes, or intervention effects.
---

# MyoSuite Gait Controller

Develop reproducible gait-control and kinematic-rendering changes while keeping model identity, state semantics, and validation explicit.

## Scope

Use this skill for a MyoSuite gait model, its oscillator-to-joint mapping, event-driven pose transitions, or its MuJoCo renderer.

First identify which mode the user needs:

- **dynamic control**: actions or controls are advanced with MuJoCo simulation steps;
- **kinematic playback**: `qpos` is assigned directly and the model is forwarded for visualization;
- **render-only**: camera, visibility, resolution, or frame export changes without controller changes.

Do not describe kinematic playback as a dynamically validated gait controller or as restoration of human function.

## Workflow

1. Inspect the installed MyoSuite and MuJoCo versions, registered environment ID, model dimensions, timestep, joint names, qpos addresses, actuators, joint ranges, and renderer backend.
2. Trace the complete state path from oscillator or event input to model state. Keep the CPG integration timestep, MuJoCo model timestep, and render cadence distinct.
3. Address joints by model name or by qpos addresses derived from the current model. If a named joint is absent or has an unexpected width, stop and report the incompatibility instead of applying an index guessed from another model.
4. Preserve state-transition semantics. Define what happens on entry to a freeze/stop interval, throughout the interval, and on resumption; reset oscillator state only when that behavior is intentional.
5. Keep camera and aesthetic presets separate from the controller. A rendering change should not silently alter simulation or kinematic state.
6. Make the smallest requested change and validate the relevant mode.

## Project routing

When working in the `NeuralInterface` project, read [references/neuralinterface-gait.md](references/neuralinterface-gait.md) before editing. The checked-out model and source override this reference if they differ.

For another MyoSuite project, inspect its environment and model rather than reusing the `myoSarcLegWalk-v0` mapping.

## Verification

For every controller or mapping change, check:

- environment creation and reset succeed;
- expected joint names resolve and model dimensions match the mapping;
- generated state contains only finite values and stays within intentionally enforced limits;
- left/right phase behavior and event transitions are observable and reproducible;
- root translation, joint assignment, and rendering use the intended mode;
- no claim of physical stability is made from `mj_forward`-only playback;
- frame count, cadence, camera tracking, and export format agree;
- resources are closed after rendering.

For dynamic control, also evaluate contacts, falls, actuator controls, rewards or task metrics, and a meaningful rollout duration. For kinematic playback, report that dynamic stability and control feasibility were not tested.
