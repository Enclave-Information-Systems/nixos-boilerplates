{ pkgs, lib, config, nixpkgs, ... }: {
  options.vfio.enable = with lib;
    mkEnableOption "Configure the machine for VFIO";

  config = let cfg = config.vfio;
  in {
    boot = {
      initrd.kernelModules = [
        "vfio_pci"
        "vfio"
        "vfio_iommu_type1"
      ];

      kernelParams = [
        # enable IOMMU
        "iommu=1"
        "amd_iommu=on"
        "pcie_acs_override=downstream"
        "rd.driver.pre=vfio-pc"
        "vfio-pci.ids={PCIE_IDS}"
        "mitigations=off"
        "default_hugepagesz=1G"
        "hugepagesz=1G"
        "hugepages=16"
        "isolcpus=0-30"
        "nohz_full=0-30"
      ];
      kernelPackages = pkgs.linuxPackages_zen;
    };

    hardware.opengl.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;

    environment.systemPackages = with pkgs;[ qemu libvirt OVMF virt-manager swtpm ];
    systemd.packages = [ pkgs.libvirt ];
    virtualisation.libvirtd.enable = true;
    virtualisation.libvirtd.qemu.swtpm.enable = true;

    fileSystems."/mnt/SSD" =
    { device = "/dev/disk/by-uuid/c0c4ce8a-76cc-496f-a772-da8e858aeffc";
      fsType = "btrfs";
      options = [ "defaults" "discard=async" "noatime" ];
    };

    systemd.services.libvirtd.path = [ pkgs.bash pkgs.libvirt ];

  };
}
