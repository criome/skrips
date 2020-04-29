#!/usr/bin/env mksh

set -o errexit

targetHost="$1"
shift
remainingArgs="$@"
zshEksek=~/.nix-profile/bin/zsh

ssh -t -i ~/.ssh/root root@$targetHost -- "export SHELL=$zshEksek && exec $zshEksek -c $remainingArgs"
