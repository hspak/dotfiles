#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[ -n "$TMUX" ] && export TERM=screen-256color

# -- CP'd from somewhere, must be useful
shopt -s cdspell dirspell extglob globstar histverify no_empty_cmd_completion checkwinsize
set show-all-if-ambiguous on
bind show-all-if-ambiguous on
set show-all-if-unmodified on
ulimit -S -c 0

# -- External config
. ~/.zalias
#. ~/.bash_functions

# -- Shell prompt
#PS1='[\u@\h \W]\$ '
#PS1='\e[1;37m┌ \e[1;94m\u\e[0;37m@\e[1;94m\h\e[1;37m \e[1;37m[\w]\n\e[1;37m└╼ \$\e[0m '
PS1='\e[1;37m┌ \e[1;94m\u\e[0;37m@\e[1;94m\h\e[1;37m \e[1;37m[\w]\n\[\e[1;37m\]└╼ \$\[\e[0m\] '
PS1="\[\\e[G\]$PS1"
#─  
# -- Set vi bindings
set -o vi

# -- Make java prettier
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'
export JAVA_FONTS=/usr/share/fonts/TTF
