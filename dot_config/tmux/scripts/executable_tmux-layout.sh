#!/bin/bash

set -euo pipefail

if [[ -z "${TMUX:-}" ]]; then
  echo "tmuxセッション外で実行されています。"
  exit 1
fi

current_pane=$(tmux display-message -p "#{pane_id}")
current_path=$(tmux display-message -p -F "#{pane_current_path}")
declare -a new_panes=()

for _ in 1 2 3; do
  pane_id=$(tmux split-window -v -d -c "$current_path" -P -F "#{pane_id}")
  new_panes+=("$pane_id")
done

tmux select-layout main-horizontal
tmux resize-pane -y 14
tmux select-pane -t "$current_pane"

is_shell_ready() {
  local pane_id=$1
  local cmd

  cmd=$(tmux display-message -p -t "$pane_id" "#{pane_current_command}")

  case "$cmd" in
    ''|tmux|login) return 1 ;;
    *) return 0 ;;
  esac
}

for pane in "${new_panes[@]}"; do
  for _ in {1..40}; do
    if is_shell_ready "$pane"; then
      break
    fi
    sleep 0.05
  done

  tmux send-keys -t "$pane" C-l
done
