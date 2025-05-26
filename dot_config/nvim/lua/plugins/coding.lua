return {
  {
    "uga-rosa/ccc.nvim",
    event = "VeryLazy",
    opts = {},
    cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
    keys = {
      { "<leader>zp", "<cmd>CccPick<cr>", desc = "Pick" },
      { "<leader>zc", "<cmd>CccConvert<cr>", desc = "Convert" },
      { "<leader>zh", "<cmd>CccHighlighterToggle<cr>", desc = "Toggle Highlighter" },
    },
  },
  {
    "NTBBloodbath/color-converter.nvim",
  },
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      },
      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
        menu = {
          border = "rounded",
        },
        documentation = {
          window = {
            border = "rounded",
          },
        },
      },
      signature = {
        window = {
          border = "rounded",
        },
      },
      cmdline = {
        -- enabled = true,
        -- sources = function()
        --   local type = vim.fn.getcmdtype()
        --   -- Search forward and backward
        --   if type == "/" or type == "?" then
        --     return { "buffer" }
        --   end
        --   -- Commands
        --   if type == ":" then
        --     return { "cmdline" }
        --   end
        --   return {}
        -- end
      },
      sources = {
        -- cmdline = function()
        --   local type = vim.fn.getcmdtype()
        --   -- Search forward and backward
        --   if type == "/" or type == "?" then
        --     return { "buffer" }
        --   end
        --   -- Commands
        --   if type == ":" then
        --     return { "cmdline" }
        --   end
        --   return {}
        -- end,

        -- default = { "obsidian", "obsidian_new", "obsidian_tags" },
        -- providers = {
        --   obsidian = {
        --     name = "obsidian",
        --     module = "blink.compat.source",
        --   },
        --   obsidian_new = {
        --     name = "obsidian_new",
        --     module = "blink.compat.source",
        --   },
        --   obsidian_tags = {
        --     name = "obsidian_tags",
        --     module = "blink.compat.source",
        --   },
        -- },
      },
    },
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   event = { "InsertEnter", "CmdlineEnter" },
  --   dependencies = {
  --     {
  --       "hrsh7th/cmp-cmdline",
  --       opts = function()
  --         local cmp = require("cmp")
  --         return {
  --           mapping = cmp.mapping.preset.cmdline(),
  --           sources = cmp.config.sources({
  --             { name = "path" },
  --           }, {
  --             { name = "cmdline" },
  --           }, {
  --             { name = "buffer" },
  --           }),
  --         }
  --       end,
  --       config = function(_, opts)
  --         local cmp = require("cmp")
  --         cmp.setup.cmdline(":", opts)
  --         cmp.setup.cmdline({ "/", "?" }, opts)
  --       end,
  --     },
  --     "roobert/tailwindcss-colorizer-cmp.nvim",
  --   },
  --   opts = function(_, opts)
  --     local cmp = require("cmp")
  --     local luasnip = require("luasnip")
  --
  --     opts.completion = vim.tbl_extend("force", opts.completion, {
  --       completeopt = "menu,menuone,noselect",
  --     })
  --
  --     opts.snippet = vim.tbl_extend("force", opts.snippet, {
  --       expand = function(args)
  --         require("luasnip").lsp_expand(args.body)
  --       end,
  --     })
  --
  --     local has_words_before = function()
  --       unpack = unpack or table.unpack
  --       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  --     end
  --
  --     opts.mapping = vim.tbl_extend("force", opts.mapping, {
  --       ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --       ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --       ["<C-Space>"] = cmp.mapping.complete(),
  --       ["<C-e>"] = cmp.mapping.abort(),
  --       ["<CR>"] = cmp.mapping.confirm({ select = true }),
  --       ["<Tab>"] = cmp.mapping(function(fallback)
  --         if cmp.visible() then
  --           cmp.select_next_item()
  --           -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
  --           -- they way you will only jump inside the snippet region
  --         elseif luasnip.expand_or_jumpable() then
  --           luasnip.expand_or_jump()
  --         elseif has_words_before() then
  --           cmp.complete()
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" }),
  --       ["<S-Tab>"] = cmp.mapping(function(fallback)
  --         if cmp.visible() then
  --           cmp.select_prev_item()
  --         elseif luasnip.jumpable(-1) then
  --           luasnip.jump(-1)
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" }),
  --     })
  --
  --     opts.view = {
  --       entries = {
  --         name = "custom",
  --         selection_order = "near_cursor",
  --       },
  --     }
  --
  --     opts.window = {
  --       completion = {
  --         border = "rounded",
  --       },
  --       documentation = {
  --         border = "rounded",
  --       },
  --     }
  --   end,
  -- },
}
