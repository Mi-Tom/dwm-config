{
  description = "DWM vývojové prostředí a flake pro vyuziti v nixos";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    packages.${system}.default = pkgs.dwm.overrideAttrs (oldAttrs: {
        src = ./.;
      });

    devShells.${system}.default = pkgs.mkShell{
      buildInputs = with pkgs; [
        xorg.libX11
        xorg.libXft
        xorg.libXinerama
        xorg.libX11.dev
        gnumake
        gcc
        pkg-config
      ];

    shellHook = ''
          echo "Vítej v DWM vývojovém prostředí!"
          echo "pro ukonceni zadejte exit"
        '';
    };
  };
}