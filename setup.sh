#!/bin/bash

files=('bashrc' 'bash_profile' 'vimrc'  'Xresources' 'xinitrc' 'conkyrc' 'zalias' 'inputrc' 'zshrc' 'xprofile' 'bin' 'Xmodmap' 'vim' 'dircolors' 'gitconfig')

for i in "${files[@]}"
do
	rm -r ~/.$i
	ln -s ~/dotfiles/$i ~/.$i

	cd ~/.config
	cp -r ~/dotfiles/config/* .
done
