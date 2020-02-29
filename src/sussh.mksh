#!/usr/bin/env mksh

set -o errexit

targetHost="$1"
shift
remainingArgs="$@"

ssh -i ~/.ssh/root root@$targetHost $remainingArgs
