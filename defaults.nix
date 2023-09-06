{ inputs, outputs, config, lib, ... }:
let
  vars = import ./vars.nix;
  user = vars.user;
in
{
  nix = {
    settings.experimental-features = "nix-command flakes";

    #Enable Automatic Garbage Collection
    gc.automatic = true;
    gc.dates = "daily";

    #Enable Automatic Linting of Duplicated stores
    settings.auto-optimise-store = true;

    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
  };

  # Define a user account. Don't forget to set a password with 'passwd'.
  users.users.${user} = lib.mkForce {
    isNormalUser = true;
    description = "${user}";
    extraGroups = [ "networkmanager" "wheel" "${user}"];
  };


  networking.hostName = lib.mkForce vars.hostname;
  time.timeZone = lib.mkForce vars.tz;
  i18n.defaultLocale = lib.mkForce vars.locale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = lib.mkForce vars.locale;
    LC_IDENTIFICATION = lib.mkForce vars.locale;
    LC_MEASUREMENT = lib.mkForce vars.locale;
    LC_MONETARY = lib.mkForce vars.locale;
    LC_NAME = lib.mkForce vars.locale;
    LC_NUMERIC = lib.mkForce vars.locale;
    LC_PAPER = lib.mkForce vars.locale;
    LC_TELEPHONE = lib.mkForce vars.locale;
    LC_TIME = lib.mkForce vars.locale;
  };

  #Enable Automatic Updating
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
  };

}
