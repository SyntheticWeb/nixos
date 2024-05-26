{ pkgs, lib, ...}: {
    imports = [
        ./git/gpg.nix
    ];

    gpg.enable = lib.mkDefault true;

}