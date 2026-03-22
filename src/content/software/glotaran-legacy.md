---
name: Glotaran 1.x
lang: java
status: archived
order: 5
summary: The original — and still the most-cited — graphical tool for global and target analysis, with over 1,500 citations since 2012.
version: "1.5.1"
github: https://github.com/glotaran/glotaran-legacy
docs: https://glotaran.github.io/legacy/
badges:
  - Java 8
  - NetBeans
  - v1.5.1
---

The original — and still the most-cited — tool for global and target
analysis of time-resolved spectroscopy data. With over 1,500 citations
since its [2012 JSS publication](/publications), Glotaran brought rigorous
compartmental modeling to an entire generation of experimentalists who
work visually rather than in code.

Built on the NetBeans Platform and backed by TIMP's partitioned variable
projection engine via Rserve, Glotaran gave researchers a complete
desktop environment for importing data, exploring it interactively,
building kinetic models, running fits, and inspecting results — all
without writing a single line of code. It became the standard tool in
ultrafast spectroscopy and photosynthesis labs worldwide.

The 1.5.1 release remains fully functional on any operating system with
Java 8. For Python-based workflows, see also
[pyglotaran](/software/pyglotaran), which reimagines these capabilities
with a modern scripting interface.

## What set the standard

At Glotaran's heart is the **drag-and-drop analysis canvas** — a visual
workspace where users construct an analysis scheme by linking Dataset,
Model, and Output containers with directional arrows. No command line,
no scripting: connect the nodes, configure the model, and run.

### Data exploration

- 2D intensity visualization (wavelength × time heatmap with color-mapped signal amplitude)
- Interactive sliders to scan through individual time-traces and spectra
- Data trimming via bounding boxes drawn directly on the visualizer
- Real-time Singular Value Decomposition — instantly estimate the number of kinetic components before fitting
- Support for multiple vendor formats (Hamamatsu `.img`, Becker & Hickl `.sdt`, PicoQuant `.pt3`, and plain-text formats)

### Model building

- Visual K-matrix editor for defining compartmental and kinetic schemes — abstracting the linear algebra into an intuitive grid
- Instrument response function modeling (Gaussian position and width)
- Wavelength-dependent dispersion via polynomial models
- Sequential, parallel, and full target models
- Coherent artifact handling

### Results and output

- Linear-logarithmic time axis — ultrafast early-time dynamics and slow long-term decays on a single plot
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

Version 1.5.1 is available from the
[GitHub releases page](https://github.com/glotaran/glotaran-legacy/releases).

Requires Java 8 or later. Windows and macOS installers are included alongside the cross-platform `.jar`.

## A masterclass in scientific interface design

Glotaran proved that rigorous global and target analysis could be made
accessible through a visual interface without sacrificing analytical
depth. Its drag-and-drop canvas, real-time SVD, visual K-matrix editor,
and linear-logarithmic time axis defined what scientific fitting software
could look and feel like — and 1,500+ publications later, that design
still holds up.

Researchers with established workflows around the desktop GUI can
continue to use it with confidence. The documentation, the original
screencast, and the full publication record are preserved for continuity.

## Citation

> Snellenburg JJ, Laptenok SP, Seger R, Mullen KM, van Stokkum IHM (2012).
> Glotaran: A Java-Based Graphical User Interface for the R Package TIMP.
> *Journal of Statistical Software* 49(3), 1–22.
> DOI: [10.18637/jss.v049.i03](https://doi.org/10.18637/jss.v049.i03)
