local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
-- M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
  local icons = {
    diagnostics = {
      -- Error = " ",
      -- Warn = " ",
      -- Hint = " ",
      -- Info = " "
      Error = "",
      Warn = "",
      Info = "",
      -- Question = "",
      Hint = "",
    }
  }
  local signs = {
    { name = "DiagnosticSignError", text = icons.diagnostics.Error },
    { name = "DiagnosticSignWarn", text = icons.diagnostics.Warn },
    { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
    { name = "DiagnosticSignInfo", text = icons.diagnostics.Info },
  }
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = {
      prefix = "●"
    },
    signs = {
      active = signs,
    },
    update_in_insert = false,
    underline = true,
    float = {
      focusable = true,
      -- style = "minimal",
      border = "rounded",
      -- border = "single",
      source = "always",
      header = "",
      prefix = "",
    }
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    -- border = "single",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
    -- border = "single",
  })
end

local function attach_navic(client, bufnr)
  vim.g.navic_silence = true
  local status, navic = pcall(require, "nvim-navic")
  if not status then
    return
  end
  navic.attach(client, bufnr)
end

local keymap = function(mode, lhs, rhs, opts)
  opts = vim.tbl_extend("keep", opts,
    { noremap = true, silent = true, buffer = true })
  vim.keymap.set(mode, lhs, rhs, opts)
end

local function lsp_keymaps()
  -- local opts = { noremap = true, silent = true, buffer = true, }
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>Telescope lsp_declarations<CR>", opts)
  keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go To Definition" })
  keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Go To Declaration" })
  keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover Information" })
  keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Go To References" })
  keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go To Implementation" })
  keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "Go To Type Definition" })
  keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code Actions" })
  -- keymap("v", "ga", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", { desc = "Range code actions" })
  keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Signature Help" })
  keymap("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename" })
  -- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]]
  keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show Line Diagnostic" })
  keymap("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Previous Diagnostic" })
  keymap("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next Diagnostic" })
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<M-f>", "<cmd>Format<cr>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<M-a>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
end

M.on_attach = function(client, bufnr)
  lsp_keymaps()
  attach_navic(client, bufnr)
end

function M.enable_format_on_save()
  vim.cmd [[
    augroup format_on_save
      autocmd! 
      autocmd BufWritePre * lua vim.lsp.buf.format({ async = false }) 
    augroup end
  ]]
  vim.notify "Enabled format on save"
end

function M.disable_format_on_save()
  M.remove_augroup "format_on_save"
  vim.notify "Disabled format on save"
end

function M.toggle_format_on_save()
  if vim.fn.exists "#format_on_save#BufWritePre" == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

function M.remove_augroup(name)
  if vim.fn.exists("#" .. name) == 1 then
    vim.cmd("au! " .. name)
  end
end

vim.cmd [[ command! LspToggleAutoFormat execute 'lua require("user.lsp.handlers").toggle_format_on_save()' ]]

return M
