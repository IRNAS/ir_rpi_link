#!/bin/bash

ARRAY=( 'KEY_1' 'KEY_2' 'KEY_3' 'KEY_4' 'KEY_5' )

ELEMENTS=${#ARRAY[@]}

while true; do
	for (( i=0;i<$ELEMENTS;i++)); do
		echo send: ${ARRAY[${i}]}
		irsend SEND_ONCE SONY-TV ${ARRAY[${i}]}
		sleep 1
	done
done
