{ inputs, ... }:

{
  flake.modules.homeManager.nixvim = { pkgs, ... }: {
    imports = [ inputs.nixvim.homeModules.nixvim ];

    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
      viAlias = true;

      # ========================================
      # Leader Key (kickstart uses space)
      # ========================================
      globals = {
        mapleader = " ";
        maplocalleader = " ";
      };

      # ========================================
      # Colorscheme
      # ========================================
      colorschemes.oxocarbon = {
        enable = true;
      };

      # ========================================
      # Options (kickstart defaults)
      # ========================================
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
        hlsearch = true;

        tabstop = 2;
        shiftwidth = 2;
        softtabstop = 2;
        smartindent = true;
        expandtab = true;
      };

      # ========================================
      # Clipboard - Sync with system clipboard
      # ========================================
      clipboard = {
        register = "unnamedplus";
        providers.wl-copy.enable = true;
      };

      # ========================================
      # Autocommands
      # ========================================
      autoCmd = [
        {
          event = "TextYankPost";
          pattern = "*";
          callback.__raw = ''
            function()
              vim.highlight.on_yank()
            end
          '';
          desc = "Highlight when yanking text";
        }
      ];

      # ========================================
      # Keymaps (kickstart core keymaps)
      # ========================================
      keymaps = [
        {
          mode = "n";
          key = "<Esc>";
          action = "<cmd>nohlsearch<CR>";
        }
        {
          mode = "n";
          key = "[d";
          action.__raw = "vim.diagnostic.goto_prev";
          options.desc = "Go to previous [D]iagnostic message";
        }
        {
          mode = "n";
          key = "]d";
          action.__raw = "vim.diagnostic.goto_next";
          options.desc = "Go to next [D]iagnostic message";
        }
        {
          mode = "n";
          key = "<leader>e";
          action.__raw = "vim.diagnostic.open_float";
          options.desc = "Show diagnostic [E]rror messages";
        }
        {
          mode = "n";
          key = "<leader>q";
          action.__raw = "vim.diagnostic.setloclist";
          options.desc = "Open diagnostic [Q]uickfix list";
        }
        {
          mode = "t";
          key = "<Esc><Esc>";
          action = "<C-\\><C-n>";
          options.desc = "Exit terminal mode";
        }
        {
          mode = "n";
          key = "<C-h>";
          action = "<C-w><C-h>";
          options.desc = "Move focus to the left window";
        }
        {
          mode = "n";
          key = "<C-l>";
          action = "<C-w><C-l>";
          options.desc = "Move focus to the right window";
        }
        {
          mode = "n";
          key = "<C-j>";
          action = "<C-w><C-j>";
          options.desc = "Move focus to the lower window";
        }
        {
          mode = "n";
          key = "<C-k>";
          action = "<C-w><C-k>";
          options.desc = "Move focus to the upper window";
        }
      ];

      # ========================================
      # Plugins
      # ========================================
      plugins = {
        # ---- Web Devicons (required by telescope) ----
        web-devicons.enable = true;

        # ---- Which-Key (shows pending keybinds) ----
        which-key = {
          enable = true;
          settings = {
            spec = [
              { __unkeyed-1 = "<leader>c"; group = "[C]ode"; }
              { __unkeyed-1 = "<leader>d"; group = "[D]ocument"; }
              { __unkeyed-1 = "<leader>r"; group = "[R]ename"; }
              { __unkeyed-1 = "<leader>s"; group = "[S]earch"; }
              { __unkeyed-1 = "<leader>w"; group = "[W]orkspace"; }
              { __unkeyed-1 = "<leader>t"; group = "[T]oggle"; }
              { __unkeyed-1 = "<leader>h"; group = "Git [H]unk"; mode = [ "n" "v" ]; }
              { __unkeyed-1 = "g"; group = "[G]oto"; }
            ];
          };
        };

        # ---- Telescope (fuzzy finder) ----
        telescope = {
          enable = true;
          extensions = {
            fzf-native.enable = true;
            ui-select.enable = true;
          };
          keymaps = {
            "<leader>sh" = { action = "help_tags"; options.desc = "[S]earch [H]elp"; };
            "<leader>sk" = { action = "keymaps"; options.desc = "[S]earch [K]eymaps"; };
            "<leader>sf" = { action = "find_files"; options.desc = "[S]earch [F]iles"; };
            "<leader>ss" = { action = "builtin"; options.desc = "[S]earch [S]elect Telescope"; };
            "<leader>sw" = { action = "grep_string"; options.desc = "[S]earch current [W]ord"; };
            "<leader>sg" = { action = "live_grep"; options.desc = "[S]earch by [G]rep"; };
            "<leader>sd" = { action = "diagnostics"; options.desc = "[S]earch [D]iagnostics"; };
            "<leader>sr" = { action = "resume"; options.desc = "[S]earch [R]esume"; };
            "<leader>s." = { action = "oldfiles"; options.desc = "[S]earch Recent Files"; };
            "<leader><leader>" = { action = "buffers"; options.desc = "[ ] Find existing buffers"; };
          };
        };

        # ---- Treesitter (syntax highlighting & more) ----
        treesitter = {
          enable = true;
          settings = {
            highlight.enable = true;
            indent.enable = true;
          };
        };

        # ---- LSP Configuration ----
        lsp = {
          enable = true;
          keymaps = {
            lspBuf = {
              "gd" = { action = "definition"; desc = "[G]oto [D]efinition"; };
              "gr" = { action = "references"; desc = "[G]oto [R]eferences"; };
              "gI" = { action = "implementation"; desc = "[G]oto [I]mplementation"; };
              "<leader>D" = { action = "type_definition"; desc = "Type [D]efinition"; };
              "<leader>ds" = { action = "document_symbol"; desc = "[D]ocument [S]ymbols"; };
              "<leader>ws" = { action = "workspace_symbol"; desc = "[W]orkspace [S]ymbols"; };
              "<leader>rn" = { action = "rename"; desc = "[R]e[n]ame"; };
              "<leader>ca" = { action = "code_action"; desc = "[C]ode [A]ction"; };
              "gD" = { action = "declaration"; desc = "[G]oto [D]eclaration"; };
            };
          };
          servers = {
            lua_ls = {
              enable = true;
              settings = {
                Lua = {
                  completion.callSnippet = "Replace";
                  diagnostics.globals = [ "vim" ];
                };
              };
            };
            rust_analyzer = {
              enable = true;
              installCargo = false;
              installRustc = false;
            };
            nixd.enable = true;
          };
        };

        # ---- nvim-cmp (Autocompletion) ----
        cmp = {
          enable = true;
          autoEnableSources = true;
          settings = {
            sources = [
              { name = "nvim_lsp"; }
              { name = "luasnip"; }
              { name = "path"; }
              { name = "buffer"; }
            ];
            snippet.expand = ''
              function(args)
                require('luasnip').lsp_expand(args.body)
              end
            '';
            mapping = {
              "<C-n>" = "cmp.mapping.select_next_item()";
              "<C-p>" = "cmp.mapping.select_prev_item()";
              "<C-b>" = "cmp.mapping.scroll_docs(-4)";
              "<C-f>" = "cmp.mapping.scroll_docs(4)";
              "<C-y>" = "cmp.mapping.confirm { select = true }";
              "<C-Space>" = "cmp.mapping.complete {}";
              "<C-l>" = ''
                cmp.mapping(function()
                  local luasnip = require 'luasnip'
                  if luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                  end
                end, { 'i', 's' })
              '';
              "<C-h>" = ''
                cmp.mapping(function()
                  local luasnip = require 'luasnip'
                  if luasnip.locally_jumpable(-1) then
                    luasnip.jump(-1)
                  end
                end, { 'i', 's' })
              '';
            };
          };
        };

        # ---- LuaSnip (snippets) ----
        luasnip = {
          enable = true;
          settings = {
            history = true;
            updateevents = "TextChanged,TextChangedI";
          };
        };

        # ---- Lualine (statusline) ----
        lualine.enable = true;

        # ---- Gitsigns (git integration in gutter) ----
        gitsigns = {
          enable = true;
          settings = {
            signs = {
              add.text = "+";
              change.text = "~";
              delete.text = "_";
              topdelete.text = "‾";
              changedelete.text = "~";
            };
          };
        };

        # ---- Comment.nvim (easy commenting) ----
        comment.enable = true;

        # ---- Todo Comments (highlight TODO, FIXME, etc) ----
        todo-comments = {
          enable = true;
          settings.signs = true;
        };

        # ---- Mini modules ----
        mini = {
          enable = true;
          modules = {
            ai = {
              n_lines = 500;
            };
            surround = {};
          };
        };

        # ---- Indent Blankline (indent guides) ----
        indent-blankline.enable = true;

        # ---- Autopairs (auto close brackets, quotes) ----
        nvim-autopairs.enable = true;

        # ---- Sleuth (auto detect tabstop and shiftwidth) ----
        sleuth.enable = true;

        # ---- Fidget (LSP status notifications) ----
        fidget.enable = true;
      };

      # ========================================
      # Extra Lua config
      # ========================================
      extraConfigLua = ''
        -- Search in current buffer with Telescope
        vim.keymap.set('n', '<leader>/', function()
          require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
          })
        end, { desc = '[/] Fuzzily search in current buffer' })

        -- Search in open files
        vim.keymap.set('n', '<leader>s/', function()
          require('telescope.builtin').live_grep {
            grep_open_files = true,
            prompt_title = 'Live Grep in Open Files',
          }
        end, { desc = '[S]earch [/] in Open Files' })

        -- Search Neovim config files
        vim.keymap.set('n', '<leader>sn', function()
          require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
        end, { desc = '[S]earch [N]eovim files' })
      '';
    };
  };
}
