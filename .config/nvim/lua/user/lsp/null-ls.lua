local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {
    formatting.prettier.with {
      prefer_local = "node_modules/.bin",
      -- extra_filetypes = { "toml", "solidity" },
      -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    },
    formatting.markdownlint.with {
      filetypes = { "markdown" },
    },
    formatting.textlint.with {
      filetypes = { "markdown" },
      -- prefer_local = 'node_modules/.bin',
    },
    -- formatting.stylua,
    diagnostics.markdownlint.with {
      filetypes = { "markdown" },
    },
    diagnostics.textlint.with {
      filetypes = { "markdown" },
      -- prefer_local = 'node_modules/.bin',
    },
  },
}
