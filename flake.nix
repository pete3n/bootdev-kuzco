{
  description = "Kuzco dev flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
  };

  outputs = {nixpkgs, ...}: let
    inherit (nixpkgs.lib) genAttrs;
    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];

    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
  in {
    packages = forAllSystems (
      system:
        import ./pkgs {
          inherit system;
          pkgs = nixpkgs.legacyPackages.${system};
        }
    );

    devShells = forAllSystems (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        default = pkgs.mkShell {
          buildInputs = with pkgs;
            [
              python312
            ]
            ++ (with python312Packages; [
              magic
              beautifulsoup4
              chromadb
              ollama
              python_magic
              requests
            ]);
        };
      }
    );
  };
}
