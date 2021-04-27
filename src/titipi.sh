#!/usr/bin/env mksh

set -o errexit

path="$1"

wget --recursive \
     --page-requisites --adjust-extension --span-hosts \
     --convert-links  \
     --no-parent $path
