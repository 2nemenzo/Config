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
    cargo
    rustc
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

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    
    colorschemes.everforest = {
      enable = true;
      settings = {
	background = "hard";
      };
    };
    
    plugins = {
      telescope.enable = true;
      treesitter.enable = true;
      lualine.enable = true;
      luasnip.enable = true;
    };
    
    plugins.lsp = {
      enable = true;
      servers = {
        lua_ls.enable = true;
        rust_analyzer.enable = true;
      };
    };
    
    plugins.nvim-cmp = {
      enable = true;
      autoEnableSources = true;
      sources = [
	{name = "nvim_lsp";}
	{name = "path";}
	{name = "buffer";}
	{name = "luasnip";}
      ];
      
      mapping = {
	"<CR>" = "cmp.mapping.confirm({ select = true })";
	"<Tab>" = {
	  action = ''
	    function(fallback)
	      local luasnip = require('luasnip')  -- Fixed: properly require luasnip
	      if cmp.visible() then
		cmp.select_next_item()
	      elseif luasnip.expandable() then
		luasnip.expand()
	      elseif luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	      else
		fallback()
	      end
	    end
	  '';
	  modes = [ "i" "s" ];
	};
      };
    };
    
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

      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      softtabstop = 2;
    };
  };

  programs.zsh = {
    enable = true;
    initExtra = ''
      PS1='%F{#B8D4C6}%n@%m%f:%F{#5C8374}%~%f$ '
    '';
  };

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
