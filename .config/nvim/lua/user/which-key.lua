local status, wk = pcall(require, "which-key")
if (not status) then return end

wk.setup {
  plugins = {
    marks = false,
    registers = false,
    spelling = { enabled = false, suggestions = 20 },
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    }
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    -- winblend = 10
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  q = { ":q<cr>", "Quit" },
  Q = { ":wq<cr>", "Save & Quit" },
  w = { ":w<cr>", "Save" },
  x = { ":bdelete<cr>", "Close" },
  e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  v = { "<cmd>vsplit<cr>", "vsplit" },
  h = { "<cmd>split<cr>", "split" },
  b = { "<cmd>Telescope buffers<cr>", "Buffers" },
  -- c = { }
  -- E = { ":e ~/.config/nvim/init.lua<cr>", "Edit config" },

  f = {
    name = "Telescope",
    f = {
      function()
        require("telescope.builtin").find_files({
          no_ignore = false,
          hidden = true
        })
      end, "Telescope Find Files"
    },
    g = { ":Telescope live_grep<cr>", "Telescope Live Grep" },
    b = { ":Telescope buffers<cr>", "Telescope Buffers" },
    d = { ":Telescope diagnostics<cr>", "Telescope Diagnostics" },
    n = { ":Telescope file_browser<cr>", "Telescope File Browse" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
  },

  t = {
    name = "Terminal",
    t = { ":ToggleTerm<cr>", "Split Below" },
    f = { require("user.toggleterm").toggle_float, "Floating Terminal" },
    l = { require("user.toggleterm").toggle_lazygit, "LazyGit" }
  },

  l = {
    name = "LSP",
    w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    c = { "<cmd>lua require('user.lsp').server_capabilities()<cr>", "Get Capabilities" },
    i = { "<cmd>LspInfo<cr>", "Connected Language Servers" },
    f = { "<cmd>lua vim.lsp.buf.format  { async = true }<cr>", "Format" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
  },

  p = {
    name = "Packer",
    r = { ":PackerClean<cr>", "Remove Unused Plugins" },
    c = { ":PackerCompile profile=true<cr>", "Recompile Plugins" },
    i = { ":PackerInstall<cr>", "Install Plugins" },
    p = { ":PackerProfile<cr>", "Packer Profile" },
    s = { ":PackerSync<cr>", "Sync Plugins" },
    S = { ":PackerStatus<cr>", "Packer Status" },
    u = { ":PackerUpdate<cr>", "Update Plugins" }
  },

  d = {
    name = "Debug",
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
    O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
    l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
    u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
    x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
  },

  z = {
    name = "Focus",
    z = { ":ZenMode<cr>", "Toggle Zen Mode" },
    t = { ":Twilight<cr>", "Toggle Twilight" }
  }
}

wk.register(mappings, opts)
