function show_tmux_sessions -d "tmux sessions"
  set -l session (tmux list-sessions | sed -e 's/:.*//' | fzf-tmux -w80% -h80%)

  if test -z $session
    return
  end

  if test -z $TMUX
    tmux attach -t $session
  else
    tmux switch-client -t $session
  end
end
