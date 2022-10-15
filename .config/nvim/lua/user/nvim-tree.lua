vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    icons = {
      git_placement = "signcolumn",
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "",
          untracked = "",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  update_focused_file = {
    enable = true,
    update_root = true,
    ignore_list = { "help" },
  },
  filters = {
    dotfiles = false,
    custom = { "node_modules", "\\.cache" },
  },
  git = {
    enable = true,
    ignore = false,
  }
})
