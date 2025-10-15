{
  config,
  ...
}: let
  cfg = config.omarchy;
  # palette = config.colorScheme.palette;
in {
  programs.kitty = {
    enabled = true;
    shellIntegration.enableBashIntegration = true;
    enableGitIntegration = true;
    themeFile = "tokyo_night_night";
    settings = {
      font_family = cfg.primary_font;
      font_size = 14;
    };
  };
}
