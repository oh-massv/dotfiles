#!/bin/bash

if selected=$(ghq list | fzf --height 100%); then
  repo_path=$(ghq root)/${selected}
  owner=${repo_path%/*}
  owner=${owner##*/}
  repo=${repo_path##*/}
  session_name=${owner}/${repo}
  session_name=${session_name//./_}

  if ! tmux has-session -t "$session_name" 2>/dev/null; then
    tmux new-session -c "$repo_path" -s "$session_name" -d
  fi

  if [[ -z $TMUX ]]; then
    tmux attach-session -t "$session_name"
  else 
    tmux switch-client -t "$session_name"
  fi
fi
