#!/bin/sh
# Download a pinned uv installer and verify it before execution.
set -eu

version="0.11.26"
expected_sha256="92fa9085d24c214bb4445cc1da8c15ca9cca8cffb34726240fa08c5302e94ccc"
url="https://github.com/astral-sh/uv/releases/download/${version}/uv-installer.sh"
installer="${TMPDIR:-/tmp}/uv-installer-${version}-$$.sh"

cleanup() {
    rm -f "$installer"
}
trap cleanup EXIT HUP INT TERM

curl --proto '=https' --tlsv1.2 -LsSf "$url" -o "$installer"

if command -v sha256sum >/dev/null 2>&1; then
    actual_sha256=$(sha256sum "$installer" | awk '{print $1}')
elif command -v shasum >/dev/null 2>&1; then
    actual_sha256=$(shasum -a 256 "$installer" | awk '{print $1}')
else
    echo "A SHA-256 tool (sha256sum or shasum) is required to install uv safely." >&2
    exit 1
fi

if [ "$actual_sha256" != "$expected_sha256" ]; then
    echo "uv installer checksum mismatch; refusing to run it." >&2
    exit 1
fi

sh "$installer"
