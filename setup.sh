#!/bin/bash

files=('bashrc' 'bash_profile' 'vimrc'  'Xresources' 'xinitrc' 'conkyrc' 'zalias' 'zshrc' 'xprofile' 'bin' 'Xmodmap' 'vim' 'dircolors' 'gitconfig' 'tmux.conf' 'ncmpcpp' 'zfunctions' 'zprofile' 'xserverrc')

for i in "${files[@]}"
do
	rm -r ~/.$i
	ln -s ~/dotfiles/$i ~/.$i

	cd ~/.config
	cp -r ~/dotfiles/config/* .
done
