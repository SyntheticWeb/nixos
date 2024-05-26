{lib, config, pkgs, ...}:

let
  cfg = config.moonlight;
in
{
    options.moonlight = {
        enable = lib.mkEnableOption "enable moonlight";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            moonlight-qt
        ];

        environment.sessionVariables = {
            SDL_AUDIODRIVER = "pulse";
        };
    };
}