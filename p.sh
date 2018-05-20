#!/usr/bin/zsh
dir=$(mktemp -d)
cp pdfs.list $dir
cd $dir
for i in $(cat pdfs.list); do
	wget $i &
done
wait
(for i in *.pdf /tmp/main.pdf; do
	zathura $i &
done
cd -
rm -rf $dir) &
