{
  python312Packages,
  fetchPypi,
}:
python312Packages.buildPythonPackage rec {
  pname = "ollama";
  version = "0.1.8";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-FIoP8c6HyQStjRN/FN2mkZ+DPoPGFFfl4tRJUHxDob0=";
  };

  doCheck = false;
  pyproject = true;

  build-system = with python312Packages; [
    poetry-core
  ];

  dependencies = with python312Packages; [
    httpx
  ];
}
