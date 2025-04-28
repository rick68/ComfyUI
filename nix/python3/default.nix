{ nixpkgs ? <nixpkgs>
, pkgs ? import nixpkgs { }
, callPackage ? pkgs.callPackage
, python3 ? pkgs.python3
}:

python3.override {
  packageOverrides = self: super: {
    comfyui_frontend_package = callPackage ./comfyui_frontend_package.nix { inherit python3; };
    comfyui_workflow_templates = callPackage ./comfyui_workflow_templates.nix { inherit python3; };
    spandrel = callPackage ./spandrel.nix { inherit python3; };
  };
}
