{config, pkgs, ... }:
{
# Enable OpenGL
  hardware = {
   graphics = {
    enable = true;
   };
   nvidia = {
    modesetting = {
     enable = true;
    };
    powerManagement = {
     enable = true;
     finegrained = false; 
    };
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
   };
  };
}
