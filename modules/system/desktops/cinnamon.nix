{ config, lib, pkgs, ... }:

{
 services = {

  xserver = {
   enable = true;
   videoDrivers = ["nvidia"];

   desktopManager = {
    cinnamon.enable = true;
   };

   displayManager = {
    lightdm.enable = true;
    defaultSession = "cinnamon";
   };
  };


   libinput = {
    enable = true;
    mouse = {
     accelProfile = "flat";
     accelSpeed = "0";
    };
   };

 }; 

}
