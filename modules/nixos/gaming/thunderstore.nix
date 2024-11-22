{ lib, config, pkgs, ... }:

let
  cfg = config.thunderstore;
in
{
  options.thunderstore = {
    enable = lib.mkEnableOption "enable thunderstore";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      r2modman
    ];

  };
}
