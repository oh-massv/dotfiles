# =========================================================
# Directory Listings
# =========================================================

if command -v eza >/dev/null 2>&1; then
  alias ls="eza --icons=always"
  alias ll="eza --long --icons=always --git"
  alias la="eza --long --all --icons=always --git"
  alias lt="eza --long --tree --level=2 --icons=always --git"
  alias tree="eza --tree --icons=always"

  # Reuse ls completions for eza (avoids defining a separate completion function)
  (( $+functions[compdef] )) && compdef eza=ls
fi

# =========================================================
# Viewers
# =========================================================

if command -v bat >/dev/null 2>&1; then
  alias cat="bat"
elif command -v batcat >/dev/null 2>&1; then
  alias cat="batcat"
fi

# =========================================================
# Editor
# =========================================================

alias astronvim="NVIM_APPNAME=astronvim nvim"
# alias vi="nvim"
alias vi="astronvim"
