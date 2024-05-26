{lib, config, pkgs, ...}:

let
  cfg = config.obsidian;
in
{
    options.obsidian = {
        enable = lib.mkEnableOption "enable obsidian";
    };

    config = lib.mkIf cfg.enable {

        environment.systemPackages = with pkgs; [
            obsidian
        ];

    };
}