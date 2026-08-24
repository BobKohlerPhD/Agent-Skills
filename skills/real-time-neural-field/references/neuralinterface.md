# NeuralInterface project contract

Read this reference only when the active repository is the `NeuralInterface` project. Confirm that the source topology below is present before relying on the project-specific guidance.

## Source topology

- `core/eeg_processor.py`: EEGLAB loading, event-table loading, dual-window feature extraction, and session statistics.
- `core/eeg_visualizer.py`: cortical mapping, normalization, cached Matplotlib figures, and frame rendering.
- `core/mapping.py`: Matsuoka CPG and event-aligned kinematic mapping.
- `core/simulation.py`: MyoSuite scene wrapper and offscreen MuJoCo rendering.
- `scripts/generate_visuals.py`: end-to-end synchronized timeline and dashboard generation.
- `data/ds007526-download/`: relative dataset root used by the generation script.
- `output/`: generated GIFs.

`core/config.py` currently contains an older absolute `PROJECT_ROOT`. Do not propagate it into new code; resolve paths from the repository root or an explicit argument.

## Current data and display pipeline

Verify these values in source before relying on them:

- The feature extractor uses a 500 ms beta window, a 2 s delta/readiness-potential window, and a 100 ms step.
- Session normalization statistics include median and scaled MAD. The current visualizer uses robust z-scores, signed square-root display scaling, and fixed color limits of `-1.5` to `3.5`.
- Cortical coordinates come from the fsLR midthickness surfaces, currently subsampled with `[::15]`.
- Sensor-to-mesh weights currently use a Gaussian width of `0.20`, followed by row normalization.
- The synchronized generator currently renders 8 seconds at 15 FPS.
- Node activity currently uses an EMA with `alpha=0.15`.

These are project presets, not general neuroimaging recommendations. Change them only for a concrete project reason and record the before/after behavior.

## Event semantics

Clinical state comes from the participant events TSV. `EEGProcessor.get_event_at_time()` selects an event by onset and duration, and the gait mapper treats the exact `break cnt` label as a freeze interval.

Because the state is read from annotations, prefer labels such as `FREEZE EVENT` or `ANNOTATED FREEZE`. Do not describe this path as a learned or physiological freeze detector.

## Rendering and outputs

The generator writes:

- `output/<subject>_realtime_brain_timeline.gif`
- `output/<subject>_brain_skeleton_sync.gif`

Run from the project root with its environment:

```bash
venv/bin/python scripts/generate_visuals.py --participant sub-XXXX
```

Before a full render, confirm that the participant EEG and events files exist. Full generation downloads or reads neuroimaging assets and may be expensive; do not run it merely to prove that an unrelated text-only change was made.

## Project-specific review

- Compare `n_frames`, GIF duration, and the expected 15 FPS.
- Confirm every sampled EEG index is within bounds.
- Confirm `motor_indices` is non-empty before averaging.
- Reset `EEGVisualizer` caches between runs.
- Check that the event label shown to the viewer matches its provenance.
- Visually inspect early, event-transition, and late frames rather than only the first frame.
