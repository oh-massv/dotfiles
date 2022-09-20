local status, lualine = pcall(require, "lualine")
if (not status) then return end

local theme = require "lualine.themes.tokyodark"

local p = require "tokyodark.palette"

local colors = {
  diff_add = "#9ECE6A",
  diff_modify = "#7AA2F7",
  diff_remove = "#F7768E",
  border = p.bg5,
}

for _, session in pairs(theme.inactive) do
  session.gui = "underline"
  session.fg = colors.border
end

-- local custom_components = {
--   pwd = function()
--     return vim.fn.fnamemodify(vim.fn.getcwd(-1, -1), ":~")
--   end,
-- }

lualine.setup {
  options = {
    theme = theme,
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    -- section_separators = { left = "", right = "" },
    -- component_separators = { left = "", right = "" },
    icons_enabled = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { { "mode", upper = true } },
    lualine_b = {
      { "branch", icon = "" },
      'diff'
    },
    lualine_c = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    },
    -- lualine_c = { custom_components.pwd },
    lualine_x = {
      {
        'diagnostics',
        sources = { "nvim_diagnostic" },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
      },
      'encoding',
      'fileformat',
      'filetype'
    },
    -- lualine_y = {
    --   {
    --     "diff",
    --     colored = true,
    --     diff_color = {
    --       added = { fg = colors.diff_add },
    --       modified = { fg = colors.diff_modify },
    --       removed = { fg = colors.diff_remove },
    --     },
    --     symbols = { added = "+", modified = "~", removed = "-" },
    --   },
    --   "location",
    -- },
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
  extensions = { { sections = { lualine_b = { "filetype" } }, filetypes = { "NvimTree" } } },
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
