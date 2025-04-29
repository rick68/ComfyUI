{ nixpkgs ? <nixpkgs>
, pkgs ? import nixpkgs { }
, python3 ? pkgs.python3
, fetchPypi ? pkgs.fetchPypi
, lib ? pkgs.lib
}:

python3.pkgs.buildPythonPackage rec {
  pname = "comfyui_frontend_package";
  version = "1.17.11";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-v2Yfl730hvGEV+kFXva3lAJFDecVplvl+L5XY3PJdNU=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace "0.1.0" "${version}"
  '';

  pythonImportsCheck = [ pname ];

  meta = with lib; {
    description = "Official front-end implementation of ComfyUI.";
    homepage = "https://github.com/Comfy-Org/ComfyUI_frontend/";
    license = licenses.gpl3;
    maintainers = with maintainers; [ rick68 ];
  };
}
