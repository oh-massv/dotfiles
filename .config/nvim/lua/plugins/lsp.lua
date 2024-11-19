return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.diagnostics = vim.tbl_extend("force", opts.diagnostics, {
        float = { border = "rounded" },
      })
      require("lspconfig.ui.windows").default_options.border = "rounded"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },
}
