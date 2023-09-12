#!/bin/bash

#     _       _                 _     
#  __| | ___ | | __ _ ___   ___| |__  
# / _` |/ _ \| |/ _` / __| / __| '_ \ 
#| (_| | (_) | | (_| \__ \_\__ \ | | |
# \__,_|\___/|_|\__,_|___(_)___/_| |_|
#                                     
#                                     

# get currency information of the infame ARS peso
API="https://api.bluelytics.com.ar/v2/latest"
DOLAR=$(curl -sf $API | jq -r)
DOLAR_BLUE_SELL="$(echo "$DOLAR" | jq -r ".blue.value_sell")"
OFICIAL_SELL="$(echo "$DOLAR" | jq -r ".oficial.value_sell")"
EURO_BLUE_SELL="$(echo "$DOLAR" | jq -r ".blue_euro.value_sell")"
OFICIAL_EURO_SELL="$(echo "$DOLAR" | jq -r ".oficial_euro.value_sell")"

notify-send -t 15000 "Guita BLUE:" \
"<b>Dolar Blue: $DOLAR_BLUE_SELL</b>
<i>Dolar oficial: $OFICIAL_SELL</i>
<b>Euro Blue: $EURO_BLUE_SELL</b>
<i>Euro oficial: $OFICIAL_EURO_SELL</i>"
