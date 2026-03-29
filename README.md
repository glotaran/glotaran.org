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

Create a GitHub Release with a `v*` tag. The
[release workflow](.github/workflows/release.yml) now builds two release
flavors from that tag:

- `glotaran.org`: builds with `SITE_URL=https://glotaran.org`, creates a
  `glotaran-org-<tag>.tar.gz` archive plus a matching `.sha256` checksum, and
  attaches both files to the release.
- `glotaran.github.io`: builds with `SITE_URL=https://glotaran.github.io`,
  removes the production `CNAME`, overlays the legacy Jekyll content from
  `external/glotaran.github.io`, and force-pushes the result to the `pages`
  branch of `glotaran/glotaran.github.io`.

The production host still pulls the tarball onto an external web server.
Download and extract directly into the server document root:

```sh
tar -xzf glotaran-org-v1.0.0.tar.gz -C /var/www/glotaran.org/
```

For routine production deploys on the external web server, use
[scripts/deploy-release.sh](scripts/deploy-release.sh). It resolves `latest` or
a specific tag from the public GitHub release URLs, downloads the matching
tarball and `.sha256` checksum, verifies integrity, and syncs the extracted
site into the server web root.

```sh
curl -fsSL https://raw.githubusercontent.com/glotaran/glotaran.org/main/scripts/deploy-release.sh -o deploy-release.sh
chmod +x deploy-release.sh
TARGET_DIR=/var/www/glotaran.org ./deploy-release.sh latest
```

To deploy a specific tag instead of the latest published release:

```sh
TARGET_DIR=/var/www/glotaran.org ./deploy-release.sh v1.0.0
```

For the GitHub Pages side, configure `glotaran/glotaran.github.io` to publish
from the `pages` branch at the repository root.

## Repository layout

```text
AGENTS.md                  Agent entry point for repo-specific guidance
docs/ai/                   Linked reference docs for coding agents
src/
  layouts/Base.astro      HTML shell, fonts, global styles
  pages/index.astro       Homepage
  styles/global.css       CSS custom properties
public/
  CNAME                   Production custom domain (removed from github.io build)
.github/workflows/
  release.yml             Release tag → tarball asset + pages branch publish
scripts/
  deploy-release.sh       Server-side helper for external web server deploys
external/
  glotaran.github.io/     Legacy Pages source overlaid into /legacy/
astro.config.mjs
package.json
```

## License

CC0-1.0 — see [LICENSE](LICENSE).
