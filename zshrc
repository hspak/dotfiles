source ~/.zalias

# Turn autocomplete on
autoload -U compinit
autoload -U colors && colors
compinit

HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

setopt NO_LIST_BEEP
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt MENU_COMPLETE

# No ^s
setopt NO_FLOW_CONTROL
setopt NO_BEEP

# Globbing
setopt NO_CASE_GLOB
setopt NUMERIC_GLOB_SORT
setopt EXTENDED_GLOB

setopt APPEND_HISTORY # adds history
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# Enable alias autocomplete
setopt completealiases

# Enable vi mode
bindkey -v

PROMPT="%B┌ %{$fg[blue]%}%n%b%{$reset_color%}@%B%{$fg[blue]%}%m%b %{$reset_color%}%B[%~]
└╼ $%b %{$reset_color%}"

case $TERM in
    xterm*|rxvt*|screen*|gnome*)
         precmd() { print -Pn "\e]0;%m:%~\a" }
         preexec () { print -Pn "\e]0;$1\a" }
        ;;
esac

# Not sure if proper place, but it works for now
export TERM=gnome-256color
export EDITOR=vim
