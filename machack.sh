#!/bin/bash

set -e

root=$(cd "$(dirname "$0")" && pwd)
cd "$root/macos"

for dir in *; do
  if [[ "$dir" == "config" ]]; then
    # Platform-agnostic configs live under arch/config (see shared nvim below).
    continue
  fi
  echo "linking $dir to $HOME/.$dir"
  ln -sf "$PWD/$dir" "$HOME/.$dir"
done

# Single nvim config for both platforms (arch is the source of truth).
mkdir -p "$HOME/.config"
echo "linking nvim to $HOME/.config/nvim"
rm -rf "$HOME/.config/nvim"
ln -sf "$root/arch/config/nvim" "$HOME/.config/nvim"

brew install neovim python3 ripgrep fd ranger
