{
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "hyprsunset"
      "systemctl --user start hyprpolkitagent"
      "wl-clip-persist --clipboard regular"
      "clipse -listen"
      "mkfifo -m 600 /tmp/wobpipe"
      "tail -f /tmp/wobpipe | wob"
      "pypr --debug /tmp/pypr.log"
      "keepassxc --minimized"
    ];

    exec = [
      "killall waybar && waybar"
    ];
  };
}
