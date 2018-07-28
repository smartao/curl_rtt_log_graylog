#!/bin/bash

# Vezes que sera executado no periodo
v=11 
sl=5

for ((i=1; i<=11; i++))
do
	L="BV2and" # local
	DEST="/var/log/curl.log"
	TIPO="LAN"

	S="http://infra.brq.com" # site url
	T=`curl -s -w %{time_total}\\n -o /dev/null $S` # teste
	D=$(date +%s) # Timestamp data

	#echo "$D -  $T - $S - $L"
	echo "$D;$T;$S;$L;$TIPO" >> $DEST

	S="http://10.2.1.199/cacti/" # site url
	T=`curl -s -w %{time_total}\\n -o /dev/null $S` # teste
	D=$(date +%s) # Timestamp data

	#echo "$D -  $T - $S - $L"
	echo "$D;$T;$S;$L;$TIPO" >> $DEST

	sleep $sl;
done

exit;
