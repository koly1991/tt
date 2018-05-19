#!/usr/bin/zsh
if [ ! -z $1 ] && [ ! -z $2 ]; then
	while [ ! -e /tmp/.stopautocommit ]; do
		if ! git status | grep "nothing to commit, working tree clean" &> /dev/null ; then
			git status
			git add .
			git commit -m "autocommit of $(date)"
			git push https://$1:$2@github.com/$1/$3
			git status
			date
		fi
		sleep 0.5
	done
else
	echo first argument is username, second one is password, third is repo name
	echo recall that /tmp/.stopautocommit stops everything
fi
