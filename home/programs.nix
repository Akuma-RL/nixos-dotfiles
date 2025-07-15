{config, pkgs, ... }:
let
 myAliases = {
  nrs = "sudo nixos-rebuild switch";
  nrsf = "sudo nixos-rebuild switch --flake";
  nfu = "nix flake update";
  hmsf = "home-manager switch --flake";
 };
in
{
programs = {

 bash = {
   enable = true;
   shellAliases = myAliases;
  };

#steam ={
# enable = true;
# remotePlay.openFirewall = false;
# dedicatedServer.openFirewall = false;
# localNetworkGameTransfers.openFirewall = false;
#};


 zsh = {
  enable = true;
  shellAliases = myAliases;
 };
};

}
