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

 zsh = {
  enable = true;
  shellAliases = myAliases;
 };
};

}
