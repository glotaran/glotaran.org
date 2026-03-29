# Content And Routing

Use this document when changing software content, publication content, or file-based routes.

## Site Shape

The site is a static Astro app with a small number of page types:

- [src/pages/index.astro](../../src/pages/index.astro): homepage
- [src/pages/ecosystem.astro](../../src/pages/ecosystem.astro): software overview
- [src/pages/publications.astro](../../src/pages/publications.astro): publication list
- [src/pages/software/[slug].astro](../../src/pages/software/%5Bslug%5D.astro): dynamic software detail pages
- [src/pages/software/glotaran-legacy/resources.astro](../../src/pages/software/glotaran-legacy/resources.astro): dedicated legacy subpage

## Content Collections

Schemas live in [src/content/config.ts](../../src/content/config.ts).

### Software

Files live in [src/content/software](../../src/content/software).

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

- The filename becomes the slug. Example: `pyglotaran.md` becomes `/software/pyglotaran`.
- `order` controls software ordering on the ecosystem page and homepage package grid.
- The markdown body is rendered below the software hero on the shared software template.

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

### New software entry

1. Add a markdown file in [src/content/software](../../src/content/software).
2. Ensure frontmatter matches the schema.
3. Set `order` intentionally so the package appears in the right place.
4. If the software entry needs a special subpage, add a dedicated route under [src/pages/software](../../src/pages/software).

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
