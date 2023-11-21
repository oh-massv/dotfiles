# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'catppuccin/tmux'

set -g @continuum-restore 'on'

if '[ ! -d ${TMUX_PLUGIN_MANAGER_PATH}/tpm ]' \
  'run-shell "git clone --depth 1 https://github.com/tmux-plugins/tpm ${TMUX_PLUGIN_MANAGER_PATH}/tpm"'

if '[ -f ${TMUX_PLUGIN_MANAGER_PATH}/tpm/tpm ]' \
  'run-shell "${TMUX_PLUGIN_MANAGER_PATH}/tpm/tpm"'
