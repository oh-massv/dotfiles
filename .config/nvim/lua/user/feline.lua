local ctp_feline = require("catppuccin.groups.integrations.feline")

-- ctp_feline.setup()
local status_ok, feline = pcall(require, "feline")
if not status_ok then return end

feline.setup({
  components = ctp_feline.get(),
})

-- local status_navic, navic = pcall(require, "navic")
-- if not status_navic then return end

-- local WINBAR = {}

-- WINBAR[1] = {
--   provider = function() return navic.get_location() end,
--   enabled  = function() return navic.is_available() end,
-- }

-- -- local colors = require("tokyonight.colors").setup()
-- -- local winbar = require("plugins.feline.winbar")

-- local force_inactive = {
--   filetypes = {},
--   buftypes  = {},
--   bufnames  = {}
-- }

-- local winbar_components = {
--   active   = { WINBAR },
--   inactive = {},
-- }

-- -- feline.winbar.setup()
-- feline.winbar.setup({
--   components     = winbar_components,
--   force_inactive = force_inactive,
--   -- theme          = colors,
-- })
