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
		echo "No argument provided!!"
		sleep 2
	else
	n=$(cat $1 | wc -l)
	echo "+----------------------+"
	echo -e "|  $n urls to be check  |"
	echo "+----------------------+"
	i=1
	for urls in $(cat $1)
	do
		check=$(curl -s $urls)
		if [ "$?" -eq "0" ]
		then
			code=$(curl -Is "$urls" | head -1 | cut -d' ' -f 2 &)
			echo "$i) $urls ---> $code"
		else
			echo -n "$i) $urls ---> "
			ping $urls
		fi
		i=$(( $i + 1 ))
	done
fi
