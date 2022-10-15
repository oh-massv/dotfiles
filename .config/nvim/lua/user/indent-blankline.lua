local status, indent_blankline = pcall(require, "indent-blankline.nvim")
if not status then
  return
end

indent_blankline.setup {
  enabled = true,
  colored_indent_levels = false,
  -- show_current_context = true,
}
