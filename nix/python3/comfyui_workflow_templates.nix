{ nixpkgs ? <nixpkgs>
, pkgs ? import nixpkgs { }
, python3 ? pkgs.python3
, fetchPypi ? pkgs.fetchPypi
, lib ? pkgs.lib
}:

python3.pkgs.buildPythonPackage rec {
  pname = "comfyui_workflow_templates";
  version = "0.1.5";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-zeHWNE2eWrGt6+egDZBjDwLuzkm+QJFFVvmzP2zKe7Q=";
  };

  nativeBuildInputs = with python3.pkgs; [
    setuptools
  ];

  pythonImportsCheck = [ pname ];

  meta = with lib; {
    description = "ComfyUI templates workflows.";
    homepage = "https://github.com/Comfy-Org/workflow_templates/";
    license = licenses.gpl3;
    maintainers = with maintainers; [ rick68 ];
  };
}
