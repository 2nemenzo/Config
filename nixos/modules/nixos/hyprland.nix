{ config, ... }:

{
  flake.modules.nixos.hyprland = { pkgs, ... }: {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    programs.firefox.enable = true;
  };
}
