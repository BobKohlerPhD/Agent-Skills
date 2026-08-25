---
name: finance-workstation-ui
description: Design and refine advanced quantitative-finance, trading, market-research, model-evaluation, risk, and broker-workstation interfaces. Use when numerical evidence, distributions, uncertainty, sample adequacy, execution feasibility, and operational state must be legible at institutional density. Do not use for general BI dashboards, personal sites, editorial pages, or marketing websites.
---

# Quantitative Finance Workstation UI

Build analytical workstations whose hierarchy is determined by evidence and operator decisions, not by generic dashboard patterns or finance-themed decoration.

## Respect the Existing Workstation Contract

For an established application, inspect its maintained design and UX contract before
choosing a visual direction or changing a shared interaction. Treat the documented
runtime token owner, canonical components, route model, and read-only or order-capable
boundary as authoritative. This skill provides finance-specific defaults; it does not
authorize a competing stylesheet, template, component vocabulary, or workflow.

Keep project-specific palettes, file paths, broker policies, and route names in the
project. Promote only reusable decision rules into this skill. A research-only surface
should clearly communicate that it does not place or authorize orders, while an
order-capable surface must make its separate authorization boundary explicit.

## Establish the Analytical Contract

Before editing the interface, identify:

- the decisions the screen supports;
- the primary comparison unit, such as model, symbol, trade, session, portfolio, or scenario;
- the time horizon, market session, timezone, and as-of timestamps;
- the authoritative data source and machine-readable fields;
- the units, denominators, sample sizes, coverage requirements, and validation thresholds;
- the distinction between observed, calculated, estimated, simulated, and unavailable values.

When inputs are narrative-heavy, derive a compact quantitative view model from supported facts. Preserve useful prose as drill-down context. Do not convert qualitative claims into invented precision or hide missing evidence behind reassuring copy.

## Organize by Quantitative Decision Sequence

Prefer this hierarchy when the product does not already establish a stronger one:

1. system state, as-of time, data integrity, coverage, and sample adequacy;
2. ranked models, strategies, candidates, or exposures with directly comparable metrics;
3. parameter distributions, outcome distributions, uncertainty, and validation state;
4. gate attribution, cohort or regime breakdowns, and unresolved evidence;
5. execution feasibility, liquidity, risk, capacity, and operational constraints;
6. audit details, definitions, methodology, and source narrative.

Keep the decision-facing summary compact. Make row-level evidence and methodology inspectable without forcing them into the first viewport.

## Preserve Metric Semantics

- Display a sample size or denominator wherever a statistic could otherwise imply more evidence than exists.
- Keep units explicit and consistent: dollars, percent, basis points, normalized R, contracts, shares, sessions, or timestamps must not be visually interchangeable.
- Pair central tendency with dispersion when it affects the decision. Prefer compact P25 / median / P75, range, confidence interval, drawdown, MFE / MAE, or tail metrics over an unsupported scalar score.
- Distinguish development, frozen out-of-sample, paper, and live evidence. Never style an unfrozen development result as validated.
- Show configured minimums beside observed counts when adequacy is a gate.
- Render unavailable values as unavailable, not zero. Preserve nulls through the data and presentation layers.
- Separate selection quality, directional follow-through, executable success, and realized performance.
- Separate affordability or capacity stress from expected account performance.
- Expose parameter versions, relevant configuration hashes, and analysis timestamps when reproducibility matters.
- Do not present correlations, confidence bounds, or optimization rankings when their configured evidence minimum is unmet.

## Choose Decision-Useful Encodings

Use the smallest visualization that materially improves comparison:

- tables or aligned metric rows for exact model, symbol, parameter, or cohort comparisons;
- funnels or segmented bars for gate progression and rejection attribution;
- box plots, histograms, quantile bands, or empirical distributions for outcome shape;
- equity and drawdown paths for time-dependent risk;
- scatterplots only when sample size, axes, units, and relevant uncertainty are visible;
- heatmaps for stable two-dimensional parameter, regime, or correlation comparisons;
- compact sparklines only when their window and baseline are clear.

Avoid decorative charts, unlabeled gauges, fake precision, dual axes without a compelling need, and color-only distinctions. A chart must expose its timeframe, sample, units, and comparison baseline.

## Finance-Application Visual Defaults

Unless the user or an established product system says otherwise:

- Prefer a continuous workstation canvas over floating cards.
- Use a compact product bar and stable analytical regions instead of ornamental navigation.
- Establish a high-contrast product shell with restrained analytical surfaces. A dark workstation or daylight research-folio treatment can both be appropriate; follow the established product contract and usage scene rather than applying a terminal theme by reflex. Avoid glass effects, strong gradients, neon glows, decorative blobs, and oversized hero copy.
- Reserve green and red for directional, outcome, or risk meaning. Use restrained cyan or indigo for selection and focus.
- Use low-contrast borders, minimal shadows, modest radii, and tabular numerals.
- Keep a readable 15–16px desktop body baseline. Dense information may be compact, but primary values and controls must remain legible.
- Align repeated metrics to a stable grid and keep sign, precision, and unit formatting consistent.
- Use concise operational labels. Remove marketing language, filler explanations, ornamental numbering, and repeated status prose.

## Maintain a Quantitative Data Boundary

Perform calculations in the data or model layer and give the UI typed, machine-readable values. Do not make DOM text the source of truth. Prefer stable metric identifiers with numeric value, unit, sample count, period, provenance, and status fields where applicable.

Preserve existing data bindings and auditability. Do not fabricate data to complete a layout, silently recompute a published metric with different assumptions, or discard raw detail needed to reproduce a summary.

## Implementation and Review

Centralize visual and numeric-formatting tokens. Preserve the documented runtime token
owner, existing behavior, accessibility, responsive navigation, and authorization
boundaries unless the user asks to change them. Do not add a parallel theme or
screen-local template to an established workstation.

After implementation:

- render the actual interface at its target desktop width and a realistic mobile width;
- verify hierarchy, density, clipping, keyboard focus, semantic colors, reduced motion, and ledger readability;
- compare displayed statistics with the authoritative machine-readable outputs;
- test empty, null, insufficient-sample, extreme-value, and degraded-coverage states;
- verify that mobile layouts retain sample size, risk, validation, and units rather than hiding them;
- run the relevant project tests.

For substantial quantitative workstations or model-evaluation surfaces, read [references/quantitative-analytics-review.md](references/quantitative-analytics-review.md). For a reference-derived visual system or substantial visual redesign, also read [references/visual-review.md](references/visual-review.md).
