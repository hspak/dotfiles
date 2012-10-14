#!/bin/bash

files=('bashrc' 'bash_profile' 'vimrc'  'Xresources' 'xinitrc' 'conkyrc' 'zalias' 'zshrc' 'xprofile' 'bin' 'Xmodmap' 'vim' 'dircolors' 'gitconfig' 'tmux.conf' 'ncmpcpp' 'zfunctions' 'zprofile' 'xserverrc' 'notify-osd' 'mutt' 'gtkrc-2.0')

for i in "${files[@]}"
do
	rm -rf ~/.$i
	ln -s ~/dotfiles/$i ~/.$i
done

cd ~/.config
cp -r ~/dotfiles/config/* .
