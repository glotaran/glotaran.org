# AGENTS.md

Guidance for AI coding agents working in this repository.

## Scope

This repo contains the Astro source for glotaran.org, a static marketing and documentation hub for the GloTarAn ecosystem.

- Prefer small, reviewable edits.
- Keep the site static. Do not introduce server-side infrastructure, client frameworks, or unnecessary build tooling.
- Treat `tmp.glotaran.org/` and `tmp.glotaran.github.io/` as local reference material for legacy content only. Do not preserve their old code or layout patterns.

## First Steps

1. Read [README.md](README.md) for install/build/deploy basics.
2. If the task touches content or routes, read [docs/ai/content-and-routing.md](docs/ai/content-and-routing.md).
3. If the task touches layout, styling, or navigation, read [docs/ai/ui-and-editing.md](docs/ai/ui-and-editing.md).

## Commands

```sh
npm install
npm run dev
npm run build
npm run preview
```

Notes:

- Node 18+ is required locally.
- `npm run build` is the main validation step. There is no test suite.

## Core Rules

- Reuse existing patterns before inventing new ones.
- Prefer shared components for repeated UI, but avoid broad refactors unless the task benefits directly.
- Keep frontmatter schema-compatible with [src/content/config.ts](src/content/config.ts).
- Preserve the existing visual language: dark theme, Fraunces display type, DM Sans body text, DM Mono utility text.
- For package and publication changes, keep slugs stable unless the task explicitly requires route changes.

## Validation

- Run `npm run build` after code or content changes.
- If you change responsive layout or navigation, verify at least one narrow and one wide viewport in the browser.

## Reference Docs

- [docs/ai/content-and-routing.md](docs/ai/content-and-routing.md)
- [docs/ai/ui-and-editing.md](docs/ai/ui-and-editing.md)
- [README.md](README.md)