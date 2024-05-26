{ pkgs, lib, ...}: {
    imports = [
        ./desktop/hyprland.nix
        ./desktop/xfcei3.nix
        ./desktop/gnome.nix
    ];

    xfcei3.enable = lib.mkDefault false;
    hyprland.enable = lib.mkDefault true;
    gnome.enable = lib.mkDefault false;

}