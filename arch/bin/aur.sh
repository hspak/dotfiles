#!/bin/bash

set -e

pkgbase=$1
git clone "ssh://aur@aur.archlinux.org/${pkgbase}.git"
git remote add aur "ssh://aur@aur.archlinux.org/${pkgbase}.git"
cd "${pkgbase}"
git fetch aur
makepkg
makepkg --printsrcinfo > .SRCINFO
