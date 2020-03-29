#!/usr/bin/env ash

set -o errexit

mkdir -p $out

$curl $url --output $out
