return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "stylelint" },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")

      opts.sources = opts.sources or {}

      -- cfg 検出ロジック
      local function has_stylelint_config(utils)
        local root = utils.root
        -- 2 つのワイルドカードだけで全パターン網羅
        local found = vim.fs.find({ ".stylelintrc*", "stylelint.config.*" }, { path = root, type = "file", limit = 1 })
        return #found > 0
      end

      local with_cfg = has_stylelint_config

      table.insert(opts.sources, nls.builtins.diagnostics.stylelint.with({ condition = with_cfg }))
      table.insert(opts.sources, nls.builtins.formatting.stylelint.with({ condition = with_cfg }))
    end,
  },
}
