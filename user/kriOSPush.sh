#!/usr/bin/env mksh
set -o errexit

KriOSDerivation=$(realpath --zero $1)
TargetHost=${2:-"localhost"}
SwitchFlag=${3:-"switch"}

[[ $TargetHost != "localhost" ]] &&
	nix copy --to ssh://root@$TargetHost $KriOSDerivation

sush $TargetHost -- "kriOSActivate $KriOSDerivation $SwitchFlag"
