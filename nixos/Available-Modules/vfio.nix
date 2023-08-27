{configs, ...}:
{
  specialisation = {
  #VFIO Boot Option
    VFIO.configuration = {
      system.nixos.tags = [ "with-vfio" ];
      vfio.enable = true;
      imports =
        [ # Include the results of the hardware scan.
        ../specialicastion/vfio/vfio.nix
      ];
    };
  };
}
