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

  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    vimAlias = true;
    viAlias = true;

    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true;
    
    # Options
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

  programs.bash = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Nathaniel Nemenzo";
    userEmail = "email";
  };

	gtk = {
	  enable = true;
	  
	  theme = {
	    name = "vimix-dark-doder";
	    package = pkgs.vimix-gtk-themes;
	  };
	  
	  iconTheme = {
	    name = "Vimix-Doder-Dark";
	    package = pkgs.vimix-icon-theme;
	  };
	};

  xdg.configFile."hypr".source = ./config/hypr;
  xdg.configFile."foot".source = ./config/foot;
  xdg.configFile."waybar".source = ./config/waybar;
  xdg.configFile."wofi".source = ./config/wofi;
}
