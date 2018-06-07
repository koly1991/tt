#!/usr/bin/zsh
compilelatex(){
	dir=$(mktemp -d)
	cp -vr . $dir
	cd $dir
	timeout 5 pdflatex main.tex
	timeout 5 bibtex main.aux
	timeout 5 pdflatex main.tex
	timeout 5 pdflatex main.tex
	rm /tmp/main.pdf
	cp *.pdf /tmp/main.pdf
	cp /tmp/main.pdf /tmp/tt
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
