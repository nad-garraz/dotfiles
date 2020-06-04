#
#!/usr/bin/env bash
#

 #Inicializo los datos iniciales
#TXB_0=$(cat /sys/class/net/wlp1s0/statistics/tx_bytes)
#RXB_0=$(cat /sys/class/net/wlp1s0/statistics/rx_bytes)

 #Delta tiempo
#delta=1
#sleep $delta

 #Inicializo los datos un "delta tiempo" más tarde.
#TXB_1=$(cat /sys/class/net/wlp1s0/statistics/tx_bytes)
#RXB_1=$(cat /sys/class/net/wlp1s0/statistics/rx_bytes)

 #Calculo la velocidad promedio
#TXB=$( echo "($TXB_1-$TXB_0) /$delta" | bc -l)
#RXB=$( echo "($RXB_1-$RXB_0)/$delta" | bc -l)

 #Paso a kilobytes
#upkb="$( echo $TXB/1024 | bc -l)"
#downkb="$( echo $RXB/1024 | bc -l)"

 #Paso a Megabytes
#upMb="$( echo $upkb/1024 | bc -l)"
#downMb="$( echo $downkb/1024 | bc -l)"


#if [[ "$upkb" < 1024 ]];
#then
	#UP="↑$(printf "%.1f" "$upkb")k"
#else
	#UP="↑$(printf "%.2f" "$upMb")M"
#fi

#if [[ "$downkb" < 1024 ]];
#then
	#DOWN="↓$(printf "%.1f" "$downkb")k"
#else
	#DOWN="↓$(printf "%.2f" "$downMb")M"
#fi

if ip r | grep default > /dev/null
	then
		IP="inet"
	else
		IP="no inet"
fi
