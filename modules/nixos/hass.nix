{ config, pkgs, ... }:
let vars = import ../../vars.nix;
{
  # Home Assistant
  virtualisation.oci-containers.containers."homeassistant" = {
      autoStart = true;  
      volumes = [ "home-assistant:/config" ];
      environment.TZ = vars.tz;
      image = "ghcr.io/home-assistant/home-assistant:stable"; # Warning: if the tag does not change, the image will not be updated
      extraOptions = [ 
        "--network=host" 
        "--privileged"
       ];
  };
}
