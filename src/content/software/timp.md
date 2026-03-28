---
name: TIMP
lang: r
status: stable
order: 3
summary: The foundational R engine for global and target analysis, providing partitioned variable projection since 2007.
cran: https://cran.r-project.org/web/packages/TIMP/
github: https://github.com/glotaran/TIMP
badges:
  - CRAN
  - VARPRO
  - FLIM
---

# About TIMP

TIMP implements partitioned variable projection for separable nonlinear
least-squares problems. By splitting conditionally linear parameters from
intrinsically nonlinear ones it reduces the effective search space and, more
importantly, the memory footprint — making it practical to fit large
time-wavelength matrices that would be expensive with standard variable
projection.

The name refers back to the earlier *tim* collection of FORTRAN routines for
modeling time-resolved spectroscopy data, which could not be published due to
library licensing constraints. TIMP was the first attempt to free this software
by rebuilding it on the open foundation of the R ecosystem as an R package —
hence, presumably, the name.

Published in the *Journal of Statistical Software* in 2007, TIMP is the R
engine on which the original Glotaran desktop application was built. The Java
GUI added interactive data exploration and visual model specification, while
TIMP remained the computational core.

TIMP is designed around what its authors call "interactive scientific model
discovery": formulate a candidate model, fit it, inspect the residuals and
parameter estimates, then refine the model until the fit is satisfactory.

## Capabilities

TIMP handles multiple datasets collected under related conditions, sharing
parameters across experiments where appropriate and fitting others per dataset.

### Kinetic models

- Sequential and parallel compartment schemes
- Full transfer-matrix (target) models
- Multiexponential kinetics with any number of components

### Instrument response and dispersion

- Gaussian or measured instrument response functions
- Wavelength-dependent dispersion modeling
- Coherent artifact terms

### Spectral parameterizations

- Gaussian, Lorentzian, Voigt, and skewed-Gaussian lineshapes
- Spline-based spectral descriptions

### Constraints and parameter relations

- Optional non-negative (or non-positive) least-squares estimation of
  conditionally linear parameters — the work on TIMP led to the standalone
  [`nnls`](https://cran.r-project.org/web/packages/nnls/) CRAN package, an R
  interface to the Lawson–Hanson NNLS algorithm
- Positivity and zero constraints on selected nonlinear parameters
- Linked parameters across spectral regions or datasets
- Shared and dataset-specific parameter partitioning

### Additional domains

- Fluorescence Lifetime Imaging Microscopy (FLIM)
- Any data described by a superposition model with separable linear/nonlinear
  parameters

## Representative Example

The code below fits two transient spectroscopy datasets measured at different
laser intensities with a five-component sequential model, Gaussian IRF,
wavelength-dependent dispersion, a coherent artifact term, and a mix of shared
and dataset-specific parameters:

```r
library(TIMP)

psi_1 <- preProcess(readData("psi_1.txt"), scalx2 = c(3.78, 643.5))
psi_2 <- preProcess(readData("psi_2.txt"), scalx2 = c(3.78, 643.5))

model <- initModel(
  mod_type = "kin",
  kinpar = c(7.9, 1.08, 0.129, 0.0225, 0.00156),
  irfpar = c(-0.1018, 0.0434),
  parmu = list(c(0.230)),
  lambdac = 650,
  seqmod = TRUE,
  positivepar = c("kinpar"),
  cohspec = list(type = "irf")
)

result <- fitModel(
  list(psi_1, psi_2),
  model,
  modeldiffs = list(
    dscal = list(list(to = 2, from = 1, value = 0.5))
  )
)
```

Compartments, rate constants, instrument response, dispersion, artifacts,
spectral constraints, and dataset-to-dataset differences are all expressed
within a single fit.

## Where TIMP is used

TIMP is applied wherever multi-way data can be described as a superposition
model with separable parameters:

- Transient absorption spectroscopy
- Time-resolved fluorescence
- Fluorescence Lifetime Imaging Microscopy (FLIM)
- Multi-experiment global and target analysis across related datasets

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

## Citation

If you use TIMP, please cite:

> Mullen KM, van Stokkum IHM (2007). TIMP: An R package for modeling
> multi-way spectroscopic measurements.
> *Journal of Statistical Software* 18(3). </br>
> DOI: [10.18637/jss.v018.i03](https://doi.org/10.18637/jss.v018.i03)
