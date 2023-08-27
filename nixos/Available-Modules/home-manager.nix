{configs, pkgs, ...}:
{
  imports = [
      <home-manager/nixos>
  ];
  home-manager.users.{username} = { pkgs, ... }: {
    home.homeDirectory = "/home/{username}";
    home.stateVersion = "23.11";
    programs.home-manager.enable = true;
    home.packages = [  ];
  };
}
