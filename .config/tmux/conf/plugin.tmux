set-environment -g TMUX_PLUGIN_MANAGER_PATH "${HOME}/.local/share/tmux/plugins"

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'joshmedeski/tmux-nerd-font-window-name'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'tmux-plugins/tmux-battery'
set -g @plugin 'catppuccin/tmux#v2.1.0'

set -g @catppuccin_flavor 'mocha'
set -g @catppuccin_window_status_style 'basic'
set -g @catppuccin_window_number_position 'right'
set -g @catppuccin_window_status 'no'
set -g @catppuccin_window_text '#W'
set -g @catppuccin_window_current_text '#W'
set -g @catppuccin_status_background '#{@thm_bg}'
set -g @catppuccin_date_time_text ' %Y.%m.%d %H:%M'

set -g allow-rename off
set -g status-position bottom
set -g status-interval 5
set -g status-right-length 100
set -g status-left-length 100
set -g status-left ''
set -g status-right '#{E:@catppuccin_status_session}'
set -agF status-right '#{E:@catppuccin_status_battery}'
set -ag status-right '#{E:@catppuccin_status_date_time}'

set -g @continuum-restore 'on'

if '[ ! -d ${TMUX_PLUGIN_MANAGER_PATH}/tpm ]' \
  'run-shell "git clone --depth 1 https://github.com/tmux-plugins/tpm ${TMUX_PLUGIN_MANAGER_PATH}/tpm"'

if '[ -f ${TMUX_PLUGIN_MANAGER_PATH}/tpm/tpm ]' \
  'run-shell "${TMUX_PLUGIN_MANAGER_PATH}/tpm/tpm"'

### configure Tmux Plugin Manager
# set-environment -gF TMUX_PLUGIN_MANAGER_PATH '#{HOME}/.local/share/tmux/plugins/'
#
# if 'test ! -d "${TMUX_PLUGIN_MANAGER_PATH}/tpm"' {
#   run 'mkdir -p "${TMUX_PLUGIN_MANAGER_PATH}"'
#   run 'git clone https://github.com/tmux-plugins/tpm "${TMUX_PLUGIN_MANAGER_PATH}/tpm"'
#   run '${TMUX_PLUGIN_MANAGER_PATH}/tpm/bin/install_plugins'
# }
