{
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "uwsm-app -- hyprsunset"
      "uwsm-app -- wl-clip-persist --clipboard regular"
      "uwsm-app -- clipse -listen"
      "mkfifo -m 600 /tmp/wobpipe"
      "tail -f /tmp/wobpipe | wob"
      "uwsm-app -- pypr --debug /tmp/pypr.log"
      "uwsm-app -- keepassxc --minimized"
      "uwsm-app -- waybar"
    ];

    # exec = [
    # ];
  };
}
