#!/usr/bin/env bash

set -o errexit
set -o pipefail

# this is used to pull conf files from bakunin dev host into local copy

if ! [[ $(uname) == Darwin ]]; then
	echo "You're on $(uname). Sure?"
	exit 255
fi

if [[ -z $1 || -z $BAKUNIN_DEV_HOST ]]; then
	echo "Usage: BAKUNIN_DEV_HOST=hostname $0 /path/to/file.conf"
	exit 1
fi

cd $(dirname $0);

rsync -avR $BAKUNIN_DEV_HOST:$1 .

stashed=false
if ! [[ -z $(git diff --cached) ]]; then
	stashed=true
	git stash
fi

fname=${1:1}
git add $fname
git commit -m "[conf/$(basename $0)] Add $fname"

if $stashed; then
	git stash pop
fi