. ~/.zalias

# Turn autocomplete on
autoload -U compinit
autoload -U colors && colors
compinit

# Enable alias autocomplete
setopt completealiases

# Enable vi mode
bindkey -v

PROMPT="%B┌ %{$fg[blue]%}%n%b%{$reset_color%}@%B%{$fg[blue]%}%m%b %{$reset_color%}%B[%~]
└╼ $%b %{$reset_color%}"
