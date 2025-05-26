set -g mouse on
setw -g mode-keys vi

set -g escape-time 10

set -g detach-on-destroy off

# prefix-keyの有効時間
set -g repeat-time 500

set -g default-shell "${SHELL}"

set -g default-terminal "tmux-256color"
set -ga terminal-overrides ",xterm-256color:Tc"

set -g popup-border-lines rounded
