{ config, inputs, ... }:
let
  inherit (config.flake.modules) nixos homeManager;
in
{
  configurations.nixos.desktop.module = {
    imports = [
      nixos.hardware-desktop
      nixos.base
      nixos.hyprland
      nixos.nvidia
      nixos.audio
    ];

    nixpkgs.hostPlatform = "x86_64-linux";

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.${config.userName} = {
        imports = [
          homeManager.colors
          homeManager.base
          homeManager.hyprland
          homeManager.waybar
          homeManager.wofi
          homeManager.nixvim
          homeManager.theming
          homeManager.dev-tools
          homeManager.git
          homeManager.foot
          homeManager.bash
        ];
      };
    };
  };
}
