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
 
        status() 
        { 
                i=1 
                for urls in $(cat "$1") 
                do  
                        response=$(curl -ISs "$urls" 2>&1) 
                        if [ "$?" -eq "0" ] 
                        then 
                                code=$(echo "$response" | head -1 | cut -d' ' -f 2) 
                                echo -e "\033[1;33m$i) $urls ---> $code\n" 
                        else 
                                echo -ne "$i) $response\n" 
                        fi  
                        i=$(( $i + 1 )) 
                done 
                rm url001.txt 
        }   
 
        clear 
        n=$(cat "$1" | wc -l) 
        echo -e "\033[1;31m+-----------------------+" 
        echo -e "\033[1;31m|  $n URLs to be check  |" 
        echo -e "\033[1;31m+-----------------------+" 
 
        if [ -z "$2" ] 
        then 
                status "$1" 
        elif [ "$2" = "--add-https" ] 
        then 
                for url in $(cat "$1") 
                do 
                        (echo "$url" | sed 's/^/https:\/\//g') >> url001.txt 
                done 
                sort -u url001.txt -o url001.txt 
                status "url001.txt" 
        fi
