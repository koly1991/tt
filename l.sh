#!/usr/bin/zsh
compilelatex(){
	dir=$(mktemp -d)
	cp -vr . $dir
	cd $dir
	timeout 2 pdflatex main.tex
	timeout 2 bibtex main.aux
	timeout 2 pdflatex main.tex
	timeout 2 pdflatex main.tex
	rm /tmp/main.pdf
	cp *.pdf /tmp/main.pdf
	cd -
	rm -rf $dir
}
compilelatex
hash=$(sha1sum $(find | grep tex | grep -v swp | grep -v swo) | sha1sum)
oldhash=$hash
while true; do 
	while [ $oldhash = $hash ]; do
		sleep 0.1
		hash=$(sha1sum $(find | grep tex | grep -v swp | grep -v swo) | sha1sum)
	done
	compilelatex
	oldhash=$hash
done
