{lib, config, pkgs, ...}:

let
  cfg = config.rust;
in
{
    options.rust = {
        enable = lib.mkEnableOption "enable rust";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            rustup
        ];
    };
}