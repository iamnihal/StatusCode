#!/bin/bash

logo()
{
	cat <<"EOT"
		  ____ _        _                ____          _      
		/ ___|| |_ __ _| |_ _   _ ___   / ___|___   __| | ___ 
		\___ \| __/ _` | __| | | / __| | |   / _ \ / _` |/ _ \
		 ___) | || (_| | |_| |_| \__ \ | |__| (_) | (_| |  __/
		|____/ \__\__,_|\__|\__,_|___/  \____\___/ \__,_|\___|


EOT
}

clear
logo
if [ -z "$1" ]
then
	echo -e "\033[1;31mNo argument provided!!"
	sleep 2
else
	n=$(cat $1 | wc -l)
	echo -e "\033[1;31m+-----------------------+"
	echo -e "\033[1;31m|  $n URLs to be check  |"
	echo -e "\033[1;31m+-----------------------+"
	i=1
	for urls in $(cat $1)
	do
		response=$(curl -Is "$urls")
		if [ "$?" -eq "0" ]
		then
			code=$(echo "$response" | head -1 | cut -d' ' -f 2)
			echo -e "\033[1;33m$i) $urls ---> $code"
		else
			echo -n "$i) $urls ---> "
			ping $urls
		fi
		i=$(( $i + 1 ))
	done
fi
