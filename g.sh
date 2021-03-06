#!/usr/bin/zsh
if [ ! -z $1 ] && [ ! -z $2 ] && [ ! -z $3 ]; then
	while [ ! -e /tmp/.stopautocommit ]; do
		if ! git status | grep "nothing to commit, working tree clean" &> /dev/null ; then
			git status
			git add .
			git status
			git commit -m "autocommit of $(date)"
			git status
			git push https://$1:$2@github.com/$1/$3
			git status
			date
		fi
		#sleep 300
		sleep 1
	done
else
	echo first argument is username, second one is password, third is repo name
	echo recall that /tmp/.stopautocommit stops everything
fi
