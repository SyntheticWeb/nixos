{lib, config, pkgs, ...}:

let
  cfg = config.noisetorch;
in
{
    options.noisetorch = {
        enable = lib.mkEnableOption "enable noisetorch";
    };

    config = lib.mkIf cfg.enable {

        programs.noisetorch.enable = true;

    };
}