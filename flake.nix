{
  description = "Skrips";

  edition = 201909;

  outputs = { self, gluNixPkgs, mksh }:
    let
      inherit (gluNixPkgs.core.mkClumsyPkgs {}) stdenv sd;

      pname = "skrips";
      version = self.shortRev;

    in {
      core.komplit = stdenv.mkDerivation rec {
        inherit pname version;

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
            mv ''$fail $out/bin/''${neim%.mksh}
          done
        '';
      };

  };
}
