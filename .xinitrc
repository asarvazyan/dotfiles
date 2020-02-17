autocutsel -fork &
autocutsel -selection PRIMARY -fork &

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
feh --bg-max ~/.wallpaper/wallhaven-836612.jpg &
picom -c &
xbindkey
exec i3
