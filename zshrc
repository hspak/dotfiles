source ~/.zalias

# Turn autocomplete on
autoload -U compinit
autoload -U colors && colors
compinit

HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_LIST_BEEP
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
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
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# Enable alias autocomplete
setopt completealiases
setopt complete_aliases

# Enable vi mode
bindkey -v

PROMPT="%B┌ %{$fg[blue]%}%n%b%{$reset_color%}@%B%{$fg[blue]%}%m%b %{$reset_color%}%B[%~]
└╼ $%b %{$reset_color%}"

# Not sure if proper place, but it works for now
export TERM=rxvt
export EDITOR=vim
