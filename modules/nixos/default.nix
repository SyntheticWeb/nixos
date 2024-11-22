{ pkgs, lib, ... }: {
  imports = [
    ./gaming.nix
    ./terminal.nix
    ./languages.nix
    ./fonts.nix
    ./desktop.nix
    ./editors.nix
    ./audio.nix
    ./shell.nix
    ./git.nix
    ./video.nix
  ];
}
