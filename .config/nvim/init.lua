require('massv.base')
require('massv.highlights')
require('massv.maps')
require('massv.plugins')
require('massv.terminal')

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
