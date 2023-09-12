#!/bin/bash

dolar=$(curl -sf "https://api.bluelytics.com.ar/v2/latest" | jq -r)
dolar_blue_sell="$(echo "$dolar" | jq -r ".blue.value_sell")"
oficial_sell="$(echo "$dolar" | jq -r ".oficial.value_sell")"
euro_blue_sell="$(echo "$dolar" | jq -r ".blue_euro.value_sell")"
oficial_euro_sell="$(echo "$dolar" | jq -r ".blue_euro.value_sell")"

notify-send -t 15000 "Guita" "<b>Dolar Blue: $dolar_blue_sell</b>
Dolar oficial: $oficial_sell
<b>Euro Blue: $euro_blue_sell</b>
Euro oficial: $oficial_euro_sell"
