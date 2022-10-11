local status, telescope = pcall(require, "telescope")
if not status then return end
-- local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

-- local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    hidden = true,
    -- prompt_prefix = "   ",
    prompt_prefix = "   ",
    selection_caret = " ",
    -- mappings = {
    --   n = {
    --     ["q"] = actions.close
    --   },
    -- },
    show_line = false,
    prompt_title = false,
    results_title = false,
    preview_title = false,
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top",
      -- horizontal = {
      --   prompt_position = "top",
      --   -- preview_width = 0.55,
      --   -- results_width = 0.8,
      -- },
      -- vertical = {
      --   -- mirror = false,
      -- },
      -- width = 0.87,
      -- height = 0.80,
      -- preview_cutoff = 120,
    },
    file_ignore_patterns = { "node_modules", ".git/" },
    -- border = false,
    -- borderchars = {
    --   prompt = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' };
    --   results = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' };
    --   preview = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' };
    -- }
    -- borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
  },
  previewer = {

  },
  extensions = {
    file_browser = {
      -- theme = "dropdown",
      -- theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      -- mappings = {
      --   -- your custom insert mode mappings
      --   ["i"] = {
      --     ["<C-w>"] = function() vim.cmd('normal vbd') end,
      --   },
      --   ["n"] = {
      --     -- your custom normal mode mappings
      --     ["N"] = fb_actions.create,
      --     ["h"] = fb_actions.goto_parent_dir,
      --     ["/"] = function()
      --       vim.cmd('startinsert')
      --     end
      --   },
      -- },
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    },
  },
}

telescope.load_extension("ui-select")
telescope.load_extension("file_browser")

local TelescopePrompt = {
  TelescopePromptNormal = {
    bg = '#313244',
  },
  TelescopePromptBorder = {
    fg = '#313244',
    bg = '#313244',
  },
  TelescopePromptTitle = {
    fg = '#313244',
    bg = '#313244',
  },
  TelescopePreviewBorder = {
    fg = '#1E1E2E',
    bg = '#1E1E2E',
  },
  TelescopePreviewTitle = {
    fg = '#1E1E2E',
    bg = '#1E1E2E',
  },
  TelescopeResultsNormal = {
    -- fg = '#1E1E2E',
    -- bg = '#1E1E2E',
    bg = '#181825',
  },
  TelescopeResultsBorder = {
    -- fg = '#1E1E2E',
    -- bg = '#1E1E2E',
    fg = '#181825',
    bg = '#181825',
  },
  TelescopeResultsTitle = {
    -- fg = '#1E1E2E',
    -- bg = '#1E1E2E',
    fg = '#181825',
    bg = '#181825',
  },
}
-- for hl, col in pairs(TelescopePrompt) do
--   vim.api.nvim_set_hl(0, hl, col)
-- end

vim.keymap.set('n', '<C-P>',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)
vim.keymap.set('n', 'mg', function()
  builtin.live_grep()
end)
vim.keymap.set('n', 'mb', function()
  builtin.buffers()
end)
vim.keymap.set('n', ';t', function()
  builtin.help_tags()
end)
vim.keymap.set('n', ';;', function()
  builtin.resume()
end)
vim.keymap.set('n', 'md', function()
  builtin.diagnostics()
end)
vim.keymap.set("n", "<C-N>", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)
