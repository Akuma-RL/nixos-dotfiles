{ config, pkgs, ... }:

{

boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

time.timeZone = "America/Los_Angeles";

 steam ={
  enable = true;
  remotePlay.openFirewall = false;
  dedicatedServer.openFirewall = false;
  localNetworkGameTransfers.openFirewall = false;
 };

 environment.systemPackages = with pkgs; [
  btop
  git
  neovim
  nfs-utils
  wget
 ];
}
