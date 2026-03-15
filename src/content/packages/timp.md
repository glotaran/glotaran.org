---
name: TIMP
lang: r
status: stable
order: 3
summary: R package implementing the partitioned variable projection algorithm for global and target analysis. The foundation of the Glotaran ecosystem.
cran: https://cran.r-project.org/web/packages/TIMP/
github: https://github.com/glotaran/TIMP
badges:
  - CRAN
  - VARPRO
  - FLIM
---

TIMP (Toolkit for Image and Multivariate Spectroscopy Processing) is an R
package for fitting superposition models to multi-way spectroscopy datasets.
It implements the partitioned variable projection (VARPRO) algorithm, which
separates linear and nonlinear parameters to dramatically reduce the effective
dimensionality of the optimization problem.

TIMP is the computational engine that [glotaran-legacy](/packages/glotaran-legacy)
provided a GUI for, and its algorithm is re-implemented in
[pyglotaran](/packages/pyglotaran) for the Python ecosystem. Cross-validation between
the two implementations is maintained in
[pyglotaran-validation](https://github.com/glotaran/pyglotaran-validation).

## Applications

- Transient absorption spectroscopy
- Time-resolved fluorescence
- Fluorescence Lifetime Imaging Microscopy (FLIM)
- Any dataset that can be described as a superposition model with separable linear/nonlinear parameters

## Installation

From CRAN:

```r
install.packages("TIMP")
```

Or the development version from GitHub:

```r
# install.packages("remotes")
remotes::install_github("glotaran/TIMP")
```

## Usage

```r
library(TIMP)

# load your dataset (e.g. a matrix of transient spectra)
dat <- readData("measurement.ascii")

# define a kinetic model with two exponentials
m <- kinspecr(
  componentmodel = c("irf.gaussian"),
  nexp = 2,
  lambdac = c(1/0.5, 1/5.0)   # starting guesses for rate constants
)

result <- fitModel(list(dat), list(m))
plotkinspec(result)
```

## Citation

If you use TIMP, please cite:

> Mullen KM, van Stokkum IHM (2007). TIMP: An R package for modeling
> multi-way spectroscopic measurements.
> *Journal of Statistical Software* 18(3).
> DOI: [10.18637/jss.v018.i03](https://doi.org/10.18637/jss.v018.i03)
