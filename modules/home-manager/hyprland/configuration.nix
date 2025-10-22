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
    "$terminal" = lib.mkDefault cfg.terminal;
    "$fileManager" = lib.mkDefault "nautilus --new-window";
    "$browser" = lib.mkDefault cfg.browser;
    "$music" = lib.mkDefault "spotify";
    "$passwordManager" = lib.mkDefault "keepassxc";
    "$messenger" = lib.mkDefault "signal-desktop";
    "$webapp" = lib.mkDefault "$browser -P Webapp ";
    "$editor" = lib.mkDefault cfg.editor;

    monitor = cfg.monitors;
  };
}
