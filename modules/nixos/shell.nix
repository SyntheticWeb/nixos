{ pkgs, lib, ...}: {
    imports = [
        ./shell/zsh.nix
    ];

    zsh.enable = lib.mkDefault true;

}