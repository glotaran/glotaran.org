---
name: pyglotaran
lang: python
status: active
order: 1
summary: A LEGO-like Python framework for global and target analysis of time-resolved spectra.
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

pyglotaran is the modern Python successor to [glotaran-legacy](/software/glotaran-legacy).
It provides a declarative, YAML-based model specification language and a
flexible kinetic model library built around the scientific Python stack.

## Key features

- **Declarative models** — describe your kinetic scheme in a YAML file; no
  boilerplate Python required for standard analyses.
- **Partitioned variable projection (VARPRO)** — the same algorithm that
  underpins TIMP, reimplemented in Python with full test coverage.
- **Simultaneous multi-dataset analysis** — link parameters across multiple
  measurements in a single optimization.
- **Extensible** — add custom megacomplex types without forking the core library.
- **Cross-validated** — results are systematically compared against TIMP via
  the [pyglotaran-validation](https://github.com/glotaran/pyglotaran-validation)
  repository.

## Installation

```sh
pip install pyglotaran
```

Or with the extended plotting utilities:

```sh
pip install pyglotaran pyglotaran-extras
```

Conda-forge package is also available:

```sh
conda install -c conda-forge pyglotaran
```

## Quickstart

```python
import pyglotaran as pg

model  = pg.read_model_from_yaml("model.yaml")
data   = pg.load_dataset("measurement.sdt")

scheme = pg.Scheme(
    model=model,
    data={"dataset_1": data},
)

result = pg.optimize(scheme)
result.save("result/")
```

See the [getting started guide](https://pyglotaran.readthedocs.io/en/latest/notebooks/getting_started/getting_started.html)
and the [pyglotaran-examples](https://github.com/glotaran/pyglotaran-examples)
repository for real-world case studies.

## Status

Active development. The API is stabilising; see the
[usage notice](https://github.com/glotaran/pyglotaran/blob/main/NOTICE.md)
for caveats before committing to a production workflow.

## Citation

If you use pyglotaran in a publication, please cite the 2023 paper:

> Snellenburg JJ et al. (2023). pyglotaran: a lego-like Python framework for
> global and target analysis of time-resolved spectra.
> *Photochemical & Photobiological Sciences.*
> DOI: [10.1007/s43630-023-00460-y](https://doi.org/10.1007/s43630-023-00460-y)
