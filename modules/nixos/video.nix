{ pkgs, lib, ... }: {
  imports = [
    ./video/webcamoid.nix
    ./video/obs.nix
  ];

  webcamoid.enable = lib.mkDefault false;
  obs.enable = lib.mkDefault false;

}
