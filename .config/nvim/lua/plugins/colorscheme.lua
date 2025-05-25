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
          -- NoiceCmdlineIcon = { style = {} },
          -- FoldColumn = { fg = colors.lavender },
        }
      end,
      integrations = {
        blink_cmp = true,
        -- leap = true,
        -- notifier = true,
      },
    },
  },
  {
    "olivercederborg/poimandres.nvim",
    lazy = true,
  },

  {
    "metalelf0/black-metal-theme-neovim",
    lazy = false,
    priority = 1000,
    config = function()
      require("black-metal").setup({
        -- optional configuration here
        theme = "bathory",
        variant = "dark",
        transparent = true
      })
      -- require("black-metal").load()
    end,
  },
}
