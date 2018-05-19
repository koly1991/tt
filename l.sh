#!/usr/bin/zsh
if [ ! -z $1 ]; then
	oldhash=$hash
	while true; do 
		hash=$(sha1sum $1)
		while [ $oldhash = $hash ]; do
			sleep 0.5
			hash=$(sha1sum $1)
		done
		dir=$(mktemp -d)
		cp $1 $dir
		cd $dir
		timeout 2 pdflatex $1
		timeout 2 pdflatex $1
		rm /tmp/main.pdf
		cp *.pdf /tmp/main.pdf
		cd -
		rm -rf $dir
		oldhash=$hash
	done
fi
