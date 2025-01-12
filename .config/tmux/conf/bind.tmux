unbind C-b
set -g prefix C-s

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

bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded."

bind g run-shell "$HOME/.config/tmux/scripts/tmux-ghq.sh"
# bind s run-shell "fish -c \"show_tmux_sessions\""
# bind s display-popup -E "\
#   tmux list-sessions -F '#{session_name}' |\
#   sed '/^$/d' |\
#   fzf --reverse |\
#   xargs tmux switch-client -t"

bind-key "V" run-shell "$HOME/.config/tmux/scripts/tmux-layout.sh"

bind-key "s" run-shell "sesh connect \"$(
  sesh list --icons | fzf-tmux -p 80%,70% \
    --no-sort --ansi --border-label ' sesh ' --prompt '󰖟   ' \
    --header '  ^a all ^t tmux ^g configs ^x zoxide ^d tmux kill ^f find' \
    --bind 'tab:down,btab:up' \
    --bind 'ctrl-a:change-prompt(󰖟 )+reload(sesh list --icons)' \
    --bind 'ctrl-t:change-prompt(󰲋 )+reload(sesh list -t --icons)' \
    --bind 'ctrl-g:change-prompt( )+reload(sesh list -c --icons)' \
    --bind 'ctrl-x:change-prompt( )+reload(sesh list -z --icons)' \
    --bind 'ctrl-f:change-prompt( )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
    --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(󱐋 )+reload(sesh list --icons)' \
    --preview-window 'right:55%' \
    --preview 'sesh preview {}'
)\""

# bind-key "g" run-shell "sesh connect\ "$(
#   ghq list | fzf-tmux -p 80%,70% \
#   --no-sort --ansi --border-label ' sesh ' --prompt '⚡  ' \
#   --bind 'tab:down,btab:up' \
# )\""

# bind-key "g" run-shell "SESSION_NAME=$(ghq list | fzf-tmux -p 80%,70% --no-sort --ansi --border-label ' sesh ' --prompt '⚡  ' --bind 'tab:down,btab:up') && sesh connect \"$SESSION_NAME\" && tmux rename-session -t \"$SESSION_NAME\" \"new-session-name\""

bind-key "g" run-shell "sesh connect \"$(
  ghq list | fzf-tmux -p 80%,70% \
  --no-sort --ansi --border-label ' sesh ' --prompt '⚡  ' \
  --bind 'tab:down,btab:up' \
)\""

# 'v' で選択を始める (default: Space) 
# 短形選択は 'v' -> 'C-v'
bind -T copy-mode-vi v send-keys -X begin-selection
# 'y' でコピー (default: Enter)
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel
