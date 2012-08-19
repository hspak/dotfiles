#!/bin/bash

folders=('cower' 'ranger' 'sonata' 'sublime-text-2' 'vlc')

for i in "${folders[@]}"
do
	cd ~/.config
	cp -r $i ~/dotfiles/config/
done
