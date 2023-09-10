{ config, pkgs, ... }:

{
  # Home Assistant
  virtualisation.oci-containers.containers."homeassistant" = {
      autoStart = true;  
      volumes = [ "home-assistant:/config" ];
      environment.TZ = "Europe/Athens";
      image = "ghcr.io/home-assistant/home-assistant:stable"; # Warning: if the tag does not change, the image will not be updated
      extraOptions = [ 
        "--network=host" 
        "--privileged"
       ];
  };
}
