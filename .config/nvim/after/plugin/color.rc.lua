-- require('onedark').setup {
--   -- Main options --
--   style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
--   transparent = false, -- Show/hide background
--   term_colors = false, -- Change terminal color as per the selected theme style
--   ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
--   cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

--   -- toggle theme style ---
--   toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
--   toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

--   -- Change code style ---
--   -- Options are italic, bold, underline, none
--   -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
--   code_style = {
--     comments = 'italic',
--     keywords = 'italic',
--     functions = 'none',
--     strings = 'none',
--     variables = 'none'
--   },

--   -- Custom Highlights --
--   colors = {}, -- Override default colors
--   highlights = {
--     TSConstructor = { fmt = 'none' },
--   }, -- Override highlight groups

--   -- Plugins Config --
--   diagnostics = {
--     darker = true, -- darker colors for diagnostic
--     undercurl = true, -- use undercurl instead of underline for diagnostics
--     background = true, -- use background color for virtual text
--   },
-- }

-- require('onedark').load()

--require('onedark').setup()
--

vim.g.tokyodark_transparent_background = true
vim.g.tokyodark_enable_italic_comment = false
vim.g.tokyodark_enable_italic = true
vim.g.tokyodark_color_gamma = "1.0"
vim.cmd("colorscheme tokyodark")

-- vim.g.tokyonight_style = "storm"
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_transparent_sidebar = true

--[[
vim.g.tokyonight_colors = {
  fg = "#839496",
  fg_dark = "#586e75",
  fg_gutter = "#073642",
  bg_highlight = "#002b36",
  comment = "#586e75",
  blue = "#268bd2",

  cyan = "#2aa198",
  blue1 = "#2ac3de",
  blue2 = "#0db9d7",
  blue5 = "#89ddff",
  blue6 = "#B4F9F8",

  yellow = "#b58900",
  orange = "#cb4b16",
  magenta = "#d33682",
  purple = "#6c71c4",
}
]]

--vim.cmd [[colorscheme tokyonight]]