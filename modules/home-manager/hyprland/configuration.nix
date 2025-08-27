{
  config,
  lib,
  ...
}: let
  cfg = config.omarchy;
in {
  imports = [
    ./autostart.nix
    ./bindings.nix
    ./envs.nix
    ./input.nix
    ./looknfeel.nix
    ./windows.nix
  ];
  wayland.windowManager.hyprland.settings = {
    # Default applications
    "$terminal" = lib.mkDefault "ghostty";
    "$fileManager" = lib.mkDefault "nautilus --new-window";
    "$browser" = lib.mkDefault "firefox";
    "$music" = lib.mkDefault "spotify";
    "$passwordManager" = lib.mkDefault "keepassxc";
    "$messenger" = lib.mkDefault "signal-desktop";
    "$webapp" = lib.mkDefault "$browser -P Webapp ";

    monitor = cfg.monitors;
  };
}
