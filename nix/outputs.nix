inputs@{
  self,
  nixpkgs,
  flake-utils,
  flake-compat,
  devshell,
  mach-nix,
  ...
}:
  flake-utils.lib.eachSystem [ "x86_64-linux" "x86_64-darwin" "aarch64-darwin" ]
    (system:
      let
        inherit (builtins) toString map readFile filterSource elemAt;
        inherit (pkgs.lib) all splitString;

        pkgImport = pkgs:
          import pkgs {
            inherit system;
            overlays = [
              devshell.overlay
              (final: prev: { lib = prev.lib.extend (self: super: { mach-nix = mach-nix.lib.${ system }; }); })
              # (final: prev: self.packages)
            ];
            config = { allowUnfree = true; };
          };

        pkgs = pkgImport nixpkgs;
        lib  = pkgs.lib;

        packages = pkgs.callPackages ./packages {};
      in
        {
          packages = {
            mkdocs    = packages.company.mkdocs;
            docs-site = packages.company.docs-site;
          };

          # defaultPackage = packages.fresha.docs-site;
          devShell = pkgs.devshell.mkShell {
            packages = with pkgs; [
              fresha-mkdocs
            ];
          };
        })
