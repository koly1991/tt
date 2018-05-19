#!/bin/bash
if [ ! -z $1 ] && [ ! -z $2 ] && [ ! -z $3 ] ; then
	dir=$(mktemp -d)
	HOME=$dir
	git config user.email $1
	git config user.name $2
	gpg --import $3
	gpg --edit $2
	git-crypt unlock
	if ! chromium $(cat pdfs.list) /tmp/main.pdf &> /dev/null ; then
		chromium-browser $(cat pdfs.list) /tmp/main.pdf &> /dev/null
	fi &
	screen 
	rm -rf $dir
fi
