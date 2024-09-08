{lib, config, pkgs, ...}:

let
  cfg = config.go;
in
{
    options.go = {
        enable = lib.mkEnableOption "enable go";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            go
        ];
    };
}