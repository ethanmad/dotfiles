#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx
#
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
nm-applet &
redshift &
feh --bg-scale ~/.wallpaper/20120827-184326_1-nature6_high_resolution.jpg
exec i3
