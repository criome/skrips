{
  description = "Skrips";

  edition = 201909;

  outputs = { self }:
    let
      pname = "skrips";
      version = self.shortRev;

    in {
      core.ol = { stdenv, sd, mksh }@args:
        stdenv.mkDerivation rec {
          inherit pname version;

          src = self;

          nativeBuildInputs = [ mksh.ol ];

          buildPhase = let
            sd = args.sd + "/bin/sd";
            mksheBang = "#!" + mksh.ol + "/bin/mksh";

            in ''
              ${sd} --string-mode '#!/bin/mksh' '${mksheBang}' src/*
              chmod 755 src/*
            '';

          installPhase = ''
            mkdir --parents $out/bin/
            for fail in src/*
            do
              neim = basename $fail
              mv ''$fail $out/bin/''${neim%.mksh}
            done
          '';

        };
  };
}
