{ pkgs, lib, ...}: {
    imports = [
        ./languages/rust.nix
        ./languages/crelated.nix
    ];

    rust.enable = lib.mkDefault true;
    crelated.enable = lib.mkDefault true;

}