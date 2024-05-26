{lib, config, pkgs, ...}:

let
  cfg = config.steam;
in
{
    options.steam = {
        enable = lib.mkEnableOption "enable steam";
    };

    config = lib.mkIf cfg.enable {
        programs.steam.enable = true;
        programs.steam.gamescopeSession.enable = true;

        environment.systemPackages = with pkgs; [
            mangohud
        ];

        programs.gamemode.enable = true;

    };
}