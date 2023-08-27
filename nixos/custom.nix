{ config, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./Activated-Modules
    ];


  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  nix = {
    settings.experimental-features = "nix-command";

    #Enable Automatic Garbage Collection
    gc.automatic = true;
    gc.dates = "03:15";

    #Enable Automatic Linting of Duplicated stores
    settings.auto-optimise-store = true;
  };

  #Enable Automatic Updating
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
  };

}
