local status, saga = pcall(require, "lspsaga")
if (not status) then return end

-- saga.init_lsp_saga {
--   server_filetype_map = {
--     typescript = 'typescript'
--   }
-- }
--
saga.init_lsp_saga()

-- local opts = { noremap = true, silent = true }
local opts = { silent = true }

-- Lsp finder find the symbol definition implement reference
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)

-- keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)

-- Rename
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

-- Peek Definition
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)

-- Code action
vim.keymap.set({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

-- Only jump to error
vim.keymap.set("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, opts)
vim.keymap.set("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts)

-- Hover Doc
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)

-- Float terminal
vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", opts)
-- if you want pass somc cli command into terminal you can do like this
-- open lazygit in lspsaga float terminal
-- keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })
-- close floaterm
vim.keymap.set("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], opts)
