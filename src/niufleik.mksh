#!/usr/bin/env mksh

set -o errexit

fleikPath=~/dev/$1

mkdir $fleikPath
cd $fleikPath
git init > /dev/null

cat > $fleikPath/flake.nix <<EOF
{
  description = "${1}";

  edition = 201909;

  outputs = { self, korLib }: {

    strok = {};

    kor = {};

  };
}
EOF

print Niu Fleik krieityd: $1
