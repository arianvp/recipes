let pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation {
    name = "recipes-1";
    src = pkgs.lib.cleanSource ./.;
    buildInputs = [ pkgs.gnu-cobol ];
  }
