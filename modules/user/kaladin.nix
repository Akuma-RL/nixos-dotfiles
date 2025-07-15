{config, pkgs, ...}:

{
 users.users.kaladin = {
  isNormalUser = true;
  extraGroups = [ "wheel" ];
  packages = with pkgs; [
   tree
  ];
 };
}
