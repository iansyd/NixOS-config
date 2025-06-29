{
  # Other filesystems - OpenSUSE Tumbleweek
  fileSystems."/mnt/tw" = {
    device = "/dev/disk/by-uuid/747cd249-f9d8-4f1f-8643-85b2a3cd756b";
    fsType = "btrfs";
    options = [ "noauto" ];
  };

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
