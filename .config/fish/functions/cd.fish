# ref: https://blog.abekoh.dev/posts/prj-command
#      https://github.com/abekoh/dotfiles/blob/main/config/fish/functions/cd.fish

function cd --description "Change directory"
  set -l MAX_DIR_HIST 25

  if test (count $argv) -gt 1
    printf "%s\n" (_ "Too many args for cd command")
    return 1
  end

  # Skip history in subshells.
  if status --is-command-substitution
    builtin cd $argv
    return $status
  end

  # Avoid set completions.
  set -l previous $PWD

  if test "$argv" = "-"
    if test "$__fish_cd_direction" = "next"
      nextd
      else
        prevd
      end
      return $status
  end

  # allow explicit "cd ." if the mount-point became stale in the meantime
  if test "$argv" = "."
    cd "$PWD"
    return $status
  end

  if test -n "$TMUX" -a -z "$argv"
    set session_path (tmux show-environment | grep TMUX_SESSION_PATH | string replace "TMUX_SESSION_PATH=" "")
    if test $session_path
      builtin cd $session_path
      return $status
    end
  end

  builtin cd $argv
  set -l cd_status $status

  if test $cd_status -eq 0 -a "$PWD" != "$previous"
    set -q dirprev
    or set -l dirprev
    set -q dirprev[$MAX_DIR_HIST]
    and set -e dirprev[1]

    # If dirprev, dirnext, __fish_cd_direction
    # are set as universal variables, honor their scope.

    set -U -q dirprev
    and set -U -a dirprev $previous
    or set -g -a dirprev $previous

    set -U -q dirnext
    and set -U -e dirnext
    or set -e dirnext

    set -U -q __fish_cd_direction
    and set -U __fish_cd_direction prev
    or set -g __fish_cd_direction prev
  end

  return $cd_status
end

