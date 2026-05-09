return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-nvim",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      float = {
        transparent = true,
        solid = true,
      },
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
      integrations = {
        blink_cmp = {
          style = "bordered",
        },
        dropbar = {
          enabled = true,
        },
        snacks = {
          enabled = true,
          indent_scope_color = "mauve"
        },
        leap = true,
      },
      -- custom_highlights = function(colors)
      --   return {
      --     CursorColumn = { bg = "#2a2b3c" },
      --   }
      -- end,
    },
  },
  {
    "metalelf0/black-metal-theme-neovim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("black-metal").setup({
        -- optional configuration here
        theme = "bathory",
        plain_float = true,
        transparent = true,

        plugin = {
          lualine = {
            -- Bold lualine_a sections
            bold = true,
            -- Don't set section/component backgrounds. Recommended to not set
            -- section/component separators.
            plain = true,
          },
          cmp = { -- works for nvim.cmp and blink.nvim
            -- Don't highlight lsp-kind items. Only the current selection will be highlighted.
            plain = true,
            -- Reverse lsp-kind items' highlights in blink/cmp menu.
            reverse = false,
          },
        },
      })
      require("black-metal").load()
    end,
  },
}
