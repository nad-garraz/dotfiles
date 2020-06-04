#!/usr/bin/env bash

FILE=$HOME_CONFIG/sxhkd/sxhkdrc

[ -f $FILE ] || exit

sed -r 's|\t.*||g' sxhkdrc | grep -i -B3 "#\ [A-Z]"
