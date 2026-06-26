return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "glsl",
      })
      opts.highlight = vim.tbl_extend("force", opts.highlight, {
        enable = true,
        additional_vim_regex_highlighting = false,
      })
      -- opts.autotag = vim.tbl_extend("force", opts.autotag, {
      --   enable_close_on_slash = false,
      -- })
      opts.autotag = {
        enable_close_on_slash = false,
      }
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "markdown" })
        vim.treesitter.language.register("markdown", "mdx")
      end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      enable = false,
    }
  },
}
