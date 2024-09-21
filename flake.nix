{
  description = "Kuzco dev flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    #nixvim-flake.url = "github:pete3n/nixvim-flake";
  };

  outputs = {
    nixpkgs,
    #nixvim-flake,
    ...
  }: let
    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];

    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
  in {
    devShells = forAllSystems (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
        customPkgs = import ./pkgs {inherit pkgs;};
      in {
        default = pkgs.mkShell {
          #inputsFrom = [nixvim-flake.devShells.${system}.default];
          buildInputs =
            [
              pkgs.python312Full
            ]
            ++ (with pkgs.python312Packages; [
              beautifulsoup4
              python_magic
              requests
            ])
            ++ (with customPkgs; [
              mattsollamatools
              chromadb
              ollama
            ]);
          shellHook = ''
                  echo "Starting chromadb on port 8000"
            docker run -d -p 8000:8000 -v chroma-data:/chromadb/data chromadb/chroma:0.4.24
          '';
        };
      }
    );
  };
}
