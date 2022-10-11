local status, saga = pcall(require, "lspsaga")
if (not status) then return end

-- saga.init_lsp_saga {
--   server_filetype_map = {
--     typescript = 'typescript'
--   }
-- }

-- local colors_old = {
--   fg = '#bbc2cf',
--   red = '#e95678',
--   orange = '#FF8700',
--   yellow = '#f7bb3b',
--   green = '#afd700',
--   cyan = '#36d0e0',
--   blue = '#61afef',
--   violet = '#CBA6F7',
--   teal = '#1abc9c',
-- }
-- local palette = {
-- 	rosewater = "#F5E0DC",
-- 	flamingo = "#F2CDCD",
-- 	pink = "#F5C2E7",
-- 	mauve = "#CBA6F7",
-- 	red = "#F38BA8",
-- 	maroon = "#EBA0AC",
-- 	peach = "#FAB387",
-- 	yellow = "#F9E2AF",
-- 	green = "#A6E3A1",
-- 	teal = "#94E2D5",
-- 	sky = "#89DCEB",
-- 	sapphire = "#74C7EC",
-- 	blue = "#89B4FA",
-- 	lavender = "#B4BEFE",

-- 	text = "#CDD6F4",
-- 	subtext1 = "#BAC2DE",
-- 	subtext0 = "#A6ADC8",
-- 	overlay2 = "#9399B2",
-- 	overlay1 = "#7F849C",
-- 	overlay0 = "#6C7086",
-- 	surface2 = "#585B70",
-- 	surface1 = "#45475A",
-- 	surface0 = "#313244",

-- 	base = "#1E1E2E",
-- 	mantle = "#181825",
-- 	crust = "#11111B",
-- }

local catppuccin = require("catppuccin.palettes").get_palette()

saga.init_lsp_saga({
  border_style = "rounded",
  saga_winblend = 0,
  symbol_in_winbar = {
    in_custom = true,
    separator = "  ",
  },
  custom_kind = {
    File = catppuccin.text,
    Module = catppuccin.blue,
    Namespace = catppuccin.peach,
    Package = catppuccin.mauve,
    Class = catppuccin.mauve,
    Method = catppuccin.mauve,
    Property = catppuccin.sky,
    Field = catppuccin.teal,
    Constructor = catppuccin.blue,
    Enum = catppuccin.green,
    Interface = catppuccin.peach,
    Function = catppuccin.mauve,
    Variable = catppuccin.blue,
    Constant = catppuccin.sky,
    String = catppuccin.green,
    Number = catppuccin.green,
    Boolean = catppuccin.peach,
    Array = catppuccin.blue,
    Object = catppuccin.peach,
    Key = catppuccin.red,
    Null = catppuccin.red,
    EnumMember = catppuccin.green,
    Struct = catppuccin.mauve,
    Event = catppuccin.mauve,
    Operator = catppuccin.green,
    TypeParameter = catppuccin.green,
    TypeAlias = catppuccin.green,
    Parameter = catppuccin.blue,
    StaticMethod = catppuccin.peach,
    Macro = catppuccin.red,
  },
})

local function get_file_name(include_path)
  local file_name = require('lspsaga.symbolwinbar').get_file_name()
  if vim.fn.bufname '%' == '' then return '' end
  if include_path == false then return file_name end
  -- Else if include path: ./lsp/saga.lua -> lsp > saga.lua
  local sep = vim.loop.os_uname().sysname == 'Windows' and '\\' or '/'
  local path_list = vim.split(string.gsub(vim.fn.expand '%:~:.:h', '%%', ''), sep)
  local file_path = ''
  for _, cur in ipairs(path_list) do
    file_path = (cur == '.' or cur == '~') and '' or
                file_path .. cur .. ' ' .. '%#LspSagaWinbarSep#>%*' .. ' %*'
  end
  -- return file_path .. file_name
  return file_name
end

local function config_winbar_or_statusline()
  local exclude = {
    ['terminal'] = true,
    ['toggleterm'] = true,
    ['prompt'] = true,
    ['NvimTree'] = true,
    ['help'] = true,
    ['markdown'] = true,
  } -- Ignore float windows and exclude filetype
  if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then
    vim.wo.winbar = ''
  else
    local ok, lspsaga = pcall(require, 'lspsaga.symbolwinbar')
    local sym
    if ok then sym = lspsaga.get_symbol_node() end
    local win_val = ''
    win_val = get_file_name(true) -- set to true to include path
    if sym ~= nil then win_val = win_val .. sym end
    vim.wo.winbar = win_val
    -- if work in statusline
    -- vim.wo.stl = win_val
  end
end

local events = { 'BufEnter', 'BufWinEnter', 'CursorMoved' }

-- vim.api.nvim_create_autocmd(events, {
--   pattern = '*',
--   callback = function() config_winbar_or_statusline() end,
-- })

-- vim.api.nvim_create_autocmd('User', {
--   pattern = 'LspsagaUpdateSymbol',
--   callback = function() config_winbar_or_statusline() end,
-- })

-- local opts = { noremap = true, silent = true }
-- local opts = { silent = true }


-- Lsp finder find the symbol definition implement reference
-- vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts())

-- keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)

-- Rename
-- vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts())

-- Peek Definition
-- vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts())

-- Code action
-- vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
-- vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts("Go To Previous Diagnostic"))
-- vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts("Go To Next Diagnostic"))

-- Only jump to error
-- vim.keymap.set("n", "[e", function()
--   require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- end, opts())
-- vim.keymap.set("n", "]e", function()
--   require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end, opts())

-- Hover Doc
-- vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts())

-- Float terminal
-- vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", opts())
-- if you want pass somc cli command into terminal you can do like this
-- open lazygit in lspsaga float terminal
-- keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })
-- close floaterm
-- vim.keymap.set("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], opts())
