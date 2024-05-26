{lib, config, pkgs, ...}:

let
  cfg = config.proton;
in
{
    options.proton = {
        enable = lib.mkEnableOption "enable proton";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            protonup
        ];

        environment.sessionVariables = {
            STEAM_EXTRA_COMPAT_TOOLS_PATHS = 
              "/home/rtsnow/.steam/root/compatibilitytools.d";
        };
    };
}