#
# .zalias: sourced by .bashrc and .zshrc
#
#

# -- Admin tasks
if (( $+commands[gls] )); then
  alias ls='gls -lhv --color --group-directories-first'
else
  alias ls='ls -lhG'
fi
alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'
alias ........='cd ../../../..'
alias grep='grep --color'

# -- Type less
alias g='git'
alias c='cargo'
alias k='kubectl'
alias t='terraform'
alias v='nvim'
alias z='zig'

alias gc='gcloud'
alias tf='terraform'

# vim: set syn=sh :

alias joe='gioctl'

alias kprod='kubectl config use-context gke_poggio-production-experiments_us-central1_primary'
alias kstaging='kubectl config use-context gke_poggio-staging-experiments_us-central1_primary'
