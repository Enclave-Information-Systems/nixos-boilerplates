{
  # Don't forget to set a password with 'passwd'.
  user = "nixos";
  hostname = "nixos";
  tz = "America/Chicago";
  locale = "en_US.UTF-8";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  version = "23.11"; # Did you read the comment?
}
