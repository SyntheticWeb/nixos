{ pkgs, lib, ...}: {
    imports = [
        ./gaming/nvidia.nix
        ./gaming/steam.nix
        ./gaming/proton.nix
        ./gaming/discord.nix
        ./gaming/moonlight.nix
    ];

    nvidia.enable = lib.mkDefault false;
    steam.enable = lib.mkDefault true;
    proton.enable = lib.mkDefault true;
    discord.enable = lib.mkDefault true;
    moonlight.enable = lib.mkDefault true;
}
