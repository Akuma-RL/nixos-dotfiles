{ config, pkgs, ... }:
{
 nixpkgs = {
  config = {
   allowUnfree = true;
   allowUnfreePredicate = true;
  };
 };

 home.username = "kaladin";
 home.homeDirectory = "/home/kaladin";
 home.stateVersion = "25.05";
 home.sessionVariables = {
  EDITOR = "nvim";
 };

 home.packages = with pkgs; [
  alacritty
  bat
  davinci-resolve-studio
  darktable
  discord
  feh
  ffmpeg
  firefox
  gcc
  htop
  libreoffice-qt6-fresh
  mlv-app
  mpv
  neofetch
  nodejs
  nodePackages.npm
  obs-studio
  steam
 ];

 imports = [
  ./programs.nix
  ./fileLocation.nix
 ];

 programs.home-manager.enable = true;
}
