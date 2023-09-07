{configs, pkgs, ...}:
{
  #Install Additional KDE Plasma packages & wayland support
  environment.systemPackages = with pkgs; [ kate libsForQt5.kcmutils libsForQt5.sddm-kcm libsForQt5.qtstyleplugin-kvantum qt6Packages.qtstyleplugin-kvantum libsForQt5.plasma-wayland-protocols xwayland libsForQt5.qt5.qtwayland qt6.qtwayland wayland ];

  #Enable KDE Plasma
  services.xserver = {
      # Enable the X11 windowing system.
      enable = true;

      # Enable the KDE Plasma Desktop Environment.
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;

      # Set Keyboard layout
      layout = "us";
      xkbVariant = "";
    };
    # Enable sound with pipewire.
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

}
