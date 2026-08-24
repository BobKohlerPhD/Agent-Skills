# Portfolio website baseline

Read this reference only when the active repository contains the Quarto portfolio described below. Confirm the canonical project sources are present before relying on its project-specific guidance.

## Canonical project sources

Inspect these files before changing the system:

- `DESIGN_SYSTEM.md`: project-specific alignment and composition rules.
- `_quarto.yml`: site navigation, metadata, footer, render targets, fonts, and HTML configuration.
- `custom.scss`: Bootstrap theme variables and typography defaults.
- `styles.css`: canonical tokens, components, responsive behavior, and Quarto overrides.
- `index.qmd`, `about.qmd`, `projects.qmd`, and `cv.qmd`: representative page structures.

The commit `e063f52` is the documented baseline restore point. Use it only for comparison; do not reset or discard newer work to reach it.

## Identity tokens

Confirm these in the current files before relying on them:

- Serif: `Source Serif 4`
- Sans: `Inter`
- Primary accent: `#7b341e`
- Warm secondary background: `#faf9f8`
- Main text: `#1a202c` or the current CSS token
- Global content maximum: `1320px`

The project uses `.column-screen-inset.px-4`, `.page-header-wrapper`, and `.page-header-title` as core alignment hooks. Main page titles sit outside nested content grids to share a left edge.

## Composition invariants

- Home and About header regions should not cause the principal image or lead content to jump horizontally between pages.
- Desktop headers use the established serif hierarchy and underline treatment; responsive rules intentionally reduce and wrap that hierarchy.
- Hero media is square, capped near the current 350 px baseline, and adapted at mobile widths.
- Navbar branding is intentionally suppressed because page headings carry identity.
- Project pages have deliberate full-width and stacked compositions; inspect the existing markup before changing grid order.

Treat dimensions such as `350px`, `356px`, and fixed gaps as current composition values, not universal design principles. If content or viewport changes invalidate them, preserve the visual relationship with responsive CSS rather than forcing overflow.

## Content and media

Preserve meaningful `fig-alt` or `aria-label` text. For animated demonstrations, retain a poster and an accessible text fallback. Avoid autoplay additions that introduce sound, block interaction, or ignore reduced-motion preferences.

Do not update biography, employment, publications, citation metrics, or contact details from memory. Read the current canonical career sources or ask the user when those facts are in scope.
