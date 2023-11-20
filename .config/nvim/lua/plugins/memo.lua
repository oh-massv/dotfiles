return {
  {
    "glidenote/memolist.vim",
    event = "VeryLazy",
    config = function()
      vim.g.memolist_memo_suffix = "md"
      vim.g.memolist_path = "$HOME/Developer/ghq/github.com/oh-massv/memo/_posts"
      vim.g.memolist_template_dir_path = "$HOME/Developer/ghq/github.com/oh-massv/memo"
      -- vim.g.memolist_prompt_tags = 1
    end,
  },
}
