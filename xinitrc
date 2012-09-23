xrdb -merge ~/.Xresources

xset +fp /usr/share/fonts/local
xset fp rehash

xmodmap /home/hsp/.Xmodmap

mymonitor
delay_dropbox & 

feh --bg-tile /media/image/arch_wood.png

dunst &

exec ck-launch-session i3
