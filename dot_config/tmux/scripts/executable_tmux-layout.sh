#!/bin/bash

if [[ -n $TMUX ]]; then
  tmux split-window -v
  tmux split-window -v
  tmux split-window -v
  tmux select-layout main-horizontal
  tmux resize-pane -y 14
  tmux select-pane -t 1
else
  echo "tmuxセッション外で実行されています。"
fi
