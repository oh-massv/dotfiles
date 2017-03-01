export LANG=ja_JP.UTF-8

## 履歴の保存先
HISTFILE=$HOME/.zsh-history
## メモリに展開する履歴の数
HISTSIZE=100000
## 保存する履歴の数
SAVEHIST=100000

autoload -U compinit
compinit

## 色を使う
setopt prompt_subst
## ビープを鳴らさない
setopt nobeep
## 補完候補一覧でファイルの種別をマーク表示
setopt list_types
## サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt auto_resume
## 補完候補を一覧表示
setopt auto_list
## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups
## TAB で順に補完候補を切り替える
setopt auto_menu

## 補完候補の色づけ
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# ls color
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -GF"
alias gls="gls --color"

# zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'


export PATH=$HOME/.nodebrew/current/bin:$PATH

export PATH="/usr/local/bin:$PATH"

export XDG_CONFIG_HOME=$HOME/.config

export GOPATH=$HOME/go

export PATH="$GOPATH/bin:$PATH"

autoload -U promptinit; promptinit
prompt pure


export CONTRE_GITHUB_CLIENTID=b780091a00d09fa30336
export CONTRE_GITHUB_CLIENTSECRET=3bef5283b75a43f9b3e5b253effe13daccb0da9d
