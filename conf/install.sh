#!/usr/bin/env bash

# maybe it's a makefile?

set -o errexit
set -o pipefail


if ! [[ $USER == root ]]; then
	echo Usage: sudo $0
	exit 255
fi

dir=$(cd $(dirname $0); pwd)

for file in $( find . -name '*.conf' ); do
	path=${file:1}
	ln -sfv $dir$path $path
done
