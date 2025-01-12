#!/bin/bash

if [[ -z $TMUX ]]; then
  choose-ghq
else
  tmux popup -E '
    $HOME/.config/tmux/scripts/choose-ghq.sh
  '
fi
