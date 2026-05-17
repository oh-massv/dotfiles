export FZF_DEFAULT_OPTS="\
  --height 40% --layout=reverse --info inline \
  --color=spinner:#f5e0dc,hl:#f38ba8 \
  --color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
  --color=selected-bg:#45475a"

command -v fzf >/dev/null && source <(fzf --zsh)
