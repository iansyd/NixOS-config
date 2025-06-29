{
  # Other filesystems - Windows
  fileSystems."/mnt/win" = {
    device = "/dev/disk/by-uuid/942A0C192A0BF750";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "uid=ian"
      "noauto"
    ];
  };
}
