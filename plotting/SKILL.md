  Skill: Scientific Editorial Viz

  Goal: To generate high-integrity, publication-ready visualizations
  that standardize the presentation of comparative data across
  multiple groups, outcomes, or factors.

  1. The Visual Language (Mandates)
  Use a deterministic color and tinting system to categorize data
  without relying on repetitive text labels.

  A. Results Palette (The Diverging Core)
   * Positive/Active Component: #E57373 (Soft Red). Used for positive
     correlations, increases, or additive effects.
   * Negative/Inhibitory Component: #64B5F6 (Soft Blue). Used for
     negative correlations, decreases, or subtractive effects.
   * Integrated/Aggregate: #9575CD (Soft Purple). Used for pooled
     data, overlaps, or agnostic models.

  B. Categorical Tinting (Background Zoning)
  Apply faint background fills to distinguish between factor levels
  (e.g., Different Cohorts, Conditions, or Timepoints):
   * Category Highlight 1: #FCF4F7 (Faint Rose).
   * Category Highlight 2: #F5F6F8 (Faint Slate).
   * Implementation: Use geom_rect or theme(plot.background =
     element_rect()) to apply these tints to the entire panel area.

  C. Hierarchical Typography Scale (The 3-Tier Rule)
  Establish a clear information hierarchy to reduce cognitive load:
   * Tier 1: Primary (Plot Title). Bold weight, largest size. Reserved
     for the primary takeaway or headline. Format in **Title Case**.
   * Tier 2: Secondary (Axis Titles & Subtitles). Regular weight,
     intermediate size. Used for essential context. Format in
     **Sentence case**.
   * Tier 3: Tertiary (Tick Labels & Legends). Regular weight,
     smallest size. Use a lower-contrast color (e.g., Dark Grey) to
     de-emphasize reference data.
   * Alignment: All axis titles must be perfectly centered on their
     respective scales. Tick labels must maintain consistent decimal
     precision across the scale.

  2. Structural Patterns

  A. The "Diverging Distribution" Forest Plot
  Designed for comparing effect sizes across a hierarchy of metrics.
   * Mirrored Geometry: Use a mirrored density ribbon (based on
     estimate and standard_error) for each metric.
   * Paired Offsets: Offset the ribbons by ±0.20 on the Y-axis to
     allow for side-by-side comparison of two directions (e.g.,
     Positive vs. Negative effects) within a single metric row.
   * Significance Masking (Signal-to-Noise):
       * Significant (p < alpha): High-opacity diamond (alpha = 0.8),
         larger size.
       * Non-Significant: Low-opacity circle (alpha = 0.2), smaller
         size.

  B. Paired-Coordinate Alignment
  For complex multi-pane figures where a central relational plot
  (e.g., a Matrix) is flanked by summary charts (e.g., Barcharts).
   * Coordinate Synchronization: Use a shared continuous coordinate
     system (e.g., 1:N where N is the number of categories).
   * Alignment Logic: Apply a fixed offset (e.g., +0.75) to the
     centers of all visual elements across panels.
   * Modular Assembly: Use align = "hv" to ensure that categorical
     rows in the flanking charts perfectly intersect the
     corresponding rows in the central matrix.

  C. Global Magnitude Standardization
  Consistency across facets is mandatory to prevent visual bias.
   * Unified Ceilings: Calculate the maximum absolute value across
     all facets/groups in a factor. Apply this as a fixed limit to
     all axes in the group.
   * Predictable Breaks: Round axis limits to the nearest logical
     increment (e.g., 5, 10, or 0.1) and use consistent breaks.

  3. Lexicon Mapping
  When using this skill, map your specific data to these generic
  terms:
   * Primary Factor: The top-level grouping variable (e.g., Treatment
     vs. Control).
   * Metric Hierarchy: The variables being measured (e.g., Broad
     Scales vs. Sub-Scales).
   * Relational Nodes: The components being compared in a matrix
     (e.g., Network nodes, Gene clusters, Departmental units).
   * Signal Direction: Whether a value represents a Positive/Increase
     or Negative/Decrease.