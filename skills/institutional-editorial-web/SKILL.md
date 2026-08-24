---
name: institutional-editorial-web
description: Maintain the Institutional Editorial visual system for content-led sites that already use or explicitly request it, including the project-scoped Quarto portfolio. Do not use for dashboards, trading tools, SaaS or admin applications, or generic frontend work.
---

# Institutional Editorial Web

Preserve a specific content-led website identity while making requested changes responsive, accessible, and consistent with the existing implementation.

## Scope and routing

Use this skill when an existing site follows the Institutional Editorial system or the user explicitly requests that system for a content-led public website.

Do not infer this aesthetic from words such as "professional," "website," or "frontend." Application interfaces need domain-appropriate interaction and information-density patterns unless the user explicitly requests a combination.

## Workflow

1. Locate the project root and inspect its design-system document, site configuration, theme variables, CSS or SCSS, page templates, and representative rendered pages.
2. Identify the user's requested change and the existing invariant it touches: container alignment, header rhythm, typography, palette, navigation, content hierarchy, imagery, or responsive behavior.
3. Preserve the project's established tokens and reusable classes. Prefer changing a shared rule when multiple pages should move together; avoid page-specific overrides that merely hide drift.
4. Follow explicit user direction when it intentionally revises the design system. Record a new baseline only when the user asks for a system-level change.
5. Keep semantic HTML, alternative text, keyboard behavior, focus visibility, contrast, and reduced-motion behavior intact or improve them within scope.
6. Render the complete site after global configuration, theme, or stylesheet changes. Inspect the affected pages at representative desktop and mobile widths.
7. Report the files changed, system-level decisions, rendered checks, and remaining limitations.

## Project routing

When the active repository is the Quarto portfolio described by this skill, read [references/portfolio-site.md](references/portfolio-site.md) before editing. Treat the checked-out `DESIGN_SYSTEM.md`, `_quarto.yml`, and stylesheets as authoritative if they differ from this reference.

For verification details, read [references/verification.md](references/verification.md) when the request changes layout, navigation, styling, media, or site configuration.

## Guardrails

- Do not replace the site's identity with a fashionable but unrelated visual system.
- Do not apply desktop dimensions unchanged at narrow viewports.
- Do not hide semantic headings solely to obtain a visual alignment unless an accessible equivalent remains.
- Do not introduce new fonts, colors, animation, components, or build dependencies without a concrete need.
- Do not publish or deploy unless the user asks; a successful local render is not deployment authorization.
