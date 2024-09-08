{ pkgs, lib, ...}: {
    imports = [
        ./languages/rust.nix
        ./languages/crelated.nix
        ./languages/godot.nix
        ./languages/go.nix
    ];

    rust.enable = lib.mkDefault false;
    crelated.enable = lib.mkDefault false;
    godot.enable = lib.mkDefault false;
    go.enable = lib.mkDefault false;

}