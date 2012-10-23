# Set terminal options
xrdb -merge ~/.Xresources

# Add extra font pths
xset +fp /usr/share/fonts/local
xset fp rehash


# Fix dual monitor settings
mymonitor &

# Wait 15 seconds for connection
delay_dropbox & 

# Ibus for Korean input
ibus-daemon -x -d

# Disable touchpad when typing
syndaemon -K -d -i 1

xbindkeys

# Music
mpd

# Custom keyboard layout
delay_xmodmap &

# Mail notify every 5 minutes
mailcheck &

# Run window manager
exec i3
