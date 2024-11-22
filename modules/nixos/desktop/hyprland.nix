{ inputs, lib, config, pkgs, ... }:

let
  cfg = config.hyprland;
in
{
  options.hyprland = {
    enable = lib.mkEnableOption "enable hyprland";
  };

  config = lib.mkIf cfg.enable {


    # Enable polkit
    security.polkit.enable = true;

    # Call dbus-update-activation-environment on login
    services.xserver.updateDbusEnvironment = true;

    # Enables support for Bluetooth
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    xdg.portal.enable = true;

    # Enable Bluetooth support
    services.blueman.enable = true;

    # Enable Hyprland
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    programs.dconf.enable = true;

    # Enable Ozone Wayland support in Chromium and Electron based applications
    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
    };

    # List of Hyprland specific packages
    environment.systemPackages = with pkgs; [

      kdePackages.dolphin # File Manager

      rofi-wayland # Menus

      waybar # Status bar

      gtk4
      tokyonight-gtk-theme
      xfce.thunar

      brightnessctl
      grim
      hypridle
      kitty
      hyprlock
      hyprpaper
      libnotify
      networkmanagerapplet
      slurp
      swappy
      tesseract
      wf-recorder
      wl-clipboard
      wlr-randr
      wlsunset
      libsForQt5.qt5ct
      vlc

      libsForQt5.gwenview
      dunst # notifications

      ffmpeg-full
    ];

  };
}
