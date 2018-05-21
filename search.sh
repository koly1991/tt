#!/usr/bin/zsh
if [ ! -z $1 ]; then
	for i in $(grep -rHal "$1" | shuf | grep -v swp | grep -v git | grep -v swo); do 
		echo $i
		cat $i | grep --color -B 3 -A 3 "$1"
		read -sk key
		if [ $key = "e" ]; then
			vim $i
		elif [ $key = "j" ]; then
			break
		fi
       	done
fi
