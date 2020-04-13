{
  description = "Skrips";

  edition = 201909;

  outputs = { self, nixpkgsPkgs, mksh, mkSkrip }:
    let
      inherit (nixpkgsPkgs.kor.stdenv) mkDerivation;
      inherit (nixpkgsPkgs.kor) sd;

    in {
      strok = {
        praimStrok = "niksAlfa";
        kor = {
          praimStrok = "indeks";
          kor = { praimStrok = "datom"; kor = "iuniks"; };
        };
      };

      kor = {
        tri = mkDerivation rec {
          pname = "skrips";
          version = self.shortRev;

          src = self;

          nativeBuildInputs = [ mksh.core.komplit ];

          buildPhase = let
              mksheBang = "#!" + mksh.core.komplit + "/bin/mksh";
            in ''
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
