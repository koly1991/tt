#!/usr/bin/zsh
for i in *.tex; do
	time aspell -t -c $i
	echo $i
	read
done
