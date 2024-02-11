#!/bin/bash

# Daemons
[ -f ~/.xprofile ] && . "$HOME"/.xprofile

# EXECUTE WINDOW MANAGER WITHOUT KILLING ALL OPENED CLIENTS (MODKEY+F2)
[ -f "$HOME_SCRIPTS"/dwm_start.sh ] && exec "$HOME_SCRIPTS"/dwm_start.sh 1>"$LOGS"/dwm_start 2>&1
