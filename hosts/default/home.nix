{
  config,
  pkgs,
  lib,
  inputs,
  username,
  ...
}:

let
  use = list: map (path: ../../modules/${path}.nix) list;
in
{
  home.username = username;
  home.homeDirectory = lib.mkForce ("/home/${username}");

  home.stateVersion = "23.11";

  imports = [
    inputs.lazyvim.homeManagerModules.default
  ]
  ++ use [
    "dev/bat"
    "dev/eza"
    "dev/fastfetch"
    "dev/neovim"
    "dev/starship"
    "dev/yazi"
    "dev/zellij"
    "dev/zsh"
  ];

  home.packages = with pkgs; [
    lazygit
    btop

    (pkgs.writeShellApplication {
      name = "nf";
      runtimeInputs = with pkgs; [
        fzf
        nix-search-tv
      ];
      text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
    })
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    LANG = "en_IE.UTF-8";
    LANGUAGE = "en_IE:en";
    LC_ALL = "en_IE.UTF-8";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
