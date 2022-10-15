-- ref:
-- https://github.com/LunarVim/Neovim-from-scratch/
-- https://github.com/SmiteshP/Dotfiles/tree/master/.config/nvim

require('user.options')
require('user.keymaps')
require('user.plugins')
require('user.autocommands')
require('user.nvim-cmp')
require('user.lsp')
require('user.lspkind')
require('user.telescope')
require('user.nvim-treesitter')
require('user.bufferline')
require('user.feline')
require('user.nvim-autopairs')
require('user.gitsigns')
require('user.git')
require('user.nvim-tree')
require('user.toggleterm')
require('user.indent-blankline')
require('user.which-key')
require('user.nvim-colorizer')
require('user.zen-mode')
require('user.nvim-ts-autotag')
require('user.web-devicons')
require('user.prettier')
-- require('user.noice')
require('user.notify')
require('user.dressing')
require('user.navic')
require('user.winbar')

require('user.horizon')
require('user.tokyodark')
require('user.poimandres')
require('user.catppuccin')
require('user.tokyonight')

local has = function(x)
  return vim.fn.has(x) == 1
end
local is_mac = has('macunix')
local is_win = has('win32')

if is_mac then
  require('user.macos')
end
if is_win then
  require('user.windows')
end
