{ ... }:

{
  programs.bat = {
    enable = true;
    config = {
      tabs = "4";
      nonprintable-notation = "unicode";
      italic-text = "always";
      paging = "auto";
      pager = "less";
      style = "numbers,header";
      decorations = "auto";
      color = "auto";
    };
  };

  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat --plain --language man'";
    MANROFFOPT = "-c";
  };
}
