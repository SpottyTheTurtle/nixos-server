{ ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      display = {
        separator = " ➜  ";
      };
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "bios"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "editor"
        "display"
        "de"
        "wm"
        "terminal"
        "cpu"
        "gpu"
        "memory"
        "localip"
        "break"
        "colors"
      ];
    };
  };
}
