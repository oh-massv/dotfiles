return {
  {
    "akinsho/bufferline.nvim",
    opts = function()
      return {
        highlights = require("catppuccin.groups.integrations.bufferline").get(),
        options = {
          offsets = {
            {
              filetype = "neo-tree",
              separator = true,
              -- text = "Neo-tree",
              -- highlight = "Directory",
              highlight = "PanelHeading",
              text_align = "left",
            },
          },
        },
      }
    end,
  },
  -- {
  --   "stevearc/dressing.nvim",
  --   opts = {
  --   },
  -- },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "catppuccin",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      messages = {
        view = "mini",
        view_errow = "mini",
        view_warn = "mini",
      },
      notify = {
        enabled = false,
      },
      presets = {
        lsp_doc_border = true,
      },
      views = {
        mini = {
          win_options = {
            winblend = 0,
          },
        },
      },
    },
  },
  {
    "goolord/alpha-nvim",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
        [[                               __                ]],
        [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
      }
      dashboard.section.header.opts.hl = "Macro"
    end,
  },
}
