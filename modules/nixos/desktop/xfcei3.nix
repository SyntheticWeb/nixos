{lib, config, pkgs, ...}:

let
  cfg = config.xfcei3;
in
{
    options.xfcei3 = {
        enable = lib.mkEnableOption "enable xfcei3";
    };

    config = lib.mkIf cfg.enable {
        services.xserver = {
            enable = true;
            desktopManager = {
                xterm.enable = false;
                xfce = {
                    enable = true;
                    noDesktop = true;
                    enableXfwm = false;
                };
            };
            displayManager.defaultSession = "xfce+i3";
            windowManager.i3 = {
                enable = true;
                extraPackages = with pkgs; [
                    dmenu
                    i3status
                    i3lock
                    i3blocks
                ];
            };

            # Configure keymap in X11
            layout = "us";
            xkbVariant = "";
        };

        environment.systemPackages = with pkgs; [
            polybar
            fastfetch
        ];
    };
}

