---
name: pyglotaran
lang: python
status: active
order: 1
summary: A Python framework for global and target analysis of time-resolved spectroscopy, microscopy and other multi-way data using composable text-based model definitions.
version: "0.7.4"
pypi: https://pypi.org/project/pyglotaran/
github: https://github.com/glotaran/pyglotaran
docs: https://pyglotaran.readthedocs.io
zenodo: https://zenodo.org/doi/10.5281/zenodo.4534043
badges:
  - matplotlib
  - xarray
  - numpy
  - Jupyter
---

# About pyglotaran

pyglotaran is a Python framework for global and target analysis of time-resolved spectroscopy, microscopy and other multi-way data. It is intended for projects where models, parameters, datasets, and fit results should remain explicit and inspectable throughout the analysis, rather than being tied to a GUI session or a one-off script.

Its design is modular: models are assembled from reusable components, described in plain-text files, and refined through an iterative workflow of model specification, parameter estimation, and model validation. This makes it suitable for research projects where the model is expected to evolve as the interpretation becomes clearer.

## Capabilities

- Readable model definitions — model and parameter files are stored as plain text, which makes them easier to inspect, review, version-control, and reuse.
- Modular model construction — analyses are built from reusable model elements rather than a fixed set of templates, so models can be extended as needed.
- Simultaneous analysis of related datasets — pyglotaran can fit multiple datasets together and express shared parameters or linked parts of a model where appropriate.
- Python-native workflow — datasets and results stay in the scientific Python stack, which fits naturally with xarray, matplotlib, and Jupyter notebooks.
- Extensible architecture — new model elements and file formats can be added through the plugin system without modifying the core package.

## Installation

```shell
pip install pyglotaran pyglotaran-extras
```

Conda-forge packages are also available:

```shell
conda install -c conda-forge pyglotaran pyglotaran-extras
```

## Quickstart

A typical workflow is: create a project, import data, define a model and starting parameters, validate the setup, and run the fit.

Place the model file in `my_project/models/` and the parameter file in `my_project/parameters/`, then run the notebook cells against your dataset.

### example.ipynb

```python
from glotaran.testing.simulated_data import sequential_spectral_decay
from glotaran.project import Project
from pyglotaran_extras import plot_overview, plot_data_overview

my_dataset = sequential_spectral_decay.DATASET
my_project = Project.open("my_project")
my_project.import_data(my_dataset, dataset_name="my_data")
plot_data_overview(my_dataset)  # to explore the dataset

result = my_project.optimize("my_model", "my_parameters")

# Run each in a separate cell:
result  # to inspect the optimization result
result.optimized_parameters  # view optimized parameters
plot_overview(result)  # result plot
```

### my_model.yaml

```yaml
initial_concentration:
  input:
    compartments: [s1, s2, s3]
    parameters: [input.1, input.0, input.0]
k_matrix:
  k1:
    matrix:
      (s2, s1): kinetic.1
      (s3, s2): kinetic.2
      (s3, s3): kinetic.3
megacomplex:
  m1:
    k_matrix: [k1]
    type: decay
irf:
  irf1:
    type: gaussian
    center: irf.center
    width: irf.width
dataset:
  my_data:
    initial_concentration: input
    megacomplex: [m1]
    irf: irf1
```

### my_parameters.yaml

```yaml
input:
  - ["1", 1, { "vary": False }]
  - ["0", 0, { "vary": False }]

kinetic: [0.51, 0.31, 0.11]

irf:
  - ["center", 0.31]
  - ["width", 0.11]
```

See the [getting started guide](https://pyglotaran.readthedocs.io/en/latest/notebooks/getting_started/getting_started.html) for a step-by-step introduction, and the [pyglotaran-examples](https://github.com/glotaran/pyglotaran-examples) repository for worked examples.

## Status

Active development. The package is documented and maintained, but parts of the API and modeling language are still evolving; check the usage notice before depending on it for long-lived tooling.

## Citation

If you use pyglotaran in a publication, please cite the 2023 paper:

> van Stokkum IHM, Weißenborn J, Weigand S, Snellenburg JJ (2023). pyglotaran:
> a lego-like Python framework for global and target analysis of time-resolved
> spectra. Photochemical & Photobiological Sciences, 22(10), 2413–2431. </br>
> DOI: [10.1007/s43630-023-00460-y](https://doi.org/10.1007/s43630-023-00460-y)
