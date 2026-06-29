{
  description = "Askosia Nixos server flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    lazyvim.url = "github:pfassina/lazyvim-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      username = "askosia";
      specialArgs = {
        inherit inputs username;
        dirName = "nixos-server";
      };
    in
    {
      nixosConfigurations = {
        dev = lib.nixosSystem {
          system = "x86_64-linux";
          inherit specialArgs;

          modules = [
            ./hosts/default/configuration.nix
            ./hosts/demeter/configuration.nix
            ./hosts/dev.nix
            /etc/nixos/hardware-configuration.nix
          ];
        };

        demeter = lib.nixosSystem {
          system = "x86_64-linux";
          inherit specialArgs;

          modules = [
            ./hosts/default/configuration.nix
            ./hosts/demeter/configuration.nix
            ./hosts/demeter/hardware-configuration.nix
          ];
        };
        hephaestus = lib.nixosSystem {
          system = "aarch64-linux";
          inherit specialArgs;

          modules = [
            ./hosts/default/configuration.nix
            ./hosts/hephaestus/configuration.nix
            ./hosts/hephaestus/hardware-configuration.nix
          ];
        };
      };
    };
}
