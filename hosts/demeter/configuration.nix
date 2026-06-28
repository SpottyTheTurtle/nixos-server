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

  networking.hostName = "Demeter";

  home-manager.users.${username} = {
    imports = [ ./home.nix ];
  };

  environment.shellAliases = {
    nrs = "sudo nixos-rebuild switch --flake ~/${dirName}#demeter";
  };

  system.stateVersion = "23.11";
}
