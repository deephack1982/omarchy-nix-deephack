{
  lib,
  config,
  ...
}: let
  cfg = config.omarchy;
in {
  wayland.windowManager.hyprland.settings = {
    # Environment variables
    # https://wiki.hyprland.org/Configuring/Variables/#input
    input = lib.mkDefault {
      kb_layout = cfg.kb_layout   ;
      # kb_variant =
      # kb_model =
      kb_options = compose:caps;
      # kb_rules =

      follow_mouse = 1;

      sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

      touchpad = {
        natural_scroll = true;
      };
      cursor = {
        hide_on_keypress = true;
        inactive_timeout = 5;
      };
    };

    # https://wiki.hyprland.org/Configuring/Variables/#gestures
    gesture = lib.mkDefault [
      "3, horizontal, workspace"
      "3, down, special, magic"
    ];
  };
}
