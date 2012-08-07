#!/bin/bash
#
# bash_profile
#

export PAGER=less
export LC_COLLATE=C
export EDITOR=vim
export VISUAL=vim

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

export HISTCONTROL=ingnoreboth
export WINEDEBUG=-all
export LIBGL_DRIVERS_PATH=/usr/lib32/xorg/modules/dri

# if interactive, source .bashrc
# [[ $- = *i* && -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# autostart X
# if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
  # startx > .xlog
# fi
