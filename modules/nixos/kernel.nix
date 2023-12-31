{config, pkgs, ...} :
{
#  boot.kernelPackages = pkgs.linuxPackages;
#  boot.kernelPackages = pkgs.linuxPackages_latest;
#  boot.kernelPackages = pkgs.linuxPackages-libre;
#  boot.kernelPackages = pkgs.linuxPackages-rt;
#  boot.kernelPackages = pkgs.linuxPackages-rt_5_4;
#  boot.kernelPackages = pkgs.linuxPackages-rt_5_6;
#  boot.kernelPackages = pkgs.linuxPackages-rt_latest;
#  boot.kernelPackages = pkgs.linuxPackagesFor;
#  boot.kernelPackages = pkgs.linuxPackages_4_14;
#  boot.kernelPackages = pkgs.linuxPackages_4_19;
#  boot.kernelPackages = pkgs.linuxPackages_4_4;
#  boot.kernelPackages = pkgs.linuxPackages_4_9;
#  boot.kernelPackages = pkgs.linuxPackages_5_4;
#  boot.kernelPackages = pkgs.linuxPackages_5_8;
#  boot.kernelPackages = pkgs.linuxPackages_5_9;
#  boot.kernelPackages = pkgs.linuxPackages_custom;
#  boot.kernelPackages = pkgs.linuxPackages_custom_tinyconfig_kernel;
#  boot.kernelPackages = pkgs.linuxPackages_hardened;
#  boot.kernelPackages = pkgs.linuxPackages_hardkernel_4_14;
#  boot.kernelPackages = pkgs.linuxPackages_hardkernel_latest;
#  boot.kernelPackages = pkgs.linuxPackages_latest-libre;
#  boot.kernelPackages = pkgs.linuxPackages_latest_hardened;
#  boot.kernelPackages = pkgs.linuxPackages_latest_xen_dom0;
#  boot.kernelPackages = pkgs.linuxPackages_latest_xen_dom0_hardened;
#  boot.kernelPackages = pkgs.linuxPackages_mptcp;
#  boot.kernelPackages = pkgs.linuxPackages_rpi0;
#  boot.kernelPackages = pkgs.linuxPackages_rpi1;
#  boot.kernelPackages = pkgs.linuxPackages_rpi2;
#  boot.kernelPackages = pkgs.linuxPackages_rpi3;
#  boot.kernelPackages = pkgs.linuxPackages_rpi4;
#  boot.kernelPackages = pkgs.linuxPackages_testing;
#  boot.kernelPackages = pkgs.linuxPackages_testing_bcachefs;
#  boot.kernelPackages = pkgs.linuxPackages_testing_hardened;
#  boot.kernelPackages = pkgs.linuxPackages_xen_dom0;
#  boot.kernelPackages = pkgs.linuxPackages_xen_dom0_hardened;
  boot.kernelPackages = pkgs.linuxPackages_zen;
}

