#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx
#
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
nm-applet &
redshift &
feh --bg-scale .wallpaper/20130206-212548_image\ \(20\)_high_resolution.jpg
exec i3
