#!/usr/bin/env mksh

set -o errexit

fleikPath=~/dev/$1

mkdir $fleikPath
cd $fleikPath
git init > /dev/null

cat > $fleikPath/flake.nix <<EOF
{
  description = "${1}";

  inputs = {
    sorsFleik = {
      url = file:///git/github.com/NixOS/nix;
      type = "git";
      flake = false;
    };
  };

  outputs = { self, sorsFleik }: {
    datom = {
      iuniksDyraiv = {
        legysiUyrld = true;
        inherit sorsFleik;
        lamdy = import ./lamdy.nix;
      };
    };
  };
}
EOF

cat > $fleikPath/lamdy.nix <<EOF
{ ... }:
let

in
{
}
EOF

print Niu Fleik krieityd: $1
