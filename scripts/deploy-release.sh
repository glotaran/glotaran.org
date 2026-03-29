#!/usr/bin/env bash

set -euo pipefail

OWNER_REPO="${OWNER_REPO:-glotaran/glotaran.org}"
TARGET_DIR="${TARGET_DIR:-/var/www/glotaran.org}"
RELEASE_REF="${1:-latest}"

usage() {
  cat <<EOF
Usage: $(basename "$0") [latest|<tag>]

Download the glotaran.org release archive from GitHub, verify its checksum,
and sync the extracted site into TARGET_DIR.

Environment variables:
  OWNER_REPO   GitHub repository to query (default: glotaran/glotaran.org)
  TARGET_DIR   Deployment target on the server (default: /var/www/glotaran.org)
  DRY_RUN=1    Show what rsync would change without modifying TARGET_DIR
EOF
}

log() {
  printf '[deploy-release] %s\n' "$*" >&2
}

require_command() {
  if ! command -v "$1" >/dev/null 2>&1; then
    log "Missing required command: $1"
    exit 1
  fi
}

if [[ "$RELEASE_REF" == "-h" || "$RELEASE_REF" == "--help" ]]; then
  usage
  exit 0
fi

for command_name in curl tar sha256sum rsync mktemp; do
  require_command "$command_name"
done

case "$TARGET_DIR" in
  ""|"/")
    log "Refusing to deploy into TARGET_DIR='$TARGET_DIR'"
    exit 1
    ;;
esac

release_tag="$RELEASE_REF"
if [[ "$RELEASE_REF" == "latest" ]]; then
  latest_url="https://github.com/${OWNER_REPO}/releases/latest"
  log "Resolving latest release from ${OWNER_REPO}"
  release_url="$(curl -fsSL -o /dev/null -w '%{url_effective}' "$latest_url")"
  release_tag="${release_url##*/}"
  if [[ -z "$release_tag" || "$release_tag" == "latest" ]]; then
    log "Could not resolve latest release tag from ${latest_url}"
    exit 1
  fi
else
  release_tag="${RELEASE_REF#refs/tags/}"
fi

tmp_dir="$(mktemp -d)"

cleanup() {
  rm -rf "$tmp_dir"
}

trap cleanup EXIT

archive_name="glotaran-org-${release_tag}.tar.gz"
checksum_name="${archive_name}.sha256"
archive_url="https://github.com/${OWNER_REPO}/releases/download/${release_tag}/${archive_name}"
checksum_url="https://github.com/${OWNER_REPO}/releases/download/${release_tag}/${checksum_name}"
archive_path="$tmp_dir/$archive_name"
checksum_path="$tmp_dir/$checksum_name"
staging_dir="$tmp_dir/staging"

log "Downloading ${archive_name}"
curl -fsSL "$archive_url" -o "$archive_path"

log "Downloading ${checksum_name}"
curl -fsSL "$checksum_url" -o "$checksum_path"

log "Verifying checksum"
(
  cd "$tmp_dir"
  sha256sum -c "$(basename "$checksum_path")"
)

mkdir -p "$staging_dir"
log "Extracting ${archive_name}"
tar -xzf "$archive_path" -C "$staging_dir"

mkdir -p "$TARGET_DIR"
rsync_args=(
  -a
  --delete
)

if [[ "${DRY_RUN:-0}" == "1" ]]; then
  rsync_args+=(--dry-run)
  log "Running in dry-run mode"
fi

log "Syncing site into ${TARGET_DIR}"
rsync "${rsync_args[@]}" "$staging_dir/" "$TARGET_DIR/"

if [[ "${DRY_RUN:-0}" != "1" ]]; then
  printf '%s\n' "$release_tag" > "$TARGET_DIR/.release-tag"
fi

log "Deployment complete: ${release_tag} -> ${TARGET_DIR}"
