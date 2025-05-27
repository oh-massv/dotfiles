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
set -g @plugin 'catppuccin/tmux#v2.1.3'

set -g @catppuccin_flavor 'mocha'
set -g @catppuccin_window_status_style "rounded"
set -g @catppuccin_window_number_position 'right'

set -g @catppuccin_window_text "#{?#{!=:#W,zsh},#W,#T}"
set -g @catppuccin_window_current_text "#{?#{!=:#W,zsh},#W,#T}"

set -g @catppuccin_status_fill "icon"
set -g @catppuccin_status_connect_separator "no"

set -g @catppuccin_date_time_text ' %Y.%m.%d %H:%M'

run "~/.local/share/tmux/plugins/tmux/catppuccin.tmux"

set -g status-position bottom
set -g status-interval 1

set -g status-left-length 100
set -g status-left "" 

set -g status-right-length 100
set -g status-right '#{E:@catppuccin_status_session}'
set -agF status-right '#{E:@catppuccin_status_battery}'
set -ag status-right '#{E:@catppuccin_status_date_time}'

run "~/.local/share/tmux/plugins/tmux-battery/battery.tmux"

set -g @continuum-restore 'on'

run "~/.local/share/tmux/plugins/tpm/tpm"

set -g status-bg default
set -g status-style bg=default
set -g popup-style bg=default
