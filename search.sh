#!/usr/bin/zsh
if [ ! -z $1 ]; then
	for i in $(grep -rHal "$1"); do 
		echo $i
		cat $i | grep "$1"
		read
		clear
       	done
fi
