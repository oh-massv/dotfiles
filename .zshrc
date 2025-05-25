#-- ex. fishを使う
# if [[ -o interactive ]]; then
#   if /opt/homebrew/bin/fish -n ~/.config/fish/config.fish; then
#     exec /opt/homebrew/bin/fish
#   else
#     echo "Warning: fish configuration has errors. Falling back to zsh."
#   fi
# fi


#-- 1. 環境変数
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export EDITOR="nvim"
export FZF_DEFAULT_OPTS="\
  --height 40% --layout=reverse --info inline \
  --color=spinner:#f5e0dc,hl:#f38ba8 \
  --color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
  --color=selected-bg:#45475a \
  --multi"


#-- 2. 外部スクリプト
source /Users/massv/.docker/init-zsh.sh || true # Added by Docker Desktop

source <(fzf --zsh)

eval "$(sheldon source)"


#-- 3. エイリアスとコマンド
alias vi="nvim"
alias .="cd ../"
alias ..="cd ../../"
alias ..."cd ../../../"

bindkey -e

if command -v eza > /dev/null; then
  # abbr -a ls 'eza --icons'
  alias lt='eza -lhag --tree --level=2 --long --icons --git'
  alias ll='eza --icons -lhag'
  alias ltree='eza --icons --tree --git-ignore'
fi


#-- 5. ハイライト
# if command -v fast-theme > /dev/null; then
#   fast-theme XDG:catppuccin-mocha -q
# fi

# ZSH_AUTOSUGGEST_STRATEGY=( abbreviations $ZSH_AUTOSUGGEST_STRATEGY )
#
# (( ${#ABBR_REGULAR_USER_ABBREVIATIONS} )) && {
#   ZSH_HIGHLIGHT_HIGHLIGHTERS+=(regexp)
#   ZSH_HIGHLIGHT_REGEXP+=('^[[:blank:][:space:]]*('${(j:|:)${(Qk)ABBR_REGULAR_USER_ABBREVIATIONS}}')$' fg=blue,bold)
#   ZSH_HIGHLIGHT_REGEXP+=('\<('${(j:|:)${(Qk)ABBR_GLOBAL_USER_ABBREVIATIONS}}')$' fg=blue,bold)
# }


#-- 6. コマンドラインツール
eval "$(mise activate zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
