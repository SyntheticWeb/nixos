{lib, config, pkgs, ...}:

let
  cfg = config.crelated;
in
{
    options.crelated = {
        enable = lib.mkEnableOption "enable crelated";
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            gcc
            clang
            llvmPackages.mlir
            pkg-config
        ];
    };
}