{lib, config, pkgs, ...}:

let
  cfg = config.alacritty;
in
{
    options.alacritty = {
        enable = lib.mkEnableOption "enable alacritty";
    };

    config = lib.mkIf cfg.enable {

        environment.systemPackages = with pkgs; [
            alacritty
        ];
    };
}