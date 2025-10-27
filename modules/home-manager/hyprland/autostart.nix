{
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "uwsm-app -- hyprsunset"
      "wl-clip-persist --clipboard regular"
      "clipse -listen"
      "mkfifo -m 600 /tmp/wobpipe"
      "tail -f /tmp/wobpipe | wob"
      "pypr --debug /tmp/pypr.log"
      "uwsm-app -- keepassxc --minimized"
      "uwsm-app -- waybar"
    ];

    # exec = [
    # ];
  };
}
