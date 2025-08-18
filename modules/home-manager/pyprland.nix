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
        command = "ghostty"
        class = "com.mitchellh.ghostty"
        size = "80% 40%"
        multi = false
      '';
    };
  };
}
