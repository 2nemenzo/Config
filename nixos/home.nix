{ config, pkgs, nixvim, ... }:
{
  imports = [
    nixvim.homeManagerModules.nixvim
  ];
  home.username = "nat";
  home.homeDirectory = "/home/nat";
  home.stateVersion = "25.05";
  
  fonts.fontconfig.enable = true;
  
  home.packages = with pkgs; [
    fontconfig
    nerd-fonts.jetbrains-mono
    foot
    waybar
    kitty
    hyprpaper
    ripgrep
    fd
    unzip
    wofi
  ];
  
  # Cursor theme settings for Wayland
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.apple-cursor;  # or pkgs.bibata-cursors, etc.
    name = "macOS-White";  # Check the package for exact theme name
    size = 20;
  };
  
  gtk = {
    enable = true;
    font.name = "Jetbrains Mono";
    
    theme = {
      name = "vimix-dark-doder";
      package = pkgs.vimix-gtk-themes;
    };
    
    iconTheme = {
      name = "Vimix-Doder-Dark";
      package = pkgs.vimix-icon-theme;
    };
  };
  
  # Rest of your config...
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true;
    
    opts = {
      number = true;
      relativenumber = true;
      mouse = "a";
      showmode = false;
      breakindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      updatetime = 250;
      timeoutlen = 300;
      splitright = true;
      splitbelow = true;
      list = true;
      listchars = { tab = "» "; trail = "·"; nbsp = "␣"; };
      inccommand = "split";
      cursorline = true;
      scrolloff = 10;
      confirm = true;
    };
  };
  
  programs.bash.enable = true;
  
  programs.git = {
    enable = true;
    userName = "Nathaniel Nemenzo";
    userEmail = "email";
  };
  
  xdg.configFile."hypr".source = ./config/hypr;
  xdg.configFile."foot".source = ./config/foot;
  xdg.configFile."waybar".source = ./config/waybar;
  xdg.configFile."wofi".source = ./config/wofi;
}
