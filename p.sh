#!/usr/bin/zsh
dir=$(mktemp -d)
cp pdfs.list $dir
cd $dir
for i in $(cat pdfs.list); do
	wget $i &
done
wait
(zathura * /tmp/main.pdf
cd -
rm -rf $dir) &
