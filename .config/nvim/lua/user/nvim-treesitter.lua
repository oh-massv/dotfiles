local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then return end

treesitter.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "typescript",
    "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "css",
    "html",
    "lua",
    "glsl",
    "vue",
    "yaml"
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
