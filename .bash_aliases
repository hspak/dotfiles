#
# .bash_aliases: sourced by .bashrc
#

# -- Admin tasks
alias ls='ls -lh --color=auto'
alias df='df -h'
alias du='du -h'
alias su='su -'
alias ..='cd ..'
alias ....='cd ../..'
alias grep='grep --color'
alias sdown='sudo rmmod e1000e && sudo rmmod ehci_hcd && sudo systemctl poweroff'
alias reboot='sudo rmmod e1000e && sudo rmmod ehci_hcd && sudo systemctl reboot'

# -- 1 line Commands
alias extern_ip='curl -# checkmyip.com ' #| grep Your | cut -c 76-89'
alias sprunge='curl -F "sprunge=<-" http://sprunge.us'
alias scrompbox='scrot -s '"'"'%Y%m%d.png'"'"' -e '"'"'ompload $f && mv $f ~/bridge/image/screeny/'"'"''
alias scromp='scrot '"'"'%Y%m%d.png'"'"' -e '"'"'ompload $f && mv $f ~/bridge/image/screeny/'"'"''
alias aurvote='aurvote --configure && aurvote -v $(pacman -Qqm) && rm /home/hsp/.config/aurvote'
alias lap_mon_on='xrandr --output LVDS1 --mode 1600x900 --pos 1920x0 --output HDMI1 --primary'
alias google-chrome='google-chrome --disk-cache-dir=/tmp'

alias mpd_start='sudo systemctl start mpd.service'

# -- Type less
alias v='vim'
alias ncm='ncmpcpp'
alias snet='sudo netcfg'
alias xresources='xrdb -merge ~/.Xresources'
alias dwmconf='vim ~/.abs/dwm/config.h'
alias mkdwm='cd ~/.abs/dwm && makepkg -efi'
alias umhome='sudo umount //offcampus.ics.purdue.edu/hpak' 
alias sage='sudo ssh sage.ics.purdue.edu -lhpak'
alias startx='nohup startx > .xlog & vlock'
alias xmap='xmodmap ~/.Xmodmap' 
alias dtella='sudo systemctl stop iptables.service && python2 ~/dtella/dtella.py'
alias pa='pacaur'

alias school='cd ~/bridge/school/'

# -- Pacman
alias p='pacman-color'
alias sp='sudo pacman-color' 
alias pacman='pacman-color'
alias pii='pacman-color -Qii'
alias psyu='pacaur -Syu'
alias prsn='sudo pacman-color -Rsn'
alias pas='sudo pacman-color -S'
alias pss='sudo pacman-color -Ss'
alias pqs='pacman-color -Qs'
alias pu='sudo pacman-color -U'
alias pqe='pacman-color -Qe'
alias pcnt='pacman -Q | wc -l'

# -- Github shortcuts
alias giti='git init'
alias gitall='git add .'
alias gitc='git commit -m'
alias gitpom='git push -u origin master'

# -- Systemd
alias ssctl='sudo systemctl'

# -- Not used (maybe later)
# alias dropbox-sync='sudo rsync -Par /home/hsp/shared/school /home/hsp/Dropbox'
# alias sv='sudo vim'

# vim: set syn=sh :
