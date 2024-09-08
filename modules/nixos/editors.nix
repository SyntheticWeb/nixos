{ pkgs, lib, ...}: {
    imports = [
        ./editors/vscode.nix
        ./editors/obsidian.nix
        ./editors/nixvim.nix
    ];

    vscode.enable = lib.mkDefault false;
    obsidian.enable = lib.mkDefault false;
    nixvim.enable = lib.mkDefault false;

}
