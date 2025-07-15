{ config, lib, pkgs, modulesPath, ... }:

{
 fileSystems."/run/media/kaladin/Cosmere" =
  { device = "10.0.0.16:/mnt/Galaxy/Cosmere";
     fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" "x-systemd.after=network-online.target" "x-systemd.mount-timeout=90" ];
  };
}
