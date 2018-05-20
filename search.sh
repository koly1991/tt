#!/usr/bin/zsh
if [ ! -z $1 ]; then
	for i in $(grep -rHal "$1" | shuf); do 
		echo $i
		cat $i | grep --color -B 3 -A 3 "$1"
		read
		if [ $2 = "edit" ]; then
			vim $i
		fi
		clear
       	done
fi
