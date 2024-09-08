{lib, config, pkgs, ...}:

let
  cfg = config.godot;
in
{
    options.godot = {
        enable = lib.mkEnableOption "enable godot";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            godot_4
        ];
    };
}