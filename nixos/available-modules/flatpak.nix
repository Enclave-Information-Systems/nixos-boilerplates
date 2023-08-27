{configs, pkgs, ...} :
{
  #Enable Flatpak
  services.flatpak.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  #Automatically Update Flatpaks
  systemd.timers."update-flatpak" = {
    wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "5m";
        OnUnitActiveSec = "1h";
        Unit = "update-flatpak.service";
      };
  };

  systemd.services."update-flatpak" = {
    script = ''
      set -eu
      ${pkgs.flatpak}/bin/flatpak update --noninteractive
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };

}
