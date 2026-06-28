{ ... }:

{
  # rebuild switch doesn't immediately kill our desktop
  programs.foot.enable = true;

  # for desktop/laptop
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    networkmanager.enable = true;
    networkmanager.connectionConfig."connection.mtu" = 1440;
    enableIPv6 = true;
  };
}
