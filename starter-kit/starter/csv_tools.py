"""A tiny CSV reader for the starter kit.

pyglotaran does not (yet) read plain CSV files directly, so this module
provides one small helper, :func:`load_csv_dataset`, that turns a CSV export
into the same kind of dataset ``glotaran.io.load_dataset`` returns.

The expected CSV layout is the one you get by exporting a time-vs-wavelength
matrix from a spreadsheet:

    time,   600,    602.5,  605,   ...     <- first row: wavelengths
    -2,     0.149, -0.041,  0.194, ...     <- each next row: one time point
    -1.6,   0.201,  0.087, -0.130, ...
    ...

The very first column holds the time points and the first row (after the
"time" label) holds the wavelengths. Everything else is the measured signal.

You do not need to understand this file to use the starter kit -- the
notebooks just call ``load_csv_dataset("...")``. It is kept short and readable
on purpose, in case you are curious or want to adapt it to your own exports.
"""
from __future__ import annotations

import pandas as pd
import xarray as xr


def load_csv_dataset(path: str) -> xr.Dataset:
    """Read a time-vs-wavelength CSV into a pyglotaran-ready dataset.

    Parameters
    ----------
    path
        Path to the CSV file. First column = time, first row = wavelengths.

    Returns
    -------
    xarray.Dataset
        A dataset with a single ``data(time, spectral)`` variable, ready to
        drop into a :class:`~glotaran.project.scheme.Scheme`.
    """
    frame = pd.read_csv(path, index_col=0)

    time = frame.index.to_numpy(dtype=float)
    spectral = frame.columns.to_numpy(dtype=float)

    return xr.DataArray(
        frame.to_numpy(dtype=float),
        coords={"time": time, "spectral": spectral},
        dims=("time", "spectral"),
    ).to_dataset(name="data")
