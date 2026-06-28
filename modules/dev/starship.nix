{ ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;

      format = "$username@$directory$git_branch$character";
      #format = "$username$hostname $directory$character";

      username = {
        show_always = true;
        format = "[$user](cyan)";
      };

      hostname = {
        ssh_only = false;
        format = "@[$hostname](purple)";
      };

      directory = {
        format = "[$path]($style) ";
        style = "blue";
      };

      character = {
        success_symbol = "[>](white)";
        error_symbol = "[>](bold red)";
      };
    };
  };
}
