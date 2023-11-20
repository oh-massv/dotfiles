return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "glsl",
      })
      opts.autotag = {
        enable_close_on_slash = false,
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      enable = false,
    }
  },
}
