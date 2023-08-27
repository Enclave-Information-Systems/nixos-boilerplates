{config,...} {
{
  #Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  #Install Nvidia Drivers
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
  };

  #Kernel Parameters
  boot.kernelParams = [ "nvidia_drm.modeset=1" "module_blacklist=i915"];
  boot.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];

}
