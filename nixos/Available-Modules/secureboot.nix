{ config, pkgs, ... }:

{
  boot = {
    bootspec.enable = true;
    loader.systemd-boot.enable = false;
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };
  environment.systemPackages = [ pkgs.git ];
}
