#!/usr/bin/env mksh

set -o errexit

fleikPath=~/dev/$1

mkdir $fleikPath
cd $fleikPath
git init > /dev/null

cat > $fleikPath/flake.nix <<EOF
{
  description = "${1}";

  outputs = { self }: {
    strok = {
      praim = { djenereicyn = 0; datomIzKriom = true; };
      taip = "";
      rysiv = "";
      rytyrn = "";
    };

    datom = {};

  };
}
EOF

print Niu Fleik krieityd: $1
