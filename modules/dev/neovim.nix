{ pkgs, ... }:
{
  programs.lazyvim = {
    enable = true;

    pluginSource = "nixpkgs";

    extras = {
      lang.nix.enable = true;
    };

    treesitterParsers = with pkgs.vimPlugins.nvim-treesitter-parsers; [
      nix
    ];

    extraPackages = with pkgs; [
      nixd
      statix
    ];

    plugins = {
      colorscheme = ''
        return {
          {
            "RedsXDD/neopywal.nvim",
            name = "neopywal",
            lazy = false,
            priority = 1000,
            opts = {
              use_palette = "pywal",
              notify = "none",
              transparent_background = true,
            },
          },
          {
            "LazyVim/LazyVim",
            opts = {
              colorscheme = "catppuccin-mocha",
            },
          },
        }
      '';
    };
  };
}
