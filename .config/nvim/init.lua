-- ref: 
-- https://github.com/LunarVim/Neovim-from-scratch/
-- https://github.com/SmiteshP/Dotfiles/tree/master/.config/nvim

require('massv.base')
require('massv.maps')
require('massv.plugins')
require('massv.highlights')
require('massv.autocommands')

local has = function(x)
  return vim.fn.has(x) == 1
end
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('massv.macos')
end
if is_win then
  require('massv.windows')
end
