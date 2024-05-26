{ pkgs, lib, ...}: {
    imports = [
        ./editors/vscode.nix
        ./editors/obsidian.nix
    ];

    vscode.enable = lib.mkDefault true;
    obsidian.enable = lib.mkDefault true;

}