#!/usr/bin/env bash

# maybe it's a makefile?

set -o errexit
set -o pipefail


if ! [[ $USER == root ]]; then
	echo Usage: sudo $0
	exit 255
fi

cd $(dirname $0);
dir=$(pwd)

for path in $( find */ -type f ); do
	ln -sfv $dir/$path /$path
done

mkdir -p /var/log/nginx
