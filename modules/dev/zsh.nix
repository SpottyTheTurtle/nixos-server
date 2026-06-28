{ pkgs, config, ... }:

{
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    #PROMPT='%F{cyan}%n%f@%F{magenta}%m%f %F{blue}%~%f %# '
    #if command -v fastfetch &> /dev/null; then
    #  fastfetch
    #fi

    initContent = ''


      if command -v !fastfetch &> /dev/null; then
        fastfetch -c examples/32
      fi

      [ -f "${config.home.homeDirectory}/.cache/wal/colors.sh" ] && . "${config.home.homeDirectory}/.cache/wal/colors.sh"
    '';

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];
  };
}
