#!/bin/sh

DIR=$DWMBAR

export IDENTIFIER="0"

export SEP1="-["
export SEP2="]"

# Import the modules
. "$DIR/dwm_alarm"
. "$DIR/dwm_mpc"
. "$DIR/dwm_resources"
. "$DIR/dwm_battery"
. "$DIR/dwm_alsa"
. "$DIR/dwm_weather"
. "$DIR/dwm_keyboard"
. "$DIR/dwm_date"
. "$DIR/dwm_btc"


# Update dwm status bar every $LOOP_TIME
while true
do
	xsetroot -name "$(dwm_mpc)$(cripto)$(dwm_resources)$(dwm_battery)$(dwm_alsa)$(dwm_weather)$(dwm_keyboard)$(dwm_date)"
    sleep $LOOP_TIME
done
