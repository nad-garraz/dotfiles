#!/bin/bash

dolar=`lynx --source www.dolar.blue \\
| grep -o -E "([0-9]{2,3}\.[0-9]{1,2})" \\
| awk '{i++} i==2 {print "Dolar Blue: " $1 } OR i==5 {print "Dolar Banco Nacion: " $1 }'`
notify-send -t 0 "$dolar"
