{
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "hyprsunset"
      "wl-clip-persist --clipboard regular"
      "clipse -listen"
      "mkfifo -m 600 /tmp/wobpipe"
      "tail -f /tmp/wobpipe | wob"
      "pypr --debug /tmp/pypr.log"
      "uwsm-app -- keepassxc --minimized"
    ];

    # exec = [
    # ];
  };
}
