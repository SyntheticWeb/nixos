{lib, config, pkgs, ...}:

let
  cfg = config.discord;
in
{
    options.discord = {
        enable = lib.mkEnableOption "enable discord";
    };

    config = lib.mkIf cfg.enable {

        environment.systemPackages = with pkgs; [
            (discord.override {
                withOpenASAR = true;
                withVencord = true;
            })           
            vesktop
        ];



    };
}