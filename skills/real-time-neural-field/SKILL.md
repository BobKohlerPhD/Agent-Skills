---
name: real-time-neural-field
description: Build or revise event-aligned EEG, fMRI, or connectomics animations when live or frame-based neural data needs stable normalization, spatial interpolation, stale-frame handling, and latency-aware rendering. Do not use for static publication figures, offline functional-connectivity comparisons, patient diagnosis, Parkinson disease interpretation, or unsupplied biomarker thresholds.
---

# Real-Time Neural Field

Create neural animations that remain visually stable without obscuring low activity, missing data, or event provenance.

## Scope

Use this skill for animated cortical fields, neural-network overlays, synchronized timelines, and related frame-based rendering. For static cohort figures or offline statistical reports, use the project's ordinary analysis workflow instead.

Treat clinical events as supplied annotations unless the project contains a validated detection model. Do not relabel event-table synchronization as diagnosis or real-time detection.

## Workflow

1. Locate the project root and inspect its data loader, feature extraction, spatial mapping, render loop, and export path before changing parameters.
2. Establish the input contract: modality, channels or regions, sampling frequency, timestamps, event source, missing-data representation, target frame rate, and output format.
3. Preserve scientific meaning through the render pipeline:
   - derive normalization from the project or supplied specification;
   - distinguish preprocessing, temporal smoothing, nonlinear display scaling, and colormap limits;
   - never turn absent or invalid signal into apparent activation;
   - mark stale, dropped, or reused frames in state or metadata.
4. Validate spatial mapping against the current mesh and sensor coordinates. Normalize interpolation weights safely and define behavior for sensors without valid coordinates.
5. Keep rendering state explicit. Reset caches and smoothing state between subjects or sessions, and do not leak prior-frame state across independent runs.
6. Make alerts or event overlays provenance-aware. Use wording such as "annotated freeze event" when driven by an events file; reserve "detected" for an actual detection algorithm.
7. Render only the requested deliverable and verify it before reporting completion.

## Project routing

When working in the `NeuralInterface` project, read [references/neuralinterface.md](references/neuralinterface.md) before editing the pipeline. Treat the checked-out source as authoritative if it differs from the reference.

For another project, inspect its implementation and adapt the workflow; do not transplant `NeuralInterface` presets as universal defaults.

## Verification

Check the observable properties relevant to the change:

- frame count, output duration, and effective FPS agree;
- source timestamps, feature windows, event intervals, and frames share a documented time base;
- NaNs, infinities, empty channels, and zero-weight mesh vertices have defined behavior;
- low-amplitude activity remains distinguishable from missing or stale data;
- smoothing reduces display jitter without moving event timing or hiding transient structure;
- subject/session changes reset caches and state;
- generated files exist, are non-empty, and can be decoded;
- labels and legends describe transformations and event provenance accurately.

Report the inputs used, material normalization or timing decisions, generated artifacts, and checks performed.
