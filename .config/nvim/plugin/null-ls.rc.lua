local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

null_ls.setup {
  -- debug = true,
  sources = {
    --   null_ls.builtins.diagnostics.eslint_d.with({
    --     diagnostics_format = '[eslint] #{m}\n(#{c})'
    --   }),
    --   null_ls.builtins.diagnostics.fish
    null_ls.builtins.diagnostics.markdownlint.with {
      filetypes = { 'markdown' },
    },
    null_ls.builtins.diagnostics.textlint.with {
      filetypes = { 'markdown' },
      -- prefer_local = 'node_modules/.bin',
    },
    null_ls.builtins.formatting.textlint.with {
      filetypes = { 'markdown' },
      -- prefer_local = 'node_modules/.bin',
    },
  },
}
