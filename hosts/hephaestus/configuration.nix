{
  pkgs,
  inputs,
  dirName,
  username,
  ...
}:
{
  imports = [
    ../default/configuration.nix
  ];

  environment.systemPackages = with pkgs; [

  ];

  networking.hostName = "Hephaestus";

  home-manager.users.${username} = {
    imports = [ ./home.nix ];
  };

  environment.shellAliases = {
    nrs = "sudo nixos-rebuild switch --flake ~/${dirName}#hephaestus";
  };

  #system.stateVersion = "23.11";
}
