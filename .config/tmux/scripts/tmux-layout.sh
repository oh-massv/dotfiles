#!/bin/bash

if [[ ! -z $TMUX ]]; then
  tmux split-window -v
  tmux split-window -v
  tmux split-window -v
  tmux select-layout main-horizontal
  tmux resize-pane -y 20 
  tmux select-pane -t 1
else
  echo "tmuxセッション外で実行されています。"
fi
