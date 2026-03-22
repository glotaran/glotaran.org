---
name: PyParamGUI
lang: python
status: wip
order: 5
summary: An early proof-of-concept to re-create paramGUI-style teaching widgets on top of pyglotaran.
github: https://github.com/glotaran/PyParamGUI
badges:
  - ipywidgets
  - education
  - Jupyter
---

PyParamGUI is a first attempt to bring the interactive teaching experience of
the R-based [paramGUI](/software/paramgui) package into the Python ecosystem.
It uses [pyglotaran](/software/pyglotaran) as its backend and provides Jupyter
notebook widgets for simulating data, visualising results, and generating model
files.

> **Rough draft.** PyParamGUI is pre-alpha and not yet published to PyPI.
> It was created as a minimum-viable concept during a student project and
> should be considered experimental. Expect missing features and breaking
> changes.

## Relationship to paramGUI

[paramGUI](/software/paramgui) is the stable, CRAN-published R/Shiny application
for teaching parameter estimation — built on top of [TIMP](/software/timp).
PyParamGUI aims to eventually offer a similar experience using pyglotaran
instead of TIMP, but it is not yet a replacement.

## Running with uv

Because the package is not yet on PyPI, install it directly from GitHub.
The easiest way is a one-off ephemeral session with [uv](https://docs.astral.sh/uv/):

```sh
uv run --with "pyparamgui @ git+https://github.com/glotaran/PyParamGUI" \
       --with jupyter \
       jupyter lab
```

Then inside a notebook:

```python
from pyparamgui import show

show()
```

Alternatively, add it to a project environment:

```sh
uv pip install "pyparamgui @ git+https://github.com/glotaran/PyParamGUI"
```
