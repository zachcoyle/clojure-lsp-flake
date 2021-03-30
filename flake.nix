{
  description = "A very basic flake";

  inputs = {
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
      clojure-lsp = pkgs.callPackage ./default.nix { };
    in
    {
      packages.clojure-lsp = clojure-lsp;
      defaultPackage = clojure-lsp;
      overlay = (final: prev: { inherit clojure-lsp; });
    });
}
