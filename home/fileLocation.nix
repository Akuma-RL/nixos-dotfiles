{ config, pkgs, ... }:

{
 home.file = {
  ".config/alacritty".source = ./apps/alacritty;

  ".config/bat".source = ./apps/bat;

  ".config/nvim".source = ./apps/nvim;

  ".config/qtile".source = ../modules/system/desktops/qtile;

 };
}
