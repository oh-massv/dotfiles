local status, lualine = pcall(require, "lualine")
if (not status) then return end

-- local colors = require "horizon.palette"

-- local customHorizon = {
--   normal = {
--     a = { fg = colors.bg, bg = colors.red, gui = "bold" },
--     b = { fg = colors.fg, bg = colors.reference },
--     c = { fg = colors.fg, bg = colors.bg },
--   },
--   insert = { a = { fg = colors.bg, bg = colors.cyan, gui = "bold" } },
--   visual = { a = { fg = colors.bg, bg = colors.orange, gui = "bold" } },
--   -- command = { a = { fg = colors.yellow, bg = colors.bg, gui = "bold" } },
--   replace = { a = { fg = colors.sign_delete, bg = colors.bg, gui = "bold" } },
--   inactive = {
--     a = { fg = colors.gray1, bg = colors.bg, gui = "bold" },
--     b = { fg = colors.gray1, bg = colors.bg },
--     c = { fg = colors.gray1, bg = colors.bg },
--   },
-- }

lualine.setup {
  options = {
    -- theme = customHorizon,
    theme = 'horizon',
    -- section_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    icons_enabled = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      "branch",
      "diff",
    },
    lualine_c = {
      {
        "filename",
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
      },
      {
        'diagnostics',
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
      },
    },
    lualine_x = {
      'encoding',
      'fileformat',
      'filetype'
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    -- lualine_c = { "filename" },
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  --options = {
  --  icons_enabled = true,
  --  theme = theme,
  --  section_separators = { left = '', right = '' },
  --  component_separators = { left = '', right = '' },
  --  disabled_filetypes = {}
  --},
  --sections = {
  --  lualine_a = { 'mode' },
  --  lualine_b = { 'branch' },
  --  lualine_c = { {
  --    'filename',
  --    file_status = true, -- displays file status (readonly status, modified status)
  --    path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
  --  } },
  --  lualine_x = {
  --    { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ',
  --      hint = ' ' } },
  --    'encoding',
  --    'filetype'
  --  },
  --  lualine_y = { 'progress' },
  --  lualine_z = { 'location' }
  --},
  --inactive_sections = {
  --  lualine_a = {},
  --  lualine_b = {},
  --  lualine_c = { {
  --    'filename',
  --    file_status = true, -- displays file status (readonly status, modified status)
  --    path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
  --  } },
  --  lualine_x = { 'location' },
  --  lualine_y = {},
  --  lualine_z = {}
  --},
  --tabline = {},
  --extensions = { 'fugitive' }
}
