return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        float = { border = "single" },
      },
      inlay_hints = {
        enabled = true,
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "single",
      },
    },
  },
}
