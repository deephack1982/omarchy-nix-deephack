lib: {
  omarchyOptions = {
    full_name = lib.mkOption {
      type = lib.types.str;
      description = "Main user's full name";
    };
    email_address = lib.mkOption {
      type = lib.types.str;
      description = "Main user's email address";
    };
    theme = lib.mkOption {
      type = lib.types.either (lib.types.enum [
        "tokyo-night"
        "kanagawa"
        "everforest"
        "catppuccin"
        "nord"
        "gruvbox"
        "gruvbox-light"
        "generated_light"
        "generated_dark"
      ]) lib.types.str;
      default = "tokyo-night";
      description = "Theme to use for Omarchy configuration";
    };
    theme_overrides = lib.mkOption {
      type = lib.types.submodule {
        options = {
          wallpaper_path = lib.mkOption {
            type = lib.types.nullOr lib.types.path;
            default = null;
            description = "Path to the wallpaper image to extract colors from";
          };
        };
      };
      default = {};
      description = "Theme overrides including wallpaper path for generated themes";
    };
    primary_font = lib.mkOption {
      type = lib.types.str;
      default = "Liberation Sans 11";
    };
    vscode_settings = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
    monitors = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
    };
    scale = lib.mkOption {
      type = lib.types.int;
      default = 2;
      description = "Display scale factor (1 for 1x displays, 2 for 2x displays)";
    };
    quick_app_bindings = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      description = "A list of single keystroke key bindings to launch common apps.";
      default = [
        "SUPER, C, exec, $webapp https://app.hey.com/calendar/weeks/"
        "SUPER, E, exec, $webapp https://app.hey.com"
        "SUPER, Y, exec, $webapp https://youtube.com/"
        "SUPER SHIFT, G, exec, $webapp https://web.whatsapp.com/"

        "SUPER, return, exec, $terminal"
        "SUPER SHIFT, F, exec, $fileManager"
        "SUPER, B, exec, $browser"
        "SUPER, M, exec, $webapp=https://music.youtube.com"
        "SUPER, N, exec, $editor"
        "SUPER, G, exec, $messenger"
        "SUPER, slash, exec, $passwordManager"
      ];
    };
    exclude_packages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [];
      description = "Packages to exclude from the default system packages";
    };
    terminal = lib.mkOption {
      type = lib.types.str;
      description = "Terminal invocation to use";
    };
    editor = lib.mkOption {
      type = lib.types.str;
      description = "Editor invocation to use";
    };
    browser = lib.mkOption {
      type = lib.types.str;
      default = "firefox";
      decsription = "Browser invocation to use";
    };
    kb_layout = lib.mkOption {
      type = lib.types.str;
      description = "Keyboard layout in Hyprland";
    };
  };
}
