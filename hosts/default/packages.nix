{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    tree
    xclip
    nixfmt
    ripgrep
    rsync
    yazi
  ];

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      configure = {
        packages.all.start = with pkgs.vimPlugins;
          [ (nvim-treesitter.withPlugins (ps: [ ps.nix ])) ];
      };
    };

    nh = {
      enable = true;
      #flake = "${config.users.users.${username}.home}/${dirName}";
    };
  };

}
