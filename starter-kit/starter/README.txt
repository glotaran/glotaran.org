pyglotaran starter kit
======================

A ready-to-run kit for global and target analysis with pyglotaran, for people
who have never used Python, notebooks, or a command line.

>>> For the friendly illustrated guide, open READ_ME_FIRST.html in your web
    browser (double-click it). The short version is below.


HOW TO START
------------
Windows : double-click  START_HERE_Windows.bat
macOS   : right-click    START_HERE_Mac.command  ->  Open
Linux   : run            bash START_HERE_Linux.sh

The first run downloads Python and the analysis packages (~500 MB) and takes a
few minutes. Keep the black/terminal window open. Your browser then opens the
analysis environment (JupyterLab).

Later runs start in seconds and work offline.


WHAT TO DO NEXT
---------------
In the browser, open and work through these notebooks in order:

  01_welcome.ipynb          - learn how a notebook works; check the install
  02_two_component.ipynb    - your first full analysis, on data from a CSV file
  03_three_component.ipynb  - the same workflow on a richer three-state dataset
  04_fluorescence.ipynb     - a real, published fluorescence measurement
  05_going_further.ipynb    - where to go next: target analysis and case studies

Inside a notebook: click a code cell and press Shift+Enter to run it.


WHAT'S IN THIS FOLDER
---------------------
  START_HERE_*            launchers, one per operating system
  READ_ME_FIRST.html      illustrated getting-started guide
  0*_*.ipynb              the five tutorial notebooks
  csv_tools.py            small helper to load CSV data files
  02_two_component/       data, model + parameter files for notebook 02
  03_three_component/     data, model + parameter files for notebook 03
  04_fluorescence/        data, model + parameter files for notebook 04
  pyproject.toml          the exact package versions this kit installs
  DATA_AND_LICENSES.txt   data provenance and licensing


TROUBLESHOOTING
---------------
See the "If something goes wrong" section in READ_ME_FIRST.html.

Learn more: https://pyglotaran.readthedocs.io  and  https://glotaran.org
