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

        hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "555.42.02";
        sha256_64bit = "sha256-k7cI3ZDlKp4mT46jMkLaIrc2YUx1lh1wj/J4SVSHWyk=";
        sha256_aarch64 = "sha256-rtDxQjClJ+gyrCLvdZlT56YyHQ4sbaL+d5tL4L4VfkA=";
        openSha256 = "sha256-rtDxQjClJ+gyrCLvdZlT56YyHQ4sbaL+d5tL4L4VfkA=";
        settingsSha256 = "sha256-rtDxQjClJ+gyrCLvdZlT56YyHQ4sbaL+d5tL4L4VfkA="; 
        persistencedSha256 = lib.fakeSha256;
        };

        services.xserver.videoDrivers = ["nvidia"];
        hardware.nvidia.modesetting.enable = true;

    };


}