# pyglotaran starter kit (source + build)

This folder holds the **source** for the beginner starter kit offered on
glotaran.org. It is aimed at people who used to reach for the Glotaran 1.x GUI:
no Python, notebook, git, or command-line experience, and nothing installed.

The kit is a downloadable zip. One double-click of a `START_HERE` script
installs [`uv`](https://docs.astral.sh/uv/), builds an isolated environment with
pinned package versions, and opens five guided notebooks in JupyterLab.

## How it plugs into the website

| Path | Role |
| ---- | ---- |
| `starter-kit/starter/` | The kit contents — this is what gets zipped and shipped. |
| `starter-kit/build_zip.py` | Packages `starter/` **directly into** `public/downloads/pyglotaran-starter-kit.zip`. |
| `public/downloads/pyglotaran-starter-kit.zip` | The built asset, served at `/downloads/pyglotaran-starter-kit.zip`. |
| `src/pages/starter-kit.astro` | The landing page that links to the download. |
| `src/components/SiteNav.astro` | Adds the `First time?` nav link (`active: 'starter'`). |
| `src/pages/index.astro` | Home hero adds the green `First time? Get the starter kit` button. |

So the site repo is self-contained: editing the sources here is all that's
needed to update the download. The site build regenerates the zip automatically.

## Rebuilding the zip

Any stdlib Python 3.11+ works — no dependencies:

```bash
python starter-kit/build_zip.py
```

This overwrites `public/downloads/pyglotaran-starter-kit.zip`. The Unix
executable bit is set on the macOS/Linux launchers, line endings are normalized
(`.bat` → CRLF, shell scripts → LF), and test output / caches are excluded.
The generated zip is ignored by Git; commit the source changes only.

`npm run dev` and `npm run build` regenerate the zip before Astro starts. CI and
release builds therefore always package the current source.

## The kit's user experience

1. Download `pyglotaran-starter-kit.zip` and unzip it.
2. Double-click one `START_HERE` file for the OS:
   - Windows: `START_HERE_Windows.bat`
   - macOS: right-click `START_HERE_Mac.command` → Open
   - Linux: `bash START_HERE_Linux.sh`
3. First run installs `uv`, syncs the pinned env, and opens JupyterLab.
4. Work through `01_welcome` → `02_two_component` → `03_three_component` →
   `04_fluorescence` → `05_going_further`.

Nothing is installed system-wide; everything lives in the unzipped folder and
uv's cache. First launch needs internet (~500 MB); later launches are offline.

## What's in `starter/`

| Path | Purpose |
| ---- | ------- |
| `START_HERE_*` | One-double-click launchers per OS (install + run). |
| `READ_ME_FIRST.html` | Illustrated, OS-tabbed getting-started guide. |
| `README.txt` | Plain-text fallback of the same. |
| `01_welcome.ipynb` | Teaches "what is a notebook" + verifies the install. |
| `02_two_component.ipynb` | First full analysis; two-state decay, data from a CSV file. |
| `03_three_component.ipynb` | Same workflow, three-state decay from a CSV file. |
| `04_fluorescence.ipynb` | Same workflow on a real Photosystem I fluorescence dataset (`.ascii`). |
| `05_going_further.ipynb` | Markdown-only signpost to target analysis and published case studies. |
| `02_two_component/`, `03_three_component/`, `04_fluorescence/` | Data, model, and parameter files. |
| `csv_tools.py` | Small helper (`load_csv_dataset`) that reads a CSV export into a pyglotaran dataset. |
| `pyproject.toml`, `uv.lock` | Pin `pyglotaran`, `pyglotaran-extras`, `jupyterlab`. |
| `.python-version` | Python version uv provisions. |
| `DATA_AND_LICENSES.txt` | Data provenance and licensing. |

## Updating pinned versions

When a new pyglotaran / pyglotaran-extras release lands:

1. Bump versions in `starter/pyproject.toml`, then regenerate the lock:
   `cd starter-kit/starter && uv lock`.
2. Re-run every notebook top to bottom against the new versions and confirm the
   plots and saved results still look right.
3. Update version numbers in `starter/DATA_AND_LICENSES.txt`,
   `starter/READ_ME_FIRST.html`, and (the `.zip` size on) `src/pages/starter-kit.astro`.
4. Rebuild the zip and commit.

Current pins: **pyglotaran 0.7.4**, **pyglotaran-extras 0.7.4**.

## Design notes

- **`uv` over conda/pip-venv**: single static binary, installs its own Python,
  no admin rights — the smallest possible ask of a non-technical user.
- **CSV data in notebooks 02–03**: the data is simulated (so the fit always
  converges and nothing depends on a download), but shipped as a plain `.csv`
  read via `csv_tools.load_csv_dataset` — so beginners load data from a file the
  way they will with their own exports, not from a Python-only test fixture.
  `02_two_component` is deliberately the simplest possible case; `03_three_component`
  shows the model scaling by one state with everything else unchanged.
- **Real data in notebook 04**: the Photosystem I fluorescence dataset from
  `pyglotaran-examples` (global model only), so the leap to "my own experiment"
  is small.
- **Notebook 05 is markdown-only**: a signpost to target analysis, multi-dataset
  fits, and published case studies — no code to run or maintain.
- **`csv_tools.py` is intentionally tiny and lives at the kit root**: JupyterLab
  launches there, so `from csv_tools import load_csv_dataset` just works, and the
  helper is short enough for a curious beginner to read. pyglotaran does not read
  CSV natively yet; when it does, this helper can be retired.
- **Windows launcher uses `goto` labels, not `if ( )` blocks**: a literal `)` in
  an echo inside a parenthesized block silently corrupts cmd.exe parsing, which
  made an earlier version always exit before launching JupyterLab.
