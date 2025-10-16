{
  config,
  ...
}: let
  cfg = config.omarchy;
  # palette = config.colorScheme.palette;
in {
  programs.kitty = {
    enable = true;
    shellIntegration.enableBashIntegration = true;
    enableGitIntegration = true;
    themeFile = "tokyo_night_night";
    settings = {
      font_family = cfg.primary_font;
      font_size = 14;
      cursor_trail = 10;
      cursor_trail_decay = "0.1 0.4";
      cursor_trail_start_threshold = 2;
      cursor_trail_color = "orange";
    };
  };
}
