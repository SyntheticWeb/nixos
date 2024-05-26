{ pkgs, lib, ...}: {
    imports = [
        ./fonts/nerdfonts.nix
    ];

    nerdfonts.enable = lib.mkDefault true;

}