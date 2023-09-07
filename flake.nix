{
  description = "NixOS System Config";

  inputs = {
     # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      vars = import ./vars.nix;
      user = vars.user;
      userHome = "/home/${user}";
      hostName = vars.hostname;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
      
      lib = nixpkgs.lib;

    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          
          modules = [
            ./configurationo.nix
          ];
        };
      };
    };
}
