{
  python312Packages,
  fetchPypi,
}:
python312Packages.buildPythonPackage rec {
  pname = "mattsollamatools";
  version = "0.0.25";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-m0avc8Uus9FlbGUUI+vRHaWq3OFI8pMbiC7bbAAx93Q=";
  };

  doCheck = false;
  pyproject = true;

  build-system = [
    python312Packages.setuptools
  ];

  dependencies = with python312Packages; [
    setuptools
    wheel
  ];
}
