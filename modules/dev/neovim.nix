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
