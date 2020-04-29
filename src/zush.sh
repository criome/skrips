#!/usr/bin/env mksh

set -o errexit

targetHost="$1"
shift
targetIuzyr="${1:-root}"
shift
remainingArgs="$@"
zshEksek=~/.nix-profile/bin/zsh

ssh -t -i ~/.ssh/root root@$targetHost -- "su -c $targetIuzyr export SHELL=$zshEksek && exec $zshEksek -c $remainingArgs"
