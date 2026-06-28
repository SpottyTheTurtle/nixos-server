{ lib, ... }: {
  # This file was populated at runtime with the networking
  # details gathered from the active system.
  networking = {
    nameservers = [ "169.254.169.254" ];
    defaultGateway = "10.0.0.1";
    defaultGateway6 = {
      address = "";
      interface = "ens3";
    };
    dhcpcd.enable = false;
    usePredictableInterfaceNames = lib.mkForce true;
    interfaces = {
      ens3 = {
        ipv4.addresses = [{
          address = "10.0.0.196";
          prefixLength = 24;
        }];
        ipv6.addresses = [{
          address = "fe80::17ff:fe00:4e66";
          prefixLength = 64;
        }];
        ipv4.routes = [{
          address = "10.0.0.1";
          prefixLength = 32;
        }];
        /*ipv6.routes = [{
          address = "";
          prefixLength = 128;
        }];*/
      };

    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="02:00:17:00:4e:66", NAME="ens3"

  '';
}
