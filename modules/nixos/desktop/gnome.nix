{lib, config, pkgs, ...}:

let
  cfg = config.gnome;
in
{
    options.gnome = {
        enable = lib.mkEnableOption "enable gnome";
    };

    config = lib.mkIf cfg.enable {

        # Enables support for Bluetooth
        hardware.bluetooth = {
            enable = true;
            powerOnBoot = true;
        };

        # Enable Bluetooth support
        services.blueman.enable = true;

        # Enable Ozone Wayland support in Chromium and Electron based applications
        environment.sessionVariables = {
            NIXOS_OZONE_WL = "1";
            QT_QPA_PLATFORMTHEME = "qt5ct";
            QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        };
  
      services.xserver = {
        enable = true;
        displayManager.gdm = { 
          enable = true;
          wayland = true;
        };
        desktopManager.gnome.enable = true;
      };

      programs.dconf.enable = true;

      environment.systemPackages = with pkgs; [
          waybar
          wayland
          fastfetch
          gnomeExtensions.pop-shell
          gnomeExtensions.appindicator
          libsForQt5.qt5ct  
          gnome.gnome-tweaks
      ];  

      programs.waybar.enable = true;

      services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

    };
}