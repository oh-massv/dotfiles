return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        float = {
          border = "rounded",
          source = "always",
        },
        -- virtual_text = {
        --   source = 'always',
        -- },
      },
      inlay_hints = {
        enabled = false,
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },
}
