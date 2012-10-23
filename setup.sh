#!/bin/bash


files=('bashrc' 'bash_profile' \
		'zalias' 'zshrc' 'zfunctions' 'zprofile' \
		'vimrc' 'vim' \
		'Xresources' 'Xmodmap' 'xinitrc' 'xprofile' 'xserverrc' 'dircolors' 'xbindkeysrc' \
		'bin' 'gitconfig' 'tmux.conf' 'ncmpcpp' 'notify-osd' 'mutt' 'gtkrc-2.0')
 
# -- files operations
for i in "${files[@]}"
do
	rm -rf ~/.$i
	echo "Cleaning $i"
	ln -sf ~/dotfiles/$i ~/.$i
	echo "Creating symlink for $i"
done

cd ~/.config
cp -r ~/dotfiles/config/* .
echo "Adding configs in ~/.configs"

rm -r sublime-text-2/Packages/User
mv Sublime sublime-text-2/Packages/User
echo "Replacing sublime user config"
