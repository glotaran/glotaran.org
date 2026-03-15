---
name: PyParamGUI
lang: python
status: active
order: 4
summary: Interactive Jupyter notebook widgets for teaching parameter estimation concepts in global analysis.
github: https://github.com/glotaran/PyParamGUI
badges:
  - ipywidgets
  - education
  - Jupyter
---

PyParamGUI provides interactive Jupyter widgets that let students and new
users explore how parameter estimation works in the context of global and
target analysis — without needing to set up a full pyglotaran workflow.

It is the Python successor to the R-based
[paramGUI](https://github.com/glotaran/paramGUI) package.

## Use cases

- Teaching courses on time-resolved spectroscopy analysis
- Demonstrating the effect of initial parameter guesses on convergence
- Illustrating the difference between global and target analysis models

## Installation

```sh
pip install pyparamgui
```

Then open a Jupyter notebook and import the widgets:

```python
from pyparamgui import show

show()
```
