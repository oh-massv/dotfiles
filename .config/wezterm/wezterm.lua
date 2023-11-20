local wezterm = require("wezterm")
local mux = wezterm.mux

local Theme = require("theme")
-- local Keys = require("keys")
local Tab = require("tab")
local Status = require("status")

Tab.setup()
Status.setup()

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return {
  font = wezterm.font_with_fallback({
    {
      family = "JetBrains Mono",
      weight = "Medium",
    },
    {
      family = "Symbols Nerd Font Mono",
      scale = 0.65,
    },
    {
      family = "游ゴシック体",
    },
  }),
  -- use_cap_height_to_scale_fallback_fonts = true,
  font_size = 15,
  -- custom_block_glyphs = true,
  canonicalize_pasted_newlines = "None",
  use_ime = true,
  color_scheme = "Catppuccin Mocha",
  colors = Theme.colors,
  use_fancy_tab_bar = false,
  adjust_window_size_when_changing_font_size = false,
  tab_max_width = 50,
  tab_bar_at_bottom = true,
  show_new_tab_button_in_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  window_background_opacity = 0.90,
  -- macos_window_background_blur = 80,
  text_background_opacity = 1.0,
  window_decorations = "RESIZE",
  -- leader = { key = "s", mods = "CTRL" },
  -- keys = Keys,
  enable_tab_bar = true,
}
