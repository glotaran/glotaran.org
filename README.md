# glotaran.org

Source for [glotaran.org](https://glotaran.org) — the hub for the GloTarAn ecosystem of
global and target analysis tools.

Built with [Astro](https://astro.build) and deployed as a static site.

## Development

Requires Node 18+.

```sh
npm install
npm run dev       # local dev server at http://localhost:4321
npm run build     # production build → dist/
npm run preview   # preview the dist/ output locally
```

## Deployment

**GitHub Pages** (automatic): every push to `main` triggers the
[deploy workflow](.github/workflows/deploy.yml) which builds the site and
publishes to GitHub Pages. The custom domain `glotaran.org` is configured
via `public/CNAME`.

**SFTP / self-hosted** (release): create a GitHub Release with a `v*` tag.
The [release workflow](.github/workflows/release.yml) builds the site, creates
a `glotaran-org-<tag>.tar.gz` archive of the `dist/` contents, and attaches it
to the release. Download and extract directly into the server document root:

```sh
tar -xzf glotaran-org-v1.0.0.tar.gz -C /var/www/glotaran.org/
```

You can also trigger the release workflow manually from the Actions tab to
produce a tarball without creating a release.

## Repository layout

```
AGENTS.md                  Agent entry point for repo-specific guidance
docs/ai/                   Linked reference docs for coding agents
src/
  layouts/Base.astro      HTML shell, fonts, global styles
  pages/index.astro       Homepage
  styles/global.css       CSS custom properties
public/
  CNAME                   Custom domain for GitHub Pages
.github/workflows/
  deploy.yml              Push to main → GitHub Pages
  release.yml             Release tag → tarball asset
astro.config.mjs
package.json
```

## License

CC0-1.0 — see [LICENSE](LICENSE).
