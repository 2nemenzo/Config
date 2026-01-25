
{ config, inputs, ... }:
let 
  inherit (config.flake.modules) nixos homeManager;
in
{
  configurations.nixos.thinkpad.module = {
    imports = [
      nixos.hardware-thinkpad
      nixos.base
      nixos.hyprland
      nixos.audio
    ];

    nixpkgs.hostPlatform = "x86_64-linux";

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.${config.userName} = {
        imports = [
          homeManager.base
          homeManager.hyprland
          homeManager.waybar
          homeManager.wofi
          homeManager.nixvim
          homeManager.theming
          homeManager.dev-tools
          homeManager.git
	  homeManager.foot
        ];
      };
    };
  };
}
