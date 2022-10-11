local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

local function basename(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  -- if tab.is_active then
  return {
    { Text = '  ' .. basename(tab.active_pane.foreground_process_name) .. '  ' },
  }
  -- end
  -- return tab.active_pane.title
end)

local function font_with_fallback(name, params)
  local names = { name }
  return wezterm.font_with_fallback(names, params)
end

-- local font_name = "Hack Nerd Font"
local font_name = "JetBrainsMono Nerd Font"
-- local font_name = "CaskaydiaCove Nerd Font"

return {
  leader = { key = "s", mods = "CTRL" },
  keys = {
    -- { key = "E", mods = "ALT", action = wezterm.action { EmitEvent = "trigger-nvim-with-scrollback" } },
    { key = "s", mods = "LEADER", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
    { key = "v", mods = "LEADER", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
    -- { key = "z", mods = "LEADER",       action="TogglePaneZoomState" },
    -- { key = "c", mods = "LEADER",       action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
    { key = "h", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Left" } },
    { key = "j", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Down" } },
    { key = "k", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Up" } },
    { key = "l", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Right" } },
    { key = "H", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Left", 5 } } },
    { key = "J", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Down", 5 } } },
    { key = "K", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Up", 5 } } },
    { key = "L", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Right", 5 } } },
    { key = "c", mods = "LEADER", action = wezterm.action { CloseCurrentPane = { confirm = false } } },
  },
  font = font_with_fallback(font_name, { weight = 'Regular' }),
  font_rules = {
    {
      italic = true,
      intensity = "Bold",
      font = font_with_fallback(font_name, { bold = true, italic = true }),
    },
    {
      intensity = "Bold",
      font = font_with_fallback(font_name, { bold = true }),
    },
    {
      italic = true,
      font = font_with_fallback(font_name, { italic = true }),
    },
  },
  font_size = 15,
  use_ime = true,

  color_scheme = "Catppuccin Mocha",
  -- Horizon Dark
  -- colors = {
  --   background = '#1C1E26',
  --   foreground = '#D5D8DA',

  --   ansi = {
  --     "#16161c",
  --     "#E95678",
  --     "#29D398",
  --     "#FAB795",
  --     "#26BBD9",
  --     "#EE64AC",
  --     "#59E1E3",
  --     "#D5D8DA",
  --   },
  --   brights = {
  --     "#5b5858",
  --     "#EC6A88",
  --     "#3FDAA4",
  --     "#FBC3A7",
  --     "#3FC4DE",
  --     "#F075B5",
  --     "#6BE4E6",
  --     "#D5D8DA",
  --   },
  --   tab_bar = {
  --     background = "#1C1E26",
  --     active_tab = {
  --       bg_color = "#2E303E",
  --       fg_color = "#DCDFE4",
  --       intensity = "Bold",
  --       italic = true,
  --     },
  --     inactive_tab = {
  --       bg_color = "#1C1E26",
  --       fg_color = "#5b5858",
  --     },
  --     inactive_tab_hover = {
  --       bg_color = "#1C1E26",
  --       fg_color = "#5b5858",
  --     },
  --     new_tab = {
  --       bg_color = "#1C1E26",
  --       fg_color = "#5b5858",
  --     },
  --     new_tab_hover = {
  --       bg_color = "#1C1E26",
  --       fg_color = "#5b5858",
  --     }
  --   }
  -- },

  -- Tokyodark
  -- colors = {
  --   foreground = '#a0A8CD',
  --   background = '#11121D',
  --   ansi = {
  --     "#32344a",
  --     "#f7768e",
  --     "#9ece6a",
  --     "#e0af68",
  --     "#7aa2f7",
  --     "#ad8ee6",
  --     "#449dab",
  --     "#787c99"
  --   },
  --   brights = {
  --     "#444b6a",
  --     "#ff7a93",
  --     "#b9f27c",
  --     "#ff9e64",
  --     "#7da6ff",
  --     "#bb9af7",
  --     "#0db9d7",
  --     "#acb0d0",
  --   },
  --   tab_bar = {
  --     background = "#11121D",
  --     active_tab = {
  --       bg_color = "#32344a",
  --       fg_color = "#a0A8CD",
  --       intensity = "Bold",
  --       italic = true,
  --     },
  --     inactive_tab = {
  --       bg_color = "#11121D",
  --       fg_color = "#808080",
  --     },
  --     inactive_tab_hover = {
  --       bg_color = "#444b6a",
  --       fg_color = "#909090"
  --     },
  --     new_tab = {
  --       bg_color = "#11121D",
  --       fg_color = "#808080",
  --     },
  --     new_tab_hover = {
  --       bg_color = "#444b6a",
  --       fg_color = "#909090"
  --     }
  --   }
  -- },

  -- font_antialias = "Subpixel",
  -- freetype_load_target = 'Mono',
  -- freetype_render_target = 'HorizontalLcd',
  -- selection_word_boundary = ' \t\n{[}]()"\'',
  -- exit_behavior = "Hold",
  -- harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
  -- custom_block_glyphs = true,
  -- allow_square_glyphs_to_overflow_width = "Always",

  hide_tab_bar_if_only_one_tab = true,
  show_tab_index_in_tab_bar = false,

  adjust_window_size_when_changing_font_size = false,
  -- bold_brightens_ansi_colors = false,

  use_fancy_tab_bar = false,
  -- tab_bar_at_bottom = true,

  -- force_reverse_video_cursor = true,

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  window_background_opacity = 0.95,
  -- text_background_opacity = 0.8,
  window_decorations = "RESIZE",
  -- window_frame = {
  --   border_left_width = '0.5cell',
  --   border_right_width = '0.5cell',
  --   border_bottom_height = '0.25cell',
  --   border_top_height = '0.25cell',
  -- },
}

-- https://github.com/wez/wezterm/discussions/628
