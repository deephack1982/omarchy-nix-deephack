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
        command = "ghostty --title=scratchpad --class=com.markd.scratch"
        class = "com.markd.scratch"
        size = "80% 40%"
        animation = "fromTop"
      '';
    };
  };
}
