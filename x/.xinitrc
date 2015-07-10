#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx
#

numlockx &
pnmixer &
exec i3
