{ config, pkgs, ... }:

{
 networking.hostName = "roshar";
 networking.networkmanager.enable = true;

 services.openssh.enable = true;
}
