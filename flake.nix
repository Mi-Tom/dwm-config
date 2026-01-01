{
  description = "DWM vývojové prostředí";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    devShells.${system}.default = pkgs.mkShell{
      buildInputs = with pkgs; [
        xorg.libX11
        xorg.libXft
        xorg.libXinerama
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