-- ref:
-- https://github.com/LunarVim/Neovim-from-scratch/
-- https://github.com/SmiteshP/Dotfiles/tree/master/.config/nvim

require('user.base')
require('user.maps')
require('user.plugins')
require('user.highlights')
require('user.autocommands')

local has = function(x)
  return vim.fn.has(x) == 1
end
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('user.macos')
end
if is_win then
  require('user.windows')
end
