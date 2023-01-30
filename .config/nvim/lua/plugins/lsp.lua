return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.prettier.with {
            prefer_local = "node_modules/.bin",
            -- extra_filetypes = { "toml", "solidity" },
            -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
          },
          nls.builtins.formatting.textlint.with({
            filetypes = { "markdown" },
          }),
          nls.builtins.formatting.markdownlint,
          nls.builtins.formatting.stylelint,
          nls.builtins.diagnostics.textlint.with({
            filetypes = { "markdown" },
          }),
          nls.builtins.diagnostics.markdownlint,
          nls.builtins.diagnostics.stylelint,
        },
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "css-lsp",
        "cssmodules-language-server",
        "typescript-language-server",
        "eslint-lsp",
        -- "textlint",
        -- "markdownlint",
      },
    },
  },
}
