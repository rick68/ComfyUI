{ nixpkgs ? <nixpkgs>
, pkgs ? import nixpkgs { }
, python3 ? pkgs.python3
, fetchPypi ? pkgs.fetchPypi
, lib ? pkgs.lib
}:

python3.pkgs.buildPythonPackage rec {
  pname = "comfyui_frontend_package";
  version = "1.18.2";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-amvVlqKR4vxPAQ1FGVEeZeqfqzA7LUYf0uu5AI7Xq6g=";
  };

  pythonImportsCheck = [ pname ];

  meta = with lib; {
    description = "Official front-end implementation of ComfyUI.";
    homepage = "https://github.com/Comfy-Org/ComfyUI_frontend/";
    license = licenses.gpl3;
    maintainers = with maintainers; [ rick68 ];
  };
}
