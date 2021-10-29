#!/bin/bash

set -e

cd macos
for dir in *; do
  echo "linking $dir to $HOME/.$dir"
  ln -sf "$PWD/$dir" "$HOME/.$dir"
done

mkdir -p ~/.config/nvim
cat << EOF > ~/.config/nvim/init.vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOF

brew install neovim python3 ripgrep fd ranger
