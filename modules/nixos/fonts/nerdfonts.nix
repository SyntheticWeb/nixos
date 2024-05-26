{lib, config, pkgs, ...}:

let
  cfg = config.nerdfonts;
in
{
    options.nerdfonts = {
        enable = lib.mkEnableOption "enable nerdfonts";
    };

    config = lib.mkIf cfg.enable {
        fonts.packages = with pkgs; [
            (nerdfonts.override { fonts = ["FiraCode" ];})
            fira-code
            fira-code-symbols
        ];
    };
}