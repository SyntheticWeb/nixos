{ pkgs, lib, ...}: {
    imports = [
        ./desktop/hyprland.nix
        ./desktop/xfcei3.nix
        ./desktop/gnome.nix
    ];

    xfcei3.enable = lib.mkDefault false;
    hyprland.enable = lib.mkDefault false;
    gnome.enable = lib.mkDefault false;

}