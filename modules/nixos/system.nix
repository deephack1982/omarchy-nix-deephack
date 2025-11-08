
{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.omarchy;
  packages = import ../packages.nix {inherit pkgs lib; exclude_packages = cfg.exclude_packages;};
in {
  environment.systemPackages = packages.systemPackages;
  networking.wireless.iwd.enable = true;
}
