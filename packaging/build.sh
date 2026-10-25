#!/usr/bin/env bash

# Build the .deb, .rpm and Arch packages into dist/ with nfpm.
# Uses a local nfpm if installed, otherwise the official Docker image.

set -Eeuo pipefail

NFPM_VERSION="v2.41.1"

cd "$(dirname "$0")/.."

VERSION="$(sed -n 's/^VERSION="\(.*\)"$/\1/p' bspwmctl)"
[[ -n "$VERSION" ]] || { echo "Could not read VERSION from ./bspwmctl" >&2; exit 1; }
export VERSION

STAGE="dist/.stage"

# Run nfpm from the staging directory (paths in nfpm.yaml are relative to it)
nfpm() {
  if type -P nfpm > /dev/null; then
    (cd "$STAGE" && command nfpm "$@")
  else
    docker run --rm -u "$(id -u):$(id -g)" -e VERSION -v "$PWD:/src" -w "/src/$STAGE" \
      "goreleaser/nfpm:$NFPM_VERSION" "$@"
  fi
}

rm -rf dist
mkdir -p "$STAGE"

# Stage the files with normalized permissions, independent of the local umask
cp -r bspwmctl config CHANGELOG.md LICENSE packaging/nfpm.yaml "$STAGE/"
chmod -R u=rwX,go=rX "$STAGE"

for packager in deb rpm archlinux; do
  nfpm package --config nfpm.yaml --packager "$packager" --target ..
done

rm -rf "$STAGE"

echo
echo "Packages for bspwmctl $VERSION:"
ls -1 dist/
