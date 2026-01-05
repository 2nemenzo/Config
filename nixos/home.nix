{ config, pkgs, ... }:

{
  home.username = "nat";
  home.homeDirectory = "/home/nat";
  home.stateVersion = "25.05";
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    fontconfig
    nerd-fonts.jetbrains-mono
  ];

  programs.bash = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Nathaniel Nemenzo";
    userEmail = "email";
  };

  home.file.".config/hypr".source = ./config/hypr;
  home.file.".config/waybar".source = ./config/waybar;
  home.file.".config/foot".source = ./config/foot;
  home.file.".config/nvim".source = ./config/kickstart;
}
