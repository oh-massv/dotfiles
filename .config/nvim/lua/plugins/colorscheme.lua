return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      term_color = true,
      no_italic = false,
      no_bold = false,
      highlight_overrides = {
        mocha = function(C)
          return {}
        end,
      },
      integrations = {
        mason = true,
        neotree = true,
        navic = {
          enabled = true,
        },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
