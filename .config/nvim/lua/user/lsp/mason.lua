local status1, mason = pcall(require, "mason")
if not status1 then
  return
end

local status2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status2 then
  return
end

local servers = {
  "cssls",
  "cssmodules_ls",
  "emmet_ls",
  "eslint",
  "html",
  "sumneko_lua",
  "yamlls",
  "tsserver",
  "tailwindcss",
}

local settings = {
  ui = {
    -- border = "rounded",
  },
}

mason.setup(settings)

mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  if server == "sumneko_lua" then
    -- local l_status_ok, lua_dev = pcall(require, "lua-dev")
    -- if not l_status_ok then
    --   return
    -- end
    local sumneko_opts = require "user.lsp.settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    -- opts = vim.tbl_deep_extend("force", require("lua-dev").setup(), opts)
    -- local luadev = lua_dev.setup {
      --   -- add any options here, or leave empty to use the default settings
      -- lspconfig = opts,
      -- lspconfig = {
      --   on_attach = opts.on_attach,
      --   capabilities = opts.capabilities,
      --   --   -- settings = opts.settings,
      -- },
    -- }
    -- lspconfig.sumneko_lua.setup(luadev)
    -- goto continue
  end

  -- if server == "yamlls" then
  -- end

  lspconfig[server].setup(opts)
  -- ::continue::
end
