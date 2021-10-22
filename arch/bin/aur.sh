#!/bin/bash

pkgbase=$1
git clone "ssh://aur@aur.archlinux.org/${pkgbase}.git"
git remote add aur "ssh://aur@aur.archlinux.org/${pkgbase}.git"
git fetch aur
makepkg
makepkg --printsrcinfo > .SRCINFO
