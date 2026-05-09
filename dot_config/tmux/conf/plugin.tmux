set-environment -g TMUX_PLUGIN_MANAGER_PATH "${HOME}/.local/share/tmux/plugins"

# Auto-install TPM if it doesn't exist
if "test ! -d ~/.local/share/tmux/plugins/tpm" \
   "run 'git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm && ~/.local/share/tmux/plugins/tpm/bin/install_plugins'"

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'tmux-plugins/tmux-battery'
set -g @plugin 'joshmedeski/tmux-nerd-font-window-name'
set -g @plugin 'catppuccin/tmux#v2.3.0'

set -g @continuum-restore 'on'

#Configure the catppuccin plugin
set -g @catppuccin_flavor "mocha"

run "~/.local/share/tmux/plugins/tmux-battery/battery.tmux"
run "~/.local/share/tmux/plugins/tmux/catppuccin.tmux"

#Left Status
set -g status-left-length 100
set -g status-left "#{E:@catppuccin_status_session}"

#Right
# set -ag status-right "#{E:@catppuccin_status_uptime}"

set -g status-right-length 100
# set -g status-right "#{E:@catppuccin_status_directory}"
set -gF status-right '#{E:@catppuccin_status_battery}'
set -ag status-right "#{E:@catppuccin_status_uptime}"
set -ag status-right '#{E:@catppuccin_status_date_time}'

#Panes setting
set -g @catppuccin_pane_status_enabled "yes" # set to "yes" to enable
set -g @catppuccin_pane_border_status "yes" # set to "yes" to enable
set -g @catppuccin_pane_border_style "fg=#{@thm_overlay_0}"
set -g @catppuccin_pane_active_border_style "##{?pane_in_mode,fg=#{@thm_lavender},##{?pane_synchronized,fg=#{@thm_mauve},fg=#{@thm_lavender}}}"
set -g @catppuccin_pane_left_separator "█"
set -g @catppuccin_pane_middle_separator "█"
set -g @catppuccin_pane_right_separator "█"
set -g @catppuccin_pane_color "#{@thm_green}"
set -g @catppuccin_pane_background_color "#{@thm_surface_0}"
set -g @catppuccin_pane_default_text "##{b:pane_current_path}"
set -g @catppuccin_pane_default_fill "number"
set -g @catppuccin_pane_number_position "left" # right, left

#Windows
set -g @catppuccin_window_status_style "custom" # basic, rounded, slanted, custom, or none
set -g @catppuccin_window_text_color "#{@thm_surface_0}"
set -g @catppuccin_window_number_color "#{@thm_overlay_2}"
set -g @catppuccin_window_text "#W"
set -g @catppuccin_window_number "#I"
set -g @catppuccin_window_current_text_color "#{@thm_surface_1}"
set -g @catppuccin_window_current_number_color "#{@thm_mauve}"
set -g @catppuccin_window_current_text "#W"
set -g @catppuccin_window_current_number "#I"
set -g @catppuccin_window_number_position "right"
set -g @catppuccin_window_flags "icon" # none, icon, or text
set -g @catppuccin_window_flags_icon_last " " # -
set -g @catppuccin_window_flags_icon_current " " # *
set -g @catppuccin_window_flags_icon_zoom " " # Z
set -g @catppuccin_window_flags_icon_mark " " # M
set -g @catppuccin_window_flags_icon_silent " " # ~
set -g @catppuccin_window_flags_icon_activity " " # #
set -g @catppuccin_window_flags_icon_bell " " # !
#Matches icon order when using `#F` (`#!~[*-]MZ`)
set -g @catppuccin_window_flags_icon_format "##{?window_activity_flag,#{E:@catppuccin_window_flags_icon_activity},}##{?window_bell_flag,#{E:@catppuccin_window_flags_icon_bell},}##{?window_silence_flag,#{E:@catppuccin_window_flags_icon_silent},}##{?window_active,#{E:@catppuccin_window_flags_icon_current},}##{?window_last_flag,#{E:@catppuccin_window_flags_icon_last},}##{?window_marked_flag,#{E:@catppuccin_window_flags_icon_mark},}##{?window_zoomed_flag,#{E:@catppuccin_window_flags_icon_zoom},} "

#Status
set -g @catppuccin_status_background 'none'
set -g @catppuccin_status_left_separator " "
set -g @catppuccin_status_middle_separator ""
set -g @catppuccin_status_right_separator " "
set -g @catppuccin_status_connect_separator "no" # yes, no
set -g @catppuccin_status_fill "icon"
set -g @catppuccin_status_module_bg_color "#{@thm_surface_0}"

set -g @catppuccin_date_time_text ' %Y.%m.%d %H:%M'

run "~/.local/share/tmux/plugins/tpm/tpm"

# set -g status-bg default
# set -g status-style bg=default
set -g popup-style bg=default
