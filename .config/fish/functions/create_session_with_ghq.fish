# ref: https://blog.abekoh.dev/posts/prj-command
#      https://mechairoi.hatenablog.com/entry/2017/12/26/233926

function create_session_with_ghq -d "start project"

  set -l repo (ghq list | fzf-tmux -w80% -h80%)
  set -l repo_path (ghq root)/$repo

  # 選択されなければ終了
  if test -z $repo_path
    return
  end

  # プロジェクト名は 所有者/リポジトリ名 の形式。その名前に`.`を含む場合は`_`に置換
  set -l repo_name (echo (basename (dirname $repo_path))/(basename $repo_path) | sed -e 's/\./_/g')

  # セッションが存在しなければ作成
  if not tmux has-session -t $repo_name 2> /dev/null
    tmux new-session -c $repo_path -s $repo_name -d
    tmux setenv -t $repo_name TMUX_SESSION_PATH $repo_path
  end

  # セッション外であればattach
  if test -z $TMUX
    tmux attach -t $repo_name
  # セッション内であればswitch
  else
    tmux switch-client -t $repo_name
  end
end
