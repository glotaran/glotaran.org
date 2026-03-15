---
name: TIMP
lang: r
status: stable
order: 3
summary: R package for multi-way spectroscopy, global and target analysis, and partitioned variable projection in the original Glotaran stack.
cran: https://cran.r-project.org/web/packages/TIMP/
github: https://github.com/glotaran/TIMP
badges:
  - CRAN
  - VARPRO
  - FLIM
---

TIMP is the R package that the original Glotaran stack was built around. The
2007 paper presents it as an open, cross-platform problem-solving environment
for fitting superposition models to multi-way spectroscopic measurements.

The paper also notes that the name refers back to the earlier tim collection of
FORTRAN routines developed for modeling time-resolved spectroscopy data; it says
explicitly that TIMP stands for "tim package."

The package was designed for what the paper calls "interactive scientific model
discovery": formulate a candidate model, fit it, validate the result, and then
refine the model if the residuals or parameter estimates show that more work is
needed.

Its key technical contribution is partitioned variable projection. TIMP uses it
to separate conditionally linear parameters from intrinsically nonlinear ones,
reducing the effective nonlinear search space and, as the paper emphasizes,
allowing large spectroscopy fitting problems to be handled with less memory than
standard variable projection implementations.

The later Glotaran paper describes the Java application as a graphical front end
to TIMP's mathematical framework and computational algorithms. TIMP remained the
modeling engine, while Glotaran added interactive data exploration, assisted
model specification, and result inspection.

## What TIMP Provided

TIMP was built to handle multiple datasets collected under related conditions,
share parameters across experiments when appropriate, and fit other parameters
per dataset when the experimental design required that.

The package supports multiexponential kinetics, Gaussian or measured
instrument response functions, wavelength-dependent dispersion, coherent
artifacts, sequential and parallel compartment models, full transfer-matrix
schemes, and spectral descriptions based on Gaussian, Lorentzian, Voigt,
skewed-Gaussian, and spline-based parameterizations. It also includes practical
tools for constraints and parameter relations, including positivity
constraints, zero constraints, and linked parameters across selected regions or
datasets.

The paper also presents TIMP as a framework that can be extended to new model
types with relatively little additional code.

## Representative Example

One of the paper's case studies fits two transient spectroscopy datasets
measured at different laser intensities, using a five-component sequential model
with a Gaussian instrument response, wavelength-dependent dispersion, a coherent
artifact term, and a mix of shared and dataset-specific parameters.

That example is more representative of TIMP than a minimal two-exponential fit.
It shows the package being used for simultaneous analysis of full time-wavelength
datasets, with explicit modeling of compartments, lifetimes, instrument
response, and experiment-to-experiment differences.

In code, that workflow starts along these lines:

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

The exact syntax is less important than the modeling structure behind it. TIMP
lets the user specify compartments, rate constants, instrument response,
dispersion, artifacts, spectral constraints, and dataset-to-dataset differences
within one fit.

## Where TIMP Was Used

- Transient absorption spectroscopy
- Time-resolved fluorescence
- Fluorescence Lifetime Imaging Microscopy (FLIM)
- Multi-experiment global and target analysis across related datasets
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

## Citation

If you use TIMP, please cite:

> Mullen KM, van Stokkum IHM (2007). TIMP: An R package for modeling
> multi-way spectroscopic measurements.
> *Journal of Statistical Software* 18(3).
> DOI: [10.18637/jss.v018.i03](https://doi.org/10.18637/jss.v018.i03)
