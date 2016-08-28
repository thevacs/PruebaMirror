#! /bin/bash
# -*- ENCODING: UTF-8 -*-
date
avr=100.000
cat lista-mirror.txt | while read host
do
	ms=$(ping -c 4 $host | tail -1| awk '{print $4}' | cut -d '/' -f 2)
	if [ -z $ms ]; then
		echo -e "$host >>\033[31m Desconectado\033[0m."
	else
		echo -e "$host >>\033[32m $ms\033[0m ms."
	fi	
done
exit