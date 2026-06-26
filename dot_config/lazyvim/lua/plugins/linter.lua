return {
  {
    -- "williamboman/mason.nvim",
    -- opts = function(_, opts)
    --   table.insert(opts.ensure_installed, "markuplint")
    --   table.insert(opts.ensure_installed, "markdownlint")
    -- end,
  },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   optional = true,
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     table.insert(opts.sources, nls.builtins.diagnostics.markuplint)
  --     table.insert(opts.sources, nls.builtins.diagnostics.markdownlint)
  --   end,
  -- },
}
