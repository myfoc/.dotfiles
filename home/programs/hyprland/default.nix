{ config, lib, pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    extraConfig  = ''
      monitor=,preferred,auto,auto

      $terminal = foot
      $menu = rofi -show drun

      exec-once = pkill waybar & sleep 0.5 && waybar
      exec-once = swww init & sleep 0.5 && swww img

      env = XCURSOR_SIZE,24
      env = QT_QPA_PLATFORMTHEME,qt5ct

      input {
        kb_layout = us
        kb_variant =
        kb_model =
        kb_options =
        kb_rules =

        follow_mouse = 1

        touchpad {
          natural_scroll = false
        }

        sensitivity = 0
      }

      general {
        gaps_in = 5
        gaps_out = 10
        border_size = 2
        col.active_border = rgba(ffffffff)
        col.inactive_border = rgba(595959aa)

        layout = dwindle

        allow_tearing = false
      }

      decoration {
        rounding = 10

        blur {
          enabled = false
        }

        drop_shadow = false
      }

      animations {
        enabled = true

        bezier = in, 0.5, 1.2, 0.4, 1
        bezier = wss, 0.5, 1.15, 0.4, 1
        bezier = fader, 0.33, 1, 0.68, 1
        bezier = out, 0, 1, 0.6, 1

        animation = windows, 1, 4, in
        animation = border, 1, 10, default
        animation = fade, 1, 7, fader
        animation = workspaces, 1, 5, wss, slide
      }

      dwindle {
        pseudotile = true
        preserve_split = true
      }

      gestures {
        workspace_swipe = false
      }

      misc {
        force_default_wallpaper = -1
      }

      $mainMod = SUPER

      bind = $mainMod, RETURN, exec, $terminal
      bind = $mainMod, Q, killactive,
      bind = $mainMod, M, exit,
      bind = $mainMod, V, togglefloating,
      bind = $mainMod, R, exec, $menu
      bind = $mainMod, P, pseudo,
      bind = $mainMod, J, togglesplit,

      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
    '';
  };
}