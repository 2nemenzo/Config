{ inputs, ... }:

{
  flake.modules.homeManager.nixvim = { pkgs, ... }: {
    imports = [ inputs.nixvim.homeManagerModules.nixvim ];

    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
      viAlias = true;

      colorschemes.everforest = {
        enable = true;
        settings.background = "hard";
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
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "luasnip"; }
        ];
        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = {
            action = ''
              function(fallback)
                local luasnip = require('luasnip')
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
				softtabstop = 2;
				smartindent = true;
      };
    };
  };
}
