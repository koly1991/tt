#!/usr/bin/zsh
dir=$(mktemp -d)
for i in $(cat pdfs.list); do
	wget $i &
done
wait
zathura * /tmp/main.pdf &> /dev/null &
