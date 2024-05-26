{lib, config, pkgs, ...}:

let
  cfg = config.module;
in
{
    options.module = {
        enable = lib.mkEnableOption "enable module";
        example = lib.mkOption {
            default = "default";
            description = ''
              default description
            '';
        };
    };

    config = lib.mkIf cfg.enable {
        #.${cfg.example} = {
            example = true;
        };
    };
}