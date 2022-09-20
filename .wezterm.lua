local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("trigger-nvim-with-scrollback", function(window, pane)
  local scrollback = pane:get_lines_as_text()
  local name = os.tmpname()
  local f = io.open(name, "w+")
  f:write(scrollback)
  f:flush()
  f:close()
  window:perform_action(
    wezterm.action({ SpawnCommandInNewTab = {
      args = { "nvim", name },
    } }),
    pane
  )
  wezterm.sleep_ms(1000)
  os.remove(name)
end)

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  -- Create a split occupying the right 1/3 of the screen
  -- pane:split { size = 0.3 }
  -- Create another split in the right of the remaining 2/3
  -- of the space; the resultant split is in the middle
  -- 1/3 of the display and has the focus.
  pane:split { size = 0.5 }

  window:gui_window():maximize()
end)

return {
  keys = {
    { key = "E", mods = "ALT", action = wezterm.action { EmitEvent = "trigger-nvim-with-scrollback" } },
  },
  font = wezterm.font_with_fallback {
    'CaskaydiaCove Nerd Font',
  },
  font_size = 15,
  use_ime = true,

  colors = {
    foreground = '#a0A8CD',
    background = '#11121D',
    ansi = {
      "#32344a",
      "#f7768e",
      "#9ece6a",
      "#e0af68",
      "#7aa2f7",
      "#ad8ee6",
      "#449dab",
      "#787c99"
    },
    brights = {
      "#444b6a",
      "#ff7a93",
      "#b9f27c",
      "#ff9e64",
      "#7da6ff",
      "#bb9af7",
      "#0db9d7",
      "#acb0d0",
    }
  },

  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,

  window_padding = {
    left = 0,
    right = 0,
    -- top = 0,
    -- bottom = 0,
  },
  window_background_opacity = 0.95,
  window_decorations = "RESIZE",
  -- window_frame = {
  --   border_left_width = '0.5cell',
  --   border_right_width = '0.5cell',
  --   border_bottom_height = '0.25cell',
  --   border_top_height = '0.25cell',
  -- },
}
