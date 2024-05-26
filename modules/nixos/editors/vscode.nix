{lib, config, pkgs, ...}:

let
  cfg = config.vscode;
in
{
    options.vscode = {
        enable = lib.mkEnableOption "enable vscode";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            (vscode-with-extensions.override {
                vscodeExtensions = with vscode-extensions; [
                    bbenoist.nix
                    tamasfe.even-better-toml
                    vscodevim.vim
                    rust-lang.rust-analyzer
                    enkia.tokyo-night
                ];
            })
        ];
    };
}