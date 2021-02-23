{
  description = "Skrips";

  outputs = { self }: {
    SobUyrld = {
      modz = [ "pkgs" "pkdjz" ];

      lamdy = { stdenv, mksh, sd }:

        stdenv.mkDerivation {
          pname = "skrips";
          version = self.shortRev;
          src = self;

          buildPhase =
            let
              mksheBang = "#!" + mksh + "/bin/mksh";
            in
            ''
              "${sd}/bin/sd" --string-mode '#!/usr/bin/env mksh' '${mksheBang}' src/*
              chmod 755 src/*
            '';

          installPhase = ''
            mkdir --parents $out/bin/
            for fail in src/*
            do
            export neim=$(basename $fail)
            mv ''$fail $out/bin/''${neim%.sh}
            done
          '';
        };

    };
  };
}
