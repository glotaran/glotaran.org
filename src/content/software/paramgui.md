---
name: paramGUI
lang: r
status: stable
order: 4
summary: A Shiny-based R package for teaching parameter estimation examples inspired by time-resolved spectroscopy.
cran: https://cran.r-project.org/package=paramGUI
github: https://github.com/glotaran/paramGUI
badges:
  - CRAN
  - Shiny
  - education
---

# About paramGUI

paramGUI is an R package that provides an interactive browser-based interface
for teaching parameter estimation in the context of global and target analysis.
Built with the [Shiny](https://shiny.posit.co/) web-app framework and using
[TIMP](/software/timp) as its computational backend, it lets students explore
kinetic models, adjust parameters, run fits, and inspect results — all without
writing R code.

## Use cases

- Teaching courses on time-resolved spectroscopy analysis
- Demonstrating the effect of initial parameter guesses on convergence
- Introducing students to global and target analysis concepts interactively

## Installation

paramGUI is [available on CRAN](https://cran.r-project.org/package=paramGUI).
From an R console:

```r
install.packages("paramGUI")
```

## History

The first version of paramGUI was created by Katharine Mullen and Ivo van
Stokkum in 2008 for internal use at the Vrije Universiteit Amsterdam, where it
was used for teaching with a Tcl/Tk-based GUI. In 2016 Joris Snellenburg
rebuilt the frontend as a Shiny web app and released it to CRAN as version 2.0.
The current release is v2.2.0 (December 2022).

## Python successor

An early proof-of-concept to re-create paramGUI-style teaching widgets on top
of pyglotaran is available as [PyParamGUI](/software/pyparamgui).
