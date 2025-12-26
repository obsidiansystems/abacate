{ pkgs ? import ./nixpkgs {} }:

pkgs.mkShell {
  name = "gherkin-shell";
  buildInputs = [
    pkgs.cabal-install
    pkgs.ghcid
  ];
  inputsFrom = [
    (import ./release.nix { inherit pkgs; }).ghc981.env
  ];
}
