{ nixpkgs ? <nixpkgs>
, pkgs ? import nixpkgs {
    system = builtins.currentSystem;
    config = {
      allowUnfree = true;
      cudaSupport = stdenv.hostPlatform.isLinux;
    };
    overlays = [ ];
  }
, stdenv ? pkgs.stdenv
, libtorch ? pkgs.callPackage ./nix/libtorch.nix {
    cudaSupport =  pkgs.config.cudaSupport;
  }
, python3 ? import ./nix/python3 { inherit pkgs; }
, lib ? pkgs.lib
}:

let
  pythonEnv = python3.withPackages (ps: with ps; [
    comfyui_frontend_package
    comfyui_workflow_templates
    torch
    torchsde
    torchvision
    torchaudio
    numpy
    einops
    transformers
    tokenizers
    sentencepiece
    safetensors
    aiohttp
    yarl
    pyyaml
    pillow
    scipy
    tqdm
    psutil

    spandrel
    kornia
    av
    pydantic
]);

in pkgs.mkShell {
  nativeBuildInputs = with pkgs; [ pkg-config pythonEnv ];

  LIBTORCH = libtorch;
  LD_LIBRARY_PATH = lib.optionals stdenv.hostPlatform.isLinux
    (lib.makeLibraryPath (with pkgs; [ cudatoolkit.out zlib ]));

  shellHook = ''
  '';
}

