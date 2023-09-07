{ config, lib, pkgs, ... }:
let
  vars = import ./vars.nix;
  user = vars.user;
  hostName = vars.hostname;
in
{
  imports = [ ./hardware-configuration.nix ./hosts/${hostName}];

  environment.systemPackages = [ pkgs.git ];

  nix = {
    settings.experimental-features = lib.mkDefault "nix-command";

    #Enable Automatic Garbage Collection
    gc.automatic = lib.mkDefault true;
    gc.dates = lib.mkDefault "daily";

    #Enable Automatic Linting of Duplicated stores
    settings.auto-optimise-store = lib.mkDefault true;

  # Define a user account. Don't forget to set a password with 'passwd'.
  users.users.${user} = lib.mkDefault {
    isNormalUser = true;
    description = "${user}";
    extraGroups = [ "networkmanager" "wheel" "${user}"];
  };


  networking.hostName = lib.mkDefault vars.hostname;
  networking.networkmanager.enable = lib.mkDefault true;

  time.timeZone = lib.mkDefault vars.tz;
  i18n.defaultLocale = lib.mkDefault vars.locale;
  i18n.extraLocaleSettings = lib.mkDefault {
    LC_ADDRESS = vars.locale;
    LC_IDENTIFICATION = vars.locale;
    LC_MEASUREMENT = vars.locale;
    LC_MONETARY = vars.locale;
    LC_NAME = vars.locale;
    LC_NUMERIC = vars.locale;
    LC_PAPER = vars.locale;
    LC_TELEPHONE = vars.locale;
    LC_TIME = vars.locale;
  };

  #Enable Automatic Updating
  system.autoUpgrade = lib.mkDefault {
    enable = true;
    allowReboot = false;
  };
}
