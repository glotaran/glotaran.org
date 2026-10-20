---
name: Glotaran 1.x
lang: java
status: maintained
order: 5
summary: Graphical tool for global and target analysis, cited over 1,500 times since 2012.
version: "1.7.0"
github: https://github.com/glotaran/glotaran-legacy
docs: https://glotaran.github.io/legacy/
badges:
  - Java 25
  - NetBeans 31
  - v1.7.0
---

# About glotaran-legacy

Glotaran is a graphical tool for global and target analysis of time-resolved spectroscopy data. It is the original tool in the GloTarAn ecosystem and still the most cited, with over 1,500 citations since the [2012 JSS publication](/publications). It lets experimentalists do compartmental modeling without writing code.

Glotaran is built on the NetBeans Platform and uses TIMP's partitioned variable projection engine through Rserve. In one desktop application you import data, explore it interactively, build kinetic models, run fits and inspect the results. It is widely used in ultrafast spectroscopy and photosynthesis research.

Glotaran 1.x is still maintained and runs on current Windows, macOS and Linux computers. For new work and Python-based workflows, see [pyglotaran](/software/pyglotaran), which provides the same analysis capabilities through a Python scripting interface.

## Features

The main workspace is the **drag-and-drop analysis canvas**. You set up an analysis by linking Dataset, Model and Output containers with arrows, configure the model, and run the fit.

### Data exploration

- 2D intensity visualization (wavelength × time heatmap with color-mapped signal amplitude)
- Interactive sliders to scan through individual time-traces and spectra
- Data trimming via bounding boxes drawn directly on the visualizer
- Singular Value Decomposition that updates as you explore, to estimate the number of kinetic components before fitting
- Support for multiple vendor formats (Hamamatsu `.img`, Becker & Hickl `.sdt`, PicoQuant `.pt3`, and plain-text formats)

### Model building

- Visual K-matrix editor: define compartmental and kinetic schemes by filling in rate constants in a grid
- Instrument response function modeling (Gaussian position and width)
- Wavelength-dependent dispersion via polynomial models
- Sequential, parallel, and full target models
- Coherent artifact handling

### Results and output

- Linear-logarithmic time axis, to show fast early-time dynamics and slow decays in one plot
- Fitted traces overlaid on raw data
- Evolution-Associated Spectra (EAS), Decay-Associated Spectra (DAS), and Species-Associated Spectra (SAS)
- Concentration profile plots
- Residual SVD analysis for fit quality assessment

## For existing users

- Open the [legacy resources page](/software/glotaran-legacy/resources) for
  curated documentation and the original getting-started screencast.
- Use the full [legacy documentation site](https://glotaran.github.io/legacy/)
  for installation notes, workflow details, file formats, and other archived
  reference material.
- Download binaries from the
  [GitHub releases page](https://github.com/glotaran/glotaran-legacy/releases).
- Cite the original Java UI with the [2012 Glotaran paper](/publications).

## Download

Download Glotaran from the [GitHub releases page](https://github.com/glotaran/glotaran-legacy/releases). The installers for Windows, macOS and Linux include Java.

- **[Glotaran 1.7.0](https://github.com/glotaran/glotaran-legacy/releases/tag/v1.7.0)** is recommended for new users and receives new features. On the first analysis it downloads and starts R with TIMP and Rserve for you (a few hundred MB).
- **[Glotaran 1.6.1](https://github.com/glotaran/glotaran-legacy/releases/tag/v1.6.1)** is for computers without internet access, or where a proxy or IT policy blocks that download. You install R, TIMP and Rserve yourself, as in Glotaran 1.5.

## The graphical interface

Glotaran runs global and target analysis from a graphical interface. You build models on a drag-and-drop canvas, inspect the data with an SVD that updates as you go, edit the K-matrix visually, and plot time on a linear-logarithmic axis. It has been used in more than 1,500 publications.

If your workflow is built around the desktop GUI, you can keep using it. The documentation, the original screencast and the publication list remain available.

## Citation

> Snellenburg JJ, Laptenok SP, Seger R, Mullen KM, van Stokkum IHM (2012).
> Glotaran: A Java-Based Graphical User Interface for the R Package TIMP.
> *Journal of Statistical Software* 49(3), 1–22.
> DOI: [10.18637/jss.v049.i03](https://doi.org/10.18637/jss.v049.i03)
