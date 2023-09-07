{
  description = "Ryan's NixOS Flake";

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
      hostName = vars.hostname;;
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
    in
    rec {
      nixosConfigurations = {
        ${hostName} = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            # > Our main nixos configuration file <
            ./configuration.nix
            ./defaults.nix
            ./hosts/${hostName}
          ];
        };
      };
      homeConfigurations."${user}" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = { inherit inputs outputs; };

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./defaults-hm.nix /hosts/${hostName} ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
