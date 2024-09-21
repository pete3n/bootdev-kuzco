{pkgs, ...}: {
  mattsollamatools = pkgs.callPackage ./mattsollamatools {};
  chromadb = pkgs.callPackage ./chromadb {};
  ollama = pkgs.callPackage ./ollama {};
}
