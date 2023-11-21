# source-file ~/.tmux.reset.conf

set -g mouse
setw -g mode-keys vi

set -g escape-time 10
set -g status-position bottom

# prefix-keyの有効時間
set -g repeat-time 500

set -g default-shell "${SHELL}"

set -g terminal-overrides ',xterm-256color:Tc'
set -g default-terminal "tmux-256color"
set -as terminal-overrides ',xterm*:sitm=\E[3m'

set-environment -g TMUX_PLUGIN_MANAGER_PATH "${HOME}/.local/share/tmux/plugins"
