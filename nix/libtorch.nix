{ nixpkgs ? <nixpkgs>
, pkgs ? import nixpkgs { }
, cudaSupport ? false
}:

let
  libtorch-bin = pkgs.callPackage ./libtorch-bin/bin.nix {
    inherit cudaSupport;
  };

in
pkgs.symlinkJoin {
  name = "libtorch";
  paths = [ libtorch-bin libtorch-bin.dev ];
}
