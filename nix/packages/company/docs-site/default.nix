{
  pkgs,
  # lib,
  company-mkdocs,
  ...
}:
  let
    repoRoot = ./../../../..;
  in
    pkgs.stdenv.mkDerivation {
      name = "company-docs-site";

      src = repoRoot;

      buildInputs = with pkgs; [
        company-mkdocs
      ];

      buildPhase = ''
        cd $src
        mkdocs build -d site
      '';

      installPhase = ''
        mkdir -p $out/share/site
        cp -r $src/site $out/share/site
      '';
    }
