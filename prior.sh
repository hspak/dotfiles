#!/bin/bash

folders=('termite.cfg' 'i3')

cd ~/dotfiles/config
rm -rf *
cd ~/.config

for i in "${folders[@]}"
do
	cp -r $i ~/dotfiles/config
done
