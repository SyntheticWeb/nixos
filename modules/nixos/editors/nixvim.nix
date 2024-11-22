{ lib, config, pkgs, inputs, ... }:


let
  cfg = config.nixvim;
in
{
  imports = [

    inputs.nixvim.nixosModules.nixvim

  ];


  options.nixvim = {
    enable = lib.mkEnableOption "enable nixvim";
  };

  config = lib.mkIf cfg.enable {

    programs.nixvim = {
      enable = true;
      imports = [ inputs.Neve.nixvimModule ];

      colorschemes.catppuccin.enable = lib.mkForce false;

      colorschemes.dracula.enable = true;


    };
  };
}
