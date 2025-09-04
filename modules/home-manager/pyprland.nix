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
        command = "ghostty --title=scratchpad --class=com.markd.termscratch"
        class = "com.markd.termscratch"
        size = "80% 40%"
        animation = "fromTop"

        [scratchpads.task]
        command = "ghostty --title=scratchpad --class=com.markd.taskscratch -e taskwarrior-tui"
        class = "com.markd.taskscratch"
        size = "50% 90%"
        animation = "fromRight"

        [scratchpads.timr]
        command = "ghostty --title=scratchpad --class=com.markd.timrscratch -e timr-tui --notification on --blink on"
        class = "com.markd.timrscratch"
        size = "40% 40%"
        position = "2% 2%"
        animation = "fromLeft"
      '';
    };
  };
}
