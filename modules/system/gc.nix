{ config, pkgs, lib, ... }:

{
 systemd.services.nix-gc-clean = {
  description = "Nix GC: Keep only the last 5 generations";
  serviceConfig = {
   Type = "oneshot";
   ExecStart = "${pkgs.nix}/bin/nix-env --delete-generations +5 --profile /nix/var/nix/profiles/system";
  };
 };

 systemd.timers.nix-gc-clean = {
  description = "Run nix GC every day, keeping only 5 generations";
  wantedBy = [ "timers.target" ];
  timerConfig = {
   OnCalendar = "daily";
   Persistent = true;
  };
 };
}
