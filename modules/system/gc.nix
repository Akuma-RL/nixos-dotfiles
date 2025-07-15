{ config, pkgs, lib, ... }:

{
  systemd.services.nix-gc-clean = {
    description = "Nix GC: keep only last 5 generations and clean store";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.writeShellScript "nix-gc-clean" ''
        ${pkgs.nix}/bin/nix-env --delete-generations +5 --profile /nix/var/nix/profiles/system
        ${pkgs.nix}/bin/nix-collect-garbage -d
      ''}";
    };
  };

  systemd.timers.nix-gc-clean = {
    description = "Run nix GC daily";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
    };
  };

  nix.settings.auto-optimise-store = true;
}
