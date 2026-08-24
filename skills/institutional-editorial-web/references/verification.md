# Website verification

Use the checks proportionate to the files changed.

## Build

From the project root, run a full Quarto render after changing `_quarto.yml`, `custom.scss`, `styles.css`, shared includes, or navigation:

```bash
quarto render
```

Quarto's preview may incrementally refresh only affected pages; a full render is the release check. Confirm that expected HTML and copied media exist in the configured output directory.

## Visual review

Inspect every affected page at minimum at:

- a representative desktop viewport;
- a narrow mobile viewport near 390 px;
- an intermediate width when the changed component crosses a Bootstrap or custom breakpoint.

Check header alignment, navigation state, overflow, unexpected horizontal scrolling, image cropping, font loading, line wrapping, focus outlines, and footer placement. Compare pages that intentionally share a baseline, especially Home and About.

## Accessibility

- Preserve one meaningful page-level heading and a logical heading hierarchy.
- Verify informative images have useful alternative text and decorative images do not create noise.
- Navigate interactive elements by keyboard and ensure focus remains visible and predictable.
- Check text and control contrast against the current backgrounds.
- Respect reduced-motion preferences for nonessential animation.
- If the project enables Quarto's `axe` HTML option, treat its findings as a starting point and inspect the affected UI manually as well.

## Content and metadata

- Verify internal links by their source `.qmd` targets and check external profile links when changed.
- Confirm page title, description, canonical URL, preview image, Open Graph, and Twitter-card data when metadata is in scope.
- Do not add structured data unless the visible page content supports it and the user requested SEO or discoverability work.

## Handoff

Report the render command and result, viewports inspected, accessibility checks performed, and any external URLs or deployment behavior that were not tested.
