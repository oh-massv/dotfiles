-- Turn off paste mode when leaving insert
-- vim.api.nvim_create_autocmd("InsertLeave", {
--   pattern = '*',
--   command = "set nopaste"
-- })

-- vim.cmd [[
--   augroup _glsl
--     autocmd!
--     autocmd BufNewFile,BufRead *.vs,*.fs,*.vert,*.frag set ft=glsl
--   augroup end
-- ]]

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.vs", "*.fs", "*.vert", "*.frag" },
  callback = function()
    vim.opt_local.filetype = "glsl"
  end
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end
})

-- local function has_value(tab, val)
--   for _, value in ipairs(tab) do
--     if value == val then
--       return true
--     end
--   end
--   return false
-- end

-- vim.api.nvim_create_autocmd({ 'CursorMoved', 'BufWinEnter', 'BufFilePost' }, {
--   callback = function()
--     local winbar_filetype_exclude = {
--       "help",
--       "NvimTree",
--       "packer",
--     }

--     if has_value(winbar_filetype_exclude, vim.bo.filetype) then
--       vim.opt_local.winbar = nil
--       return
--     end
--   end
-- })

-- vim.api.nvim_create_augroup("_winbar", {
vim.api.nvim_create_autocmd(
-- { "CursorMoved", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", },
  { "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
  {
    group = vim.api.nvim_create_augroup("_winbar", { clear = true }),
    -- group = "_winbar",
    callback = function()
      -- local status_ok, _ = pcall(vim.api.nvim_buf_get_var, 0, "lsp_floating_window")
      -- if not status_ok then
      require("user.winbar").setup()
      -- end
    end,
  }
)
-- })
