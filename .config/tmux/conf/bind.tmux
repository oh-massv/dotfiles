unbind C-b
set -g prefix C-s

# `$tmux list-keys` shows mapping

# 新しいウィンドウを作成する
bind t new-window -c '#{pane_current_path}'

# ペイン間の移動
bind -n C-M-h select-pane -L
bind -n C-M-j select-pane -D
bind -n C-M-k select-pane -U
bind -n C-M-l select-pane -R

# vi のキーバインドでペインをリサイズする
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

# pane の分割
bind -n M-v split-window -h -c "#{pane_current_path}"
bind -n M-s split-window -v -c "#{pane_current_path}"

bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded."

bind-key "s" run-shell "$HOME/.config/tmux/scripts/sesh-default.sh"
bind-key "g" run-shell "$HOME/.config/tmux/scripts/sesh-ghq.sh"
bind-key "V" run-shell "$HOME/.config/tmux/scripts/tmux-layout.sh"
bind -N "last-session (via sesh) " L run-shell "sesh last"

# 'v' で選択を始める (default: Space) 
# 短形選択は 'v' -> 'C-v'
bind -T copy-mode-vi v send-keys -X begin-selection
# 'y' でコピー (default: Enter)
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel
