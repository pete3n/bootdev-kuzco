{
  python312Packages,
  fetchPypi,
}:
python312Packages.buildPythonPackage rec {
  pname = "chromadb";
  version = "0.4.24";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-pcgLTkrZsjbtLUiZpbnoACtIkpPyiByyytq1sZnuHHI=";
  };

  doCheck = false;
  pyproject = true;

  build-system = with python312Packages; [
    setuptools
    setuptools-scm
    wheel
  ];

  dependencies = with python312Packages; [
    build
    bcrypt
    chroma-hnswlib
    fastapi
    graphlib-backport
    grpcio
    importlib-resources
    kubernetes
    mmh3
    numpy
    onnxruntime
    opentelemetry-api
    opentelemetry-exporter-otlp-proto-grpc
    opentelemetry-instrumentation-fastapi
    opentelemetry-sdk
    orjson
    overrides
    posthog
    pulsar-client
    pyaml
    pydantic
    pypika
    requests
    tenacity
    tokenizers
    tqdm
    typer
    typing-extensions
    uvicorn
  ];
}
