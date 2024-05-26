{lib, config, pkgs, ...}:

let
  cfg = config.gpg;
in
{
    options.gpg = {
        enable = lib.mkEnableOption "enable gpg";
    };

    config = lib.mkIf cfg.enable {
        programs.gnupg.agent.enable = true;
    };
}