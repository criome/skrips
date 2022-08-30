#!/usr/bin/env mksh
set -o errexit

KriOSDerivation=$(realpath --zero $1)
echo "KriOSDerivation: $KriOSDerivation"
TargetHost=${2:-"localhost"}
echo "TargetHost: $TargetHost"

[[ $TargetHost != "localhost" ]] &&
	nix copy root@$TargetHost $KriOSDerivation

sush $TargetHost -- "kriOSActivate $(cat ~/.kriOSPushDerivation)"
