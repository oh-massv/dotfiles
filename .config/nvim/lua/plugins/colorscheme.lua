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
      -- term_colors = true,
      styles = {
        -- ref: https://github.com/ayamir/nvimdots/blob/f6584ad6e148bebe47a8e66b30dbbee411d76fbc/lua/modules/configs/ui/catppuccin.lua
        comments = {},
        conditionals = { "bold" },
        loops = { "bold" },
        functions = { "bold" },
        keywords = { "italic" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = { "bold", "italic" },
        properties = {},
        types = {},
        operators = { "bold" },
      },
      custom_highlights = function(colors)
        return {
          -- NotifyBackground = { bg = colors.base },
          -- NoiceCmdlineIcon = { style = {} },
          -- FoldColumn = { fg = colors.lavender },
          NeoTreeWinSeparator = { fg = colors.base, bg = colors.base },
        }
      end,
      integrations = {
        -- leap = true,
        -- notifier = true,
      },
    },
  },
  { "rose-pine/neovim", name = "rose-pine" },
  {
    "olivercederborg/poimandres.nvim",
    lazy = true,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },
}
