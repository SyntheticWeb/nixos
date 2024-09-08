{ lib, config, pkgs, inputs, ... }:


let
  cfg = config.nixvim;
in
{
  imports = [

    inputs.nixvim.nixosModules.nixvim

  ];


  options.nixvim = {
    enable = lib.mkEnableOption "enable nixvim";
  };

  config = lib.mkIf cfg.enable {

    programs.nixvim = {


      keymaps = [
        {
          action = "<cmd>Telescope find_files<CR>";
          key = "<leader>ff";
        }
      ];


      enable = true;

      colorschemes.dracula.enable = true;

      globalOpts = {
        number = true;
        relativenumber = true;
        signcolumn = "yes";

        ignorecase = true;
        smartcase = true;


        expandtab = true;
        smarttab = true;

        clipboard = "unnamedplus";

        cursorline = true;

        ruler = true;
      };

      globals.mapleader = " ";

      autoCmd = [
        {
          event = "BufWritePre";
          pattern = "*.nix";
          command = "%!nixpkgs-fmt";

        }

      ];

      plugins = {

        bufferline = {
          enable = true;
        };


        lualine.enable = true;

        treesitter.enable = true;
        telescope.enable = true;

        autoclose.enable = true;

        comment.enable = true;

        luasnip.enable = true;

        cmp-emoji = {
          enable = true;
        };

        cmp = {
          enable = true;
          settings = {
            autoEnableSources = true;
            experimental = { ghost_text = true; };
            performance = {
              debounce = 60;
              fetchingTimeout = 200;
              maxViewEntries = 30;
            };
            snippet = { expand = "luasnip"; };
            formatting = { fields = [ "kind" "abbr" "menu" ]; };
            sources = [
              { name = "nvim_lsp"; }
              { name = "emoji"; }
              {
                name = "buffer"; # text within current buffer
                option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
                keywordLength = 3;
              }
              # { name = "copilot"; } # enable/disable copilot
              {
                name = "path"; # file system paths
                keywordLength = 3;
              }
              {
                name = "luasnip"; # snippets
                keywordLength = 3;
              }
            ];

            window = {
              completion = { border = "solid"; };
              documentation = { border = "solid"; };
            };

            mapping = {
              "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
              "<C-j>" = "cmp.mapping.select_next_item()";
              "<C-k>" = "cmp.mapping.select_prev_item()";
              "<C-e>" = "cmp.mapping.abort()";
              "<C-b>" = "cmp.mapping.scroll_docs(-4)";
              "<C-f>" = "cmp.mapping.scroll_docs(4)";
              "<C-Space>" = "cmp.mapping.complete()";
              "<CR>" = "cmp.mapping.confirm({ select = true })";
              "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
            };
          };
        };
        cmp-nvim-lsp = {
          enable = true; # LSP
        };
        cmp-buffer = {
          enable = true;
        };
        cmp-path = {
          enable = true; # file system paths
        };
        cmp_luasnip = {
          enable = true; # snippets
        };
        cmp-cmdline = {
          enable = true; # autocomplete for cmdline
        };

        guess-indent.enable = true;

        tmux-navigator.enable = true;

        rust-tools.enable = true;

        lsp = {
          enable = true;

          keymaps.lspBuf = {
            K = "hover";
          };


          servers = {
            rust-analyzer = {
              enable = true;
              installCargo = true;
              installRustc = true;
            };
            nixd = {
              enable = true;
              settings.formatting.command = [ "nixpkg-fmt" ];
            };
          };

        };

        lsp-format = {
          enable = true;
        };
        lsp-lines.enable = true;
      };

    };
    environment.systemPackages = with pkgs; [
      nixd
      nixpkgs-fmt
    ];

  };
}
