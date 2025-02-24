#!/bin/bash

set -e

cd macos
for dir in *; do
  if [[ "$dir" == "config" ]]; then
    for config in $dir/*; do
      echo "linking $config to $HOME/.$config"
      rm -rf "$HOME/.$config"
      ln -sf "$PWD/$config" "$HOME/.$config"
    done
  else
    echo "linking $dir to $HOME/.$dir"
    ln -sf "$PWD/$dir" "$HOME/.$dir"
  fi
done

brew install neovim python3 ripgrep fd ranger
