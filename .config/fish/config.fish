#if status is-interactive
  # Commands to run in interactive sessions can go here
  #set PATH /opt/homebrew/bin $PATH
  #set PATH $HOME/.nodebrew/current/bin $PATH
  #set PATH $HOME/Developer/flutter/bin $PATH
  #set PATH /opt/homebrew/opt/python@3.9/libexec/bin $PATH
  set -x GOPATH (go env GOPATH)
  set -x PATH $PATH (go env GOPATH)/bin

  abbr vi 'nvim'

#end

set -x PATH $HOME/.anyenv/bin $PATH
# referred to https://hi120ki.github.io/blog/posts/20190125/
anyenv init - fish | source

set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --color=dark --color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef'