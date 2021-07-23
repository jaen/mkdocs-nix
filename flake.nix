{
  description = "Docs development environment";

  inputs = {
    nixpkgs      = { url = "github:NixOS/nixpkgs-channels/nixpkgs-unstable"; };
    flake-utils  = { url = "github:numtide/flake-utils";                                    inputs.nixpkgs.follows = "nixpkgs"; };
    devshell     = { url = "github:numtide/devshell";                                       inputs.nixpkgs.follows = "nixpkgs"; };
    flake-compat = { url = "github:edolstra/flake-compat";                   flake = false; };
    pypi-deps-db = { url = "github:DavHau/pypi-deps-db";                     flake = false; };
    mach-nix     = { url = "github:DavHau/mach-nix";                                        inputs.nixpkgs.follows = "nixpkgs"; inputs.pypi-deps-db.follows = "pypi-deps-db"; };
  };

  outputs = args: import ./nix/outputs.nix args;
}
