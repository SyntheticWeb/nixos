{lib, config, pkgs, ...}:

let
  cfg = config.nvidia;
in
{
    options.nvidia = {
        enable = lib.mkEnableOption "enable nvidia drivers";
    };

    config = lib.mkIf cfg.enable {
        hardware.opengl = {
            enable = true;
            driSupport = true;
            driSupport32Bit =true;
        };

        services.xserver.videoDrivers = ["nvidia"];
        hardware.nvidia.modesetting.enable = true;

    };


}