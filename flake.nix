{
  description = "Skrips";

  edition = 201909;

  outputs = { self, nixpkgsPkgs, mksh }:
    let
      inherit (nixpkgsPkgs.kor.stdenv) mkDerivation;
      inherit (nixpkgsPkgs.kor) sd dash;

    in {
      kor.komplit = mkDerivation rec {
        pname = "skrips";
        version = self.shortRev;

        src = self;

        nativeBuildInputs = [ mksh.core.komplit ];

        buildPhase = let
          mksheBang = "#!" + mksh.core.komplit + "/bin/mksh";
          dasheBang = "#!" + dash + "/bin/dash";

          in ''
            "${sd}/bin/sd" --string-mode '#!/usr/bin/env mksh' '${mksheBang}' src/*
            "${sd}/bin/sd" --string-mode '#!/usr/bin/env dash' '${dasheBang}' src/*
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

      core.komplit = self.kor.komplit;

  };
}
