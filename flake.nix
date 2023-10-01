{
  description = "waycon flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    devShells.${system}.default =
      pkgs.mkShell
        {
          buildInputs = [
            pkgs.rustup
            pkgs.gcc
            pkgs.nodejs_20
            pkgs.pkg-config
            pkgs.libsoup
            pkgs.webkitgtk
          ];
        };
  };
}
