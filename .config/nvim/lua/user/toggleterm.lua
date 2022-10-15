local M = {}

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then return end

toggleterm.setup({
  active = true,
  open_mapping = [[<c-\>]],
  float_opts = {
    border = "curved",
  },
})

-- local Terminal = require("toggleterm.terminal").Terminal
-- local lazygit = Terminal:new({
--   cmd = "lazygit",
--   direction = "float",
--   hidden = true
-- })

-- function _lazygit_toggle()
--   lazygit:toggle()
-- end

local Terminal = require("toggleterm.terminal").Terminal

M.toggle_float = function()
  local float = Terminal:new({ direction = "float" })
  float:toggle()
  -- return float:toggle()
end

M.toggle_lazygit = function()
  local lazygit = Terminal:new({
    cmd = "lazygit",
    direction = "float",
    float_opts = {
      -- border = "none",
    }
  })
  lazygit:toggle()
  -- return lazygit:toggle()
end

return M
