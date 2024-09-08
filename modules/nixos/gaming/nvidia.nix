{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.nvidia;
in
{
  options.nvidia = {
    enable = lib.mkEnableOption "enable nvidia drivers";
  };

  config = lib.mkIf cfg.enable {
    hardware.graphics = {
      enable = true;
    };

    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.modesetting.enable = true;

    hardware.nvidia.nvidiaSettings = true;


    hardware.nvidia.open = false;

    hardware.opengl = {
      enable = true;
    };

  };

}

