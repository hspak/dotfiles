source ~/.zalias

# Turn autocomplete on
autoload -U compinit
autoload -U colors && colors
compinit

HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

setopt CORRECT					# Spelling
setopt COMPLETE_IN_WORD			# No cursor movement on complete?

setopt NO_FLOW_CONTROL			# No ^s
setopt NO_BEEP					# No beep!

# Globbing
setopt NO_CASE_GLOB				# Case insensitivity
setopt NUMERIC_GLOB_SORT		# Sort numerically if numbers
setopt EXTENDED_GLOB			# Adds # ~ ^ to glob
setopt GLOB_COMPLETE

setopt APPEND_HISTORY			# Same history for all sessions
setopt HIST_IGNORE_ALL_DUPS		# No dupes in history
setopt HIST_REDUCE_BLANKS

# Enable alias autocomplete
setopt completealiases

# Enable vi mode
bindkey -v

PROMPT="%B┌ %{$fg[blue]%}%n%b%{$reset_color%}@%B%{$fg[blue]%}%m%b %{$reset_color%}%B[%~]
└╼ $%b %{$reset_color%}"

# Enable setting terminal titles
case $TERM in
    xterm*|rxvt*|screen*|gnome*)
         precmd() { print -Pn "\e]0;%m:%~\a" }
         preexec () { print -Pn "\e]0;$1\a" }
        ;;
esac

# Environmental
export TERM=gnome-256color
export EDITOR=vim
