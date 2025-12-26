{ pkgs ? import ./nixpkgs {} }:
let
  overrides = self: super: {
  };
  targets = ["ghc8107" "ghc98"];

  ghcs = pkgs.lib.genAttrs targets (target: pkgs.haskell.packages.${target}.override {
    inherit overrides;
  });
in pkgs.lib.mapAttrs
    (_: ghc: ghc.callCabal2nix "gherkin" (pkgs.lib.cleanSource ./.) {}) ghcs
