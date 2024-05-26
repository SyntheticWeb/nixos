{lib, config, pkgs, ...}:

let
  cfg = config.tmux;
in
{
    options.tmux = {
        enable = lib.mkEnableOption "enable tmux";
    };

    config = lib.mkIf cfg.enable {
        programs.tmux = {
            enable = true;
        };

        programs.tmux.plugins = [
            pkgs.tmuxPlugins.yank
            pkgs.tmuxPlugins.sensible
            pkgs.tmuxPlugins.vim-tmux-navigator
            pkgs.tmuxPlugins.nord
        ];
    };
}