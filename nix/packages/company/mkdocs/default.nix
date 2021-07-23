{
  pkgs,
  lib,
  ...
}:
  let

  in
    lib.mach-nix.mkPython {
      requirements = builtins.readFile ./requirements.txt;

      # _.mkdocstrings.postInstall = ''
      #   rm $out/lib/python*/site-packages/README.md
      #   rm $out/lib/python*/site-packages/pyproject.toml
      # '';

      packagesExtra = with pkgs; [
        graphviz
        plantuml
      ];
    }
