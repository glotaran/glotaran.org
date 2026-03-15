# Content And Routing

Use this document when changing package content, publication content, or file-based routes.

## Site Shape

The site is a static Astro app with a small number of page types:

- [src/pages/index.astro](../../src/pages/index.astro): homepage
- [src/pages/ecosystem.astro](../../src/pages/ecosystem.astro): package overview
- [src/pages/publications.astro](../../src/pages/publications.astro): publication list
- [src/pages/packages/[slug].astro](../../src/pages/packages/%5Bslug%5D.astro): dynamic package detail pages
- [src/pages/packages/glotaran-legacy/resources.astro](../../src/pages/packages/glotaran-legacy/resources.astro): dedicated legacy subpage

## Content Collections

Schemas live in [src/content/config.ts](../../src/content/config.ts).

### Packages

Files live in [src/content/packages](../../src/content/packages).

Required fields:

- `name`
- `lang`: `python`, `r`, or `java`
- `summary`
- `github`

Common optional fields:

- `status`: `active`, `stable`, `archived`
- `version`
- `docs`, `pypi`, `cran`, `zenodo`
- `badges`
- `order`

Rules:

- The filename becomes the slug. Example: `pyglotaran.md` becomes `/packages/pyglotaran`.
- `order` controls package ordering on the ecosystem page and homepage package grid.
- The markdown body is rendered below the package hero on the shared package template.

### Publications

Files live in [src/content/publications](../../src/content/publications).

Required fields:

- `title`
- `authors`
- `journal`
- `year`

Common optional fields:

- `doi`
- `bib`
- `packages`

Rules:

- `bib` should point to a file under [public/bib](../../public/bib).
- `packages` should use package slugs for cross-linking.

## When Adding Or Changing Content

### New package

1. Add a markdown file in [src/content/packages](../../src/content/packages).
2. Ensure frontmatter matches the schema.
3. Set `order` intentionally so the package appears in the right place.
4. If the package needs a special subpage, add a dedicated route under [src/pages/packages](../../src/pages/packages).

### New publication

1. Add a markdown file in [src/content/publications](../../src/content/publications).
2. Add or reuse a `.bib` file in [public/bib](../../public/bib) if needed.
3. Link related package slugs via `packages`.

### Route changes

- Prefer keeping existing slugs stable.
- If you add a new top-level destination, update [src/components/SiteNav.astro](../../src/components/SiteNav.astro).
- Use file-based routing; avoid custom routing logic when a page file is enough.

## Legacy Content Workflow

If a task references old glotaran.org or legacy wiki content:

- Use `tmp.glotaran.org/` and `tmp.glotaran.github.io/` as source material only.
- Migrate useful information into the new site structure.
- Do not replicate iframe wrappers, obsolete downloads pages, or historical site chrome.

## Validation Checklist

- `npm run build`
- Check the relevant page route in the browser
- Confirm frontmatter changes did not break collection validation