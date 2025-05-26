#!/bin/bash

ghq_root=$(ghq root)
domain="github.com"
icon_github=" "
icon_repo=" "

selected_with_icon=$(ghq list | awk -v icon="$icon_repo" -v domain="$domain/" '{sub(domain, ""); print icon $0}' | fzf-tmux -p 80%,70% \
  --no-sort --ansi --border-label ' repos ' --prompt "  $icon_github" \
  --bind 'tab:down,btab:up' \
  --preview-window 'right:55%' \
  --preview "eza --tree --color=always --icons -a --level=1 --git-ignore $ghq_root/$domain/{-1}"
)

if [ -z "$selected_with_icon" ]; then
  exit 0
fi

selected_repo="${selected_with_icon/#$icon_repo/}"

full_path="$ghq_root/$domain/$selected_repo"

sesh connect "$full_path"

tmux rename-session "$selected_repo"
