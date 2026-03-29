# UI And Editing

Use this document when changing layout, styling, components, navigation, or general page structure.

## Core UI Structure

- [src/layouts/Base.astro](../../src/layouts/Base.astro) provides the HTML shell, fonts, and global imports.
- [src/components/SiteNav.astro](../../src/components/SiteNav.astro) owns the shared top navigation.
- [src/styles/global.css](../../src/styles/global.css) defines the global reset and design tokens.

Many pages still contain page-local `<style>` blocks. Keep changes local unless a pattern is clearly shared.

## Design System Basics

Global tokens live in [src/styles/global.css](../../src/styles/global.css):

- Background: `--bg`, `--bg-surface`, `--bg-card`
- Text: `--text`, `--text-muted`, `--text-dim`
- Accents: `--accent-py`, `--accent-r`, `--accent-java`, `--accent-gold`
- Fonts: `Fraunces` for display, `DM Sans` for body, `DM Mono` for utility and code

Keep new UI consistent with these tokens.

## Navigation Pattern

The navigation is centralized in [src/components/SiteNav.astro](../../src/components/SiteNav.astro).

Rules:

- Update the `navItems` array there for top-level nav changes.
- Keep `GloTarAn` on the left and the documentation CTA on the right.
- The current responsive behavior intentionally moves the full link list to a second row at narrower widths instead of dropping links one by one.

## Editing Guidelines

- Prefer reusing existing components rather than duplicating markup.
- Avoid introducing a CSS framework or utility system.
- Preserve the current dark visual language unless the task explicitly calls for a broader redesign.
- Keep responsive changes simple and maintainable.
- If you find repeated markup that is causing bugs, componentizing it is reasonable, but do not refactor unrelated areas just for neatness.

## Page-Level Conventions

- The spectrum gradient bar is currently repeated in page files. Reuse the existing pattern unless the task specifically justifies extracting it.
- Software pages are driven by [src/pages/software/[slug].astro](../../src/pages/software/%5Bslug%5D.astro).
- Markdown prose on software pages relies on the shared `.prose` styles in that template.

## Validation Checklist

- `npm run build`
- Browser-check any changed layout at wide and narrow widths
- If you touched navigation, verify homepage plus at least one software page
