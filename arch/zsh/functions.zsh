#
# shell functions - sourced by .zshrc
#
#

share_alacritty_terminfo() {
  # usage: share_alacritty_terminfo "user@host" "/some/path"
  scp ~/.config/alacritty/alacritty.info "$1:$2/alacritty.info"
  ssh "$1" "sudo tic -xe alacritty,alacritty-direct $2/alacritty.info"
  rm ./alacritty.info
}

# vim: set syn=sh:
