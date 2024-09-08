{ pkgs, lib, ...}: {
    imports = [
        ./gaming/nvidia.nix
        ./gaming/steam.nix
        ./gaming/proton.nix
        ./gaming/discord.nix
        ./gaming/moonlight.nix
    ];

    nvidia.enable = lib.mkDefault false;
    steam.enable = lib.mkDefault false;
    proton.enable = lib.mkDefault false;
    discord.enable = lib.mkDefault false;
    moonlight.enable = lib.mkDefault false;
}
