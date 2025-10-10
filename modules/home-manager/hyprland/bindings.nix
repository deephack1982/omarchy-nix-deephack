{
  config,
  ...
}: let
  cfg = config.omarchy;
in {
  wayland.windowManager.hyprland.settings = {
    bind =
      cfg.quick_app_bindings
      ++ [
        "SUPER, space, exec, wofi --show drun --sort-order=alphabetical"
        "SUPER SHIFT, SPACE, exec, pkill -SIGUSR1 waybar"
        "SUPER ALT, SPACE, exec, ~/.local/share/omarchy/bin/quickmenu.sh"
        # "SUPER CTRL, SPACE, exec, ~/.local/share/omarchy/bin/swaybg-next"
        # "SUPER SHIFT CTRL, SPACE, exec, ~/.local/share/omarchy/bin/omarchy-theme-next"

        "SUPER, W, killactive,"
        "SUPER, Backspace, killactive,"

        # End active session
        "SUPER, ESCAPE, exec, hyprlock"
        "SUPER SHIFT, ESCAPE, exit,"
        "SUPER CTRL, ESCAPE, exec, reboot"
        "SUPER SHIFT CTRL, ESCAPE, exec, systemctl poweroff"
        "SUPER, K, exec, ~/.local/share/omarchy/bin/omarchy-show-keybindings"

        # Control tiling
        "SUPER, J, togglesplit, # dwindle"
        "SUPER, P, pseudo, # dwindle"
        "SUPER, V, togglefloating,"
        "SUPER, F, fullscreen,"

        # Move focus with mainMod + arrow keys
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"

        "SUPER, comma, workspace, -1"
        "SUPER, period, workspace, +1"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER SHIFT, 9, movetoworkspace, 9"
        "SUPER SHIFT, 0, movetoworkspace, 10"

        # Swap active window with the one next to it with mainMod + SHIFT + arrow keys
        "SUPER SHIFT, left, swapwindow, l"
        "SUPER SHIFT, right, swapwindow, r"
        "SUPER SHIFT, up, swapwindow, u"
        "SUPER SHIFT, down, swapwindow, d"

        # Resize active window
        "SUPER, minus, resizeactive, -100 0"
        "SUPER, equal, resizeactive, 100 0"
        "SUPER SHIFT, minus, resizeactive, 0 -100"
        "SUPER SHIFT, equal, resizeactive, 0 100"

        # Scroll through existing workspaces with mainMod + scroll
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"

        # Super workspace floating layer
        "SUPER, S, togglespecialworkspace, magic"
        "SUPER SHIFT, S, movetoworkspace, special:magic"

        # Grouped windows binds
        "SUPER, Tab, changegroupactive, f"
        "SUPER ALT, left, movewindoworgroup, l"
        "SUPER ALT, right, movewindoworgroup, r"

        # Scratchpad binds
        "SUPER, grave, exec, pypr toggle term"
        "SUPER, T, exec, pypr toggle task"
        "SUPER, Q, exec, pypr toggle timr"

        # More profiles
        "SUPER SHIFT, B, exec, $browser -P Itancan"

        # Screenshots
        ", PRINT, exec, hyprshot -m region -o ~/Pictures/Screenshots"
        "SHIFT, PRINT, exec, hyprshot -m window -o ~/Pictures/Screenshots"
        "CTRL, PRINT, exec, hyprshot -m output -o ~/Pictures/Screenshots"

        # Screen capture
        "SHIFT SUPER, PRINT, exec, wf-recorder -a -c h264_vaapi -d /dev/dri/renderD128 -f ~/Videos/Screencasts/$(date +%Y-%m-%d-%H:%M:%S).mp4"

        # Color picker
        "SUPER, PRINT, exec, hyprpicker -a"

        # Clipse
        "CTRL SUPER, V, exec, ghostty --class=com.markd.clipse -e clipse"
      ];

    bindm = [
      # Move/resize windows with mainMod + LMB/RMB and dragging
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];

    bindel = [
      # Laptop multimedia keys for volume and LCD brightness
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ && pamixer --get-volume > /tmp/wobpipe"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && pamixer --get-volume > /tmp/wobpipe"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && ( pamixer --get-mute && echo 0 > /tmp/wobpipe || pamixer --get-volume > /tmp/wobpipe )"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+ && brightnessctl g | awk -v max=$(brightnessctl m) '{print int($1 / max * 100)}' > /tmp/wobpipe"
      ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%- && brightnessctl g | awk -v max=$(brightnessctl m) '{print int($1 / max * 100)}' > /tmp/wobpipe"
    ];

    bindl = [
      # Requires playerctl
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];
  };
}
