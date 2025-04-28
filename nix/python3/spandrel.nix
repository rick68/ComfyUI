{ nixpkgs ? <nixpkgs>
, pkgs ? import nixpkgs { }
, python3 ? pkgs.python3
, fetchPypi ? pkgs.fetchPypi
, lib ? pkgs.lib
}:

python3.pkgs.buildPythonPackage rec {
  pname = "spandrel";
  version = "0.4.1";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-ZG2YFqlC5Z1WqrLckENTlS5X3uSyyz9Z9+pNwPsRofI=";
  };

  nativeBuildInputs = with python3.pkgs; [
    setuptools
    typing-extensions
    numpy
    einops
    torch
    torchvision
    safetensors
  ];

  pythonImportsCheck = [ pname ];

  meta = with lib; {
    description = "Spandrel gives your project support for various PyTorch architectures meant for AI Super-Resolution, restoration, and inpainting. Based on the model support implemented in chaiNNer.";
    homepage = "https://github.com/chaiNNer-org/spandrel/";
    license = licenses.mit;
    maintainers = with maintainers; [ rick68 ];
  };
}
