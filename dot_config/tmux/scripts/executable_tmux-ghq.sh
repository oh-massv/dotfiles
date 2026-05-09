#!/bin/bash

script="$HOME/.config/tmux/scripts/choose-ghq.sh"

if [[ -z $TMUX ]]; then
	"$script"
else
	tmux popup -E "$script"
fi
