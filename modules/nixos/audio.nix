{ pkgs, lib, ...}: {
    imports = [
        ./audio/pipewire.nix
        ./audio/noisetorch.nix
    ];

    pipewire.enable = lib.mkDefault true;
    noisetorch.enable = lib.mkDefault true;

}