{ system ? builtins.currentSystem }:
  (import ./nix/compat.nix { inherit system; }).shellNix
