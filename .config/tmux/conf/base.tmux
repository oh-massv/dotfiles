# source-file ~/.tmux.reset.conf

set -g mouse
setw -g mode-keys vi

set -g escape-time 10
set-option -g status-position bottom

unbind C-b
set-option -g prefix C-s
# bind C-s send-prefix

# prefix-keyの有効時間
set -g repeat-time 500

# Launch login shell
set -g default-shell "${SHELL}"
#set -g default-command "${SHELL}"

set -g terminal-overrides ',xterm-256color:Tc'
set -g default-terminal "tmux-256color"
set -as terminal-overrides ',xterm*:sitm=\E[3m'

set-environment -g TMUX_PLUGIN_MANAGER_PATH "${HOME}/.local/share/tmux/plugins"

# マウス操作を有効にする
#set -g mouse-select-pane on
#set -g mouse-resize-pane on
#set -g mouse-select-window on


# set -g status-style "bg=$status_bg,fg=$fg"
# set -g status-left-style "bg=$status_left_bg,fg=$fg"

# Border
# set -g pane-border-style "bg=$bg,fg=$border_fg"
# set -g pane-active-border-style "bg=$bg,fg=$border_active_fg"

# Window
# set -g window-status-current-style "fg=$border_active_fg"
# set -g window-status-style "fg=$fg"
