return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true,
      term_colors = true,
      styles = {
        comments = {},
        -- conditionals = {},
      },
      custom_highlights = function(colors)
        return {
          NotifyBackground = { bg = colors.base },
          NoiceCmdlineIcon = { style = {} },
          -- FoldColumn = { fg = colors.lavender },
        }
      end,
      integrations = {
        -- leap = true,
        -- notifier = true,
      },
    },
  },
  {
    "olivercederborg/poimandres.nvim",
    lazy = true,
  },
}
