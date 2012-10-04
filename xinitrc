# Set terminal options
xrdb -merge ~/.Xresources

# Add extra font pths
xset +fp /usr/share/fonts/local
xset fp rehash

# Custom keyboard layout
xmodmap /home/hsp/.Xmodmap

# Fix dual monitor settings
mymonitor

# Wait 15 seconds for connection
delay_dropbox & 

# Ibus for Korean input
ibus-daemon -x -d & 

# Disable touchpad when typing
syndaemon -K -d &

# Notification daemon
dunst &

# Urxvt daemon
urxvtd -q -o -f

# Run window manager
exec i3
