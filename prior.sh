#!/bin/bash

folders=('termite.cfg' 'i3')

# -- folder operations
cd ~/dotfiles/config
rm -rf *
cd ~/.config

for i in "${folders[@]}"
do
	cp -r $i ~/dotfiles/config
done

# Sublime Text 2 gets special treatment
cp -r sublime-text-2/Packages/User ~/dotfiles/config/Sublime 
