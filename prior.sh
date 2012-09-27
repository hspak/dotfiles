#!/bin/bash

folders=('cower' 'ranger' 'sonata' 'sublime-text-2' 'vlc' 'i3' 'lilyterm' 'dunst')

for i in "${folders[@]}"
do
	cd ~/.config
	cp -r $i ~/dotfiles/config/
done
