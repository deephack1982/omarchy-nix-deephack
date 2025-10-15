{
  config,
  pkgs,
  ...
}: {
  home.file = {
    ".config/hypr/pyprland.toml" = {
      text = ''
        [pyprland]
        plugins = [ "scratchpads" ]

        [scratchpads.term]
        command = "kitty --title=scratchpad --class=com.markd.termscratch bash"
        class = "com.markd.termscratch"
        size = "80% 40%"
        animation = "fromTop"

        [scratchpads.task]
        command = "kitty --title=scratchpad --class=com.markd.taskscratch taskwarrior-tui"
        class = "com.markd.taskscratch"
        size = "50% 90%"
        animation = "fromRight"

        [scratchpads.timr]
        command = "kitty --title=scratchpad --class=com.markd.timrscratch timr-tui --notification on --blink on"
        class = "com.markd.timrscratch"
        size = "40% 40%"
        position = "1% 3%"
        animation = "fromLeft"
      '';
    };
  };
}
