#!/usr/bin/env mksh

set -o errexit

KriOSDerivation=$(realpath --zero $1)
echo "KriOSDerivation: $KriOSDerivation"

nix copy root@$targetHost $KriOSDerivation

sush $targetHost -- "kriOSActivate $(cat ~/.kriOSPushDerivation)"

