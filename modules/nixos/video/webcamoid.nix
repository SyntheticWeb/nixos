{ lib, config, pkgs, ... }:

let
  cfg = config.webcamoid;
in
{
  options.webcamoid = {
    enable = lib.mkEnableOption "enable webcamoid";
  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      webcamoid
    ];
  };
}
