# Quantitative Analytics Interface Review

Use this review for model research, strategy comparison, risk analytics, execution analysis, and other statistically dense finance interfaces.

## Data Contract

- Identify the authoritative artifact for every headline metric.
- Verify as-of time, timezone, observation window, unit, denominator, and sample count.
- Confirm that null, unavailable, stale, and zero remain distinct.
- Label observed, calculated, estimated, simulated, and user-supplied values.
- Keep parameter version, model identifier, and configuration hash visible or inspectable when results must be reproducible.

## Statistical Adequacy

- Place observed counts beside configured minimums.
- Show coverage gaps and excluded cohorts before performance claims.
- Pair location statistics with dispersion or uncertainty when the distribution matters.
- Make in-sample, development, frozen holdout, paper, and live evidence visually distinct.
- Suppress or clearly mark correlations, rankings, and confidence estimates that fail their evidence requirements.
- Avoid interpreting a tiny positive result as meaningful when uncertainty dominates it.

## Model and Strategy Comparison

- Give competing models the same metric definitions, precision, horizon, and denominator.
- Include candidate count, executed count, expectancy or outcome measure, drawdown, and validation state when available.
- Separate no-trade, rejected, policy-excluded, data-unverified, and executed states.
- Expose leading rejection reasons and parameter distributions instead of relying on prose explanations.
- Keep full row-level audit data accessible even when the decision-facing list is capped.

## Execution and Risk

- Distinguish theoretical signal quality from spread, slippage, liquidity, capacity, buying-power, and timing feasibility.
- Show risk in normalized and monetary units when both are decision-relevant.
- Keep affordability or stress-test assumptions separate from expected performance.
- Surface drawdown, adverse excursion, concentration, open risk, and constraint breaches before optimistic return summaries.
- Label assumptions and allow the operator to trace a result to its inputs.

## Visual Integrity

- Use tables for exact comparisons and charts only for relationships that are hard to read linearly.
- Label axes, units, samples, windows, baselines, and confidence bands directly.
- Keep zero lines and comparison baselines visually stable.
- Do not truncate axes or use area, volume, color intensity, or animation in ways that exaggerate small differences.
- Check extreme values, skew, outliers, dense labels, negative values, and mixed precision.
- On mobile, stack information in decision order while retaining units, samples, validation, and risk state.

## Final Verification

Compare the rendered interface against the source artifacts, not against copied display text. Verify at least one normal row, one rejection or exclusion, one missing-data state, and one extreme or tail observation. The screen should let an operator answer: what happened, how much evidence supports it, what failed, what risk remains, and whether the result is validated.
