bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded."

# `$tmux list-keys` shows mapping


# 新しいウィンドウを作成する
bind t new-window -c '#{pane_current_path}'

# ペイン間の移動
bind -n M-h select-pane -L
bind -n M-j select-pane -D
bind -n M-k select-pane -U
bind -n M-l select-pane -R

# vi のキーバインドでペインをリサイズする
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

# window の作成, 移動

# bind -n M-c new-window -c "#{pane_current_path}"
# bind -n M-j next-window
# bind -n M-k previous-window

# session の作成, 移動
# bind -n M-C new-session
# bind -n M-l switch-client -n
# bind -n M-h switch-client -p

# pane の分割
bind -n M-v split-window -h -c "#{pane_current_path}"
bind -n M-s split-window -v -c "#{pane_current_path}"
# bind \\ split-window -h -c '#{pane_current_path}'
# bind - split-window -v -c '#{pane_current_path}'

# bind -n M-a choose-tree
# bind -n M-e choose-session
# bind -n M-w choose-tree -w

# bind s new-window -n "session-switcher" "\
#     tmux list-sessions -F '#{?session_attached,,#{session_name}}' |\
#     sed '/^$/d' |\
#     fzf --reverse --header jump-to-session --preview 'tmux capture-pane -pt {}'  |\
#     xargs tmux switch-client -t"

# bind s display-popup -E "\
#   tmux list-sessions |\
#   sed -E 's/:.*$//' |\
#   grep -v \"^$(tmux display-message -p '#S')\$\" |\
#   fzf --reverse |\
#   xargs tmux switch-client -t"

# bind g run-shell "fish -c \"create_session_with_ghq\""
bind g run-shell "~/bin/tmux-ghq"
# bind s run-shell "fish -c \"show_tmux_sessions\""
bind s display-popup -E "\
  tmux list-sessions -F '#{session_name}' |\
  sed '/^$/d' |\
  fzf --reverse |\
  xargs tmux switch-client -t"

# tmux list-sessions -F '#{?session_attached,,#{session_name}}' |\

bind b run-shell "tmux popup -E 'echo hello && sleep 2'"

# fzf --reverse --header jump-to-session --preview 'tmux capture-pane -pt {}'  |\


# 'v' で選択を始める (default: Space) 
# 短形選択は 'v' -> 'C-v'
bind -T copy-mode-vi v send-keys -X begin-selection
# 'y' でコピー (default: Enter)
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel

