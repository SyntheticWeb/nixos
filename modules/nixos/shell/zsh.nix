{lib, config, pkgs, ...}:

let
  cfg = config.zsh;
in
{
    options.zsh = {
        enable = lib.mkEnableOption "enable zsh";
    };

    config = lib.mkIf cfg.enable {

        # for global user
        users.defaultUserShell=pkgs.zsh; 

        # For a specific user
        users.users.rtsnow.shell = pkgs.zsh; 

        # enable zsh and oh my zsh
        programs = {
            zsh = {
                enable = true;
                autosuggestions.enable = true;
                zsh-autoenv.enable = true;
                syntaxHighlighting.enable = true;
                ohMyZsh = {
                        enable = true;
                        theme = "robbyrussell";
                        plugins = [
                        "git"
                        "history"
                        "rust"
                        ];
                    };
                };
            };
    };
}