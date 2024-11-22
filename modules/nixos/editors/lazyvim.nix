{ lib, config, pkgs, ... }:

let
  cfg = config.lazyvim;
in
{
  options.lazyvim = {
    enable = lib.mkEnableOption "enable lazyvim";
  };

  config = lib.mkIf cfg.enable {
    # System-wide packages needed for LazyVim
    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    environment.systemPackages = with pkgs; [
        gopls
        rust-analyzer
        nil
        bash-language-server
        ripgrep
      ];
  };
}