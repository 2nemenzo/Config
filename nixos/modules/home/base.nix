{ config, pkgs, ... }:

{
  flake.modules.homeManager.base = {
    home.username = config.userName;
    home.homeDirectory = "/home/${config.userName}";
    home.stateVersion = "25.05";

    fonts.fontconfig.enable = true;
  };
}
