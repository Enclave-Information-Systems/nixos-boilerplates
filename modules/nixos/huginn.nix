{ config, pkgs, ... }:

{
  # Home Assistant
  virtualisation.oci-containers.containers."huginn" = {
      autoStart = true;  
      volumes = [ "huginn:/config" ];
      environment.TZ = "Europe/Athens";
      image = "ghcr.io/huginn/huginn:latest"; # Warning: if the tag does not change, the image will not be updated
      extraOptions = [ 
        "--network=host" 
        "--privileged"
       ];
  };
}
