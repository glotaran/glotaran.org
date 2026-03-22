---
name: pyglotaran-extras
lang: python
status: active
order: 2
summary: Visualization companion for pyglotaran — publication-ready overview plots and diagnostic figures.
pypi: https://pypi.org/project/pyglotaran-extras/
github: https://github.com/glotaran/pyglotaran-extras
docs: https://pyglotaran-extras.readthedocs.io
badges:
  - matplotlib
  - xarray
---

pyglotaran-extras provides plotting functions that go beyond pyglotaran's
built-in result visualization. Its `plot_overview` function produces
multi-panel figures suitable for direct use in publications.

## Key features

- **`plot_overview`** — one call produces a comprehensive overview of a fit
  result: concentration profiles, species-associated spectra (SAS/DAS),
  residuals, and singular value decomposition.
- **Consistent styling** — all plots follow a coherent style that works
  well for journal figures.
- **xarray-native** — inputs are `xr.Dataset` objects returned directly by
  `pyglotaran.optimize`.

## Installation

```sh
pip install pyglotaran-extras
```

## Example

```python
from pyglotaran_extras import plot_overview

fig, axes = plot_overview(result)
fig.savefig("overview.pdf", dpi=300)
```

See the [examples repository](https://github.com/glotaran/pyglotaran-examples)
for plots produced with this package.
