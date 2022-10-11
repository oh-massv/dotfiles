local status_ok, ctp = pcall(require, "catppuccin")
if not status_ok then return end

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

ctp.setup({
  transparent_background = false,
  term_color = false,
  integrations = {
    -- lsp_saga = true,
    -- telescope = false,
    navic = {
      enabled = true,
      custom_bg = "NONE",
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
  }
})

vim.cmd [[colorscheme catppuccin]]
