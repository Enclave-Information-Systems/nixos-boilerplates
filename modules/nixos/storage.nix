{configs, ...}:
{
  #Mount Storage Drives
  fileSystems."" = {
    device = "";
    fsType = "ext4";
    options = [ "defaults" "discard" ];
  };
#  fileSystems."" = {
#    device = "";
#    fsType = "btrfs";
#    options = [ "defaults" "discard=async" "noatime" ];
#  };
}
