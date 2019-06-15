export LANG=ja_JP.UTF-8

autoload -U compinit
compinit

if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi
source ~/.zplug/init.zsh

# plugins
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "b4b4r07/enhancd", use:init.sh
zplug "arks22/tmuximum", as:command

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
#zplug load --verbose

PURE_PROMPT_SYMBOL='»'

export ENHANCD_HOME_ARG=// # cdは元の動作にして替わりにcd //でヒストリ全部からの選択
export ENHANCD_DOT_ARG=.   # cd ..は元の動作にして替わりにcd .で上位ディレクトリのリストから選択


# ---------- HISTORY ----------

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

# ------------------------------


alias ls="ls -GF"
alias la='ls -la'
alias vi='nvim'


function frepo() {
  local dir
  dir=$(ghq list > /dev/null | fzf --reverse +m) &&
    cd $(ghq root)/$dir
}

function o() {
  cd $(ghq root)/$(ghq list | fzf --reverse +m)
}
zle -N frepo
bindkey '^g' frepo

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history


# Load rbenv
if [ -e "$HOME/.rbenv" ]; then
  eval "$(rbenv init - zsh)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_TRIGGER=','

export FZF_DEFAULT_OPTS='
  --color fg:252,bg:bw,hl:67,fg+:252,bg+:235,hl+:81
  --color info:144,prompt:161,spinner:135,pointer:135,marker:118
'
