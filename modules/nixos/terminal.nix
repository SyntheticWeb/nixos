{ pkgs, lib, ...}: {
    imports = [
        ./terminal/alacritty.nix
        ./terminal/tmux.nix
    ];

    alacritty.enable = lib.mkDefault true;
    tmux.enable = lib.mkDefault true;

}