{ lib, config, pkgs, ... }:

let
  cfg = config.obs;
in
{
  options.obs = {
    enable = lib.mkEnableOption "enable obs";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      (pkgs.wrapOBS {
        plugins = with pkgs.obs-studio-plugins; [
          wlrobs
          obs-backgroundremoval
          obs-pipewire-audio-capture
        ];
      })
    ];
  };
}
