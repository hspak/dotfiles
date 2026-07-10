#!/bin/bash
set -euo pipefail

if [[ $# -ne 1 || -z ${1:-} ]]; then
  echo "usage: ${0##*/} <pkgbase>" >&2
  exit 1
fi

pkgbase=$1
repo="ssh://aur@aur.archlinux.org/${pkgbase}.git"

if [[ -e $pkgbase ]]; then
  echo "error: ./${pkgbase} already exists" >&2
  exit 1
fi

git clone "$repo" "$pkgbase"
cd "$pkgbase"
echo "cloned ${pkgbase}; edit PKGBUILD, then: makepkg --printsrcinfo > .SRCINFO"
