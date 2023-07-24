#!/bin/bash

# userresources=$HOME/.Xresources
# usermodmap=$HOME/.Xmodmap
# sysresources=/etc/X11/xinit/.Xresources
# sysmodmap=/etc/X11/xinit/.Xmodmap
#
# # merge in defaults and keymaps
#
# if [ -f $sysresources ]; then
# 	xrdb -merge $sysresources
# fi
#
# if [ -f $sysmodmap ]; then
# 	xmodmap $sysmodmap
# fi
#
# if [ -f "$userresources" ]; then
# 	xrdb -merge "$userresources"
# fi
#
# if [ -f "$usermodmap" ]; then
# 	xmodmap "$usermodmap"
# fi
#
#
# if [ -d /etc/X11/xinit/xinitrc.d ] ; then
# 	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
# 		[ -x "$f" ] && . "$f"
# 	done
# 	unset f
# fi



# Demons
[ -f ~/.xprofile ] && . ~/.xprofile

# EXECUTE WINDOW MANAGER WITHOUT
# KILLING ALL OPENED CLIENTS (MODKEY+F2)
[ -f $HOME_SCRIPTS/dwm_start.sh ] && exec $HOME_SCRIPTS/dwm_start.sh 1> $LOGS/dwm_start 2>&1
