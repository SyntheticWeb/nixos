{ pkgs, lib, ...}: {
    imports = [
        ./editors/vscode.nix
        ./editors/obsidian.nix
        ./editors/nixvim.nix
        ./editors/lazyvim.nix
    ];

    vscode.enable = lib.mkDefault false;
    obsidian.enable = lib.mkDefault false;
    nixvim.enable = lib.mkDefault false;
    lazyvim.enable = lib.mkDefault false;

}
