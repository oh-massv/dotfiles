local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require('massv.plugins.lsp.lspconfig')
require('massv.plugins.lsp.lsp-saga')
require('massv.plugins.lsp.null-ls')
