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
      praim = { djenyreicyn = 4; spici = "datom"; sobSpici = "iuniks"; };
      spici = "eksykiutybyl";
      sobSpiciz = [ "elf" ];
    };

    datom = {};

  };
}
EOF

print Niu Fleik krieityd: $1
