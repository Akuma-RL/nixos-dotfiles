{ config, pkgs, ... }:

{
 imports = [
  ../modules/hardware/fileSystems.nix
  ../modules/hardware/nvidia.nix
  
  ../modules/system/fonts.nix
  ../modules/system/network.nix
  ../modules/system/sysPackages.nix
  ../modules/system/gc.nix

  ../modules/system/desktops/cinnamon.nix

  ../modules/user/kaladin.nix
];

system.stateVersion = "25.05";

nixpkgs.config.allowUnfree = true;

nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
