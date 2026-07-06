#!/usr/bin/env python3
"""Build the distributable pyglotaran starter-kit zip.

Zips the ``starter/`` folder straight into the site's
``public/downloads/pyglotaran-starter-kit.zip`` so the glotaran.org build picks
it up as a static asset (served at ``/downloads/pyglotaran-starter-kit.zip`` and
linked from ``src/pages/starter-kit.astro``).

Run from anywhere:

    python starter-kit/build_zip.py

Stdlib only - no dependencies. The Unix executable bit is preserved on the
macOS/Linux launcher scripts, and line endings are normalized per file type
(.bat -> CRLF, shell scripts -> LF) so everything works after unzipping.
"""
from __future__ import annotations

import stat
import zipfile
from pathlib import Path

HERE = Path(__file__).resolve().parent
SRC = HERE / "starter"
# Build straight into the site's public assets so `npm run build` ships it.
OUT = HERE.parent / "public" / "downloads" / "pyglotaran-starter-kit.zip"
# Everything is unpacked under this top-level folder inside the zip.
ROOT_IN_ZIP = "pyglotaran-starter-kit"

# Files/dirs never shipped (test output, caches, editor cruft).
EXCLUDE_DIRS = {"results", "__pycache__", ".ipynb_checkpoints", ".venv", ".git"}
EXCLUDE_NAMES = {".DS_Store", "Thumbs.db"}
# These get the Unix executable bit (0o755) so they run after unzip on Mac/Linux.
EXECUTABLE = {"START_HERE_Mac.command", "START_HERE_Linux.sh"}
# Line-ending normalization by suffix. Windows .bat must be CRLF (LF can break
# `goto`/labels on some cmd.exe versions); shell scripts must stay LF.
CRLF_SUFFIXES = {".bat"}
LF_SUFFIXES = {".sh", ".command"}


def normalize_newlines(path, data: bytes) -> bytes:
    if path.suffix not in CRLF_SUFFIXES and path.suffix not in LF_SUFFIXES:
        return data
    # Collapse any existing CRLF/CR to LF first, then apply the target ending.
    text = data.replace(b"\r\n", b"\n").replace(b"\r", b"\n")
    if path.suffix in CRLF_SUFFIXES:
        return text.replace(b"\n", b"\r\n")
    return text


def iter_files():
    for path in sorted(SRC.rglob("*")):
        if path.is_dir():
            continue
        rel_parts = path.relative_to(SRC).parts
        if any(part in EXCLUDE_DIRS for part in rel_parts):
            continue
        if path.name in EXCLUDE_NAMES:
            continue
        yield path


def main() -> None:
    if not SRC.is_dir():
        raise SystemExit(f"Source folder not found: {SRC}")

    OUT.parent.mkdir(parents=True, exist_ok=True)
    if OUT.exists():
        OUT.unlink()

    count = 0
    with zipfile.ZipFile(OUT, "w", zipfile.ZIP_DEFLATED, compresslevel=9) as zf:
        for path in iter_files():
            arcname = f"{ROOT_IN_ZIP}/{path.relative_to(SRC).as_posix()}"
            info = zipfile.ZipInfo(arcname)
            data = normalize_newlines(path, path.read_bytes())
            info.compress_type = zipfile.ZIP_DEFLATED
            # Set Unix mode bits in the high word of external_attr.
            mode = 0o755 if path.name in EXECUTABLE else 0o644
            info.external_attr = (stat.S_IFREG | mode) << 16
            zf.writestr(info, data)
            count += 1

    size_mb = OUT.stat().st_size / (1024 * 1024)
    print(f"Wrote {OUT}")
    print(f"  {count} files, {size_mb:.2f} MB")
    print(f"  Top-level folder in zip: {ROOT_IN_ZIP}/")


if __name__ == "__main__":
    main()
