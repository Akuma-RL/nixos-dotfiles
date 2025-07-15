{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "vmd" "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "uas" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/1c55618d-b342-4ae4-9f6f-9bbf53b0d692";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/B182-6C63";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/e2431af5-bd22-41fc-930c-ff4d64e40929"; }
    ];

# fileSystems."/run/media/kaladin/Urithiru" =
#   { device = "/dev/disk/by-uuid/e03f168f-8500-45d8-8fc2-72ccb6bb34ba";
#     fsType = "ext4";
#   };

  fileSystems."/run/media/kaladin/Roshar" =
    { device = "/dev/disk/by-uuid/371d3464-e825-4fc5-87aa-4cd31cf89ecc";
      fsType = "ext4";
    };

  fileSystems."/run/media/kaladin/Cosmere" =
    { device = "10.0.0.16:/mnt/Galaxy/Cosmere";
      fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" "x-systemd.after=network-online.target" "x-systemd.mount-timeout=90" ];
    };

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
