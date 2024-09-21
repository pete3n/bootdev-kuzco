{
  python312Packages,
  fetchPypi,
}:
python312Packages.buildPythonPackage rec {
  pname = "mattsollamatools";
  version = "0.0.21";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-ggprwckk3MSjkEM8kmKzyh/aO1Sub2xW9KPMiYLbtmE=";
  };

  doCheck = false;
  pyproject = true;

  build-system = [
    python312Packages.setuptools
  ];

  dependencies = with python312Packages; [
    nltk
  ];
}
