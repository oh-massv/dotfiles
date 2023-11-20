local wezterm = require("wezterm")
local action = wezterm.action

return {
  -- {
  --   key = "y",
  --   mods = "CTRL|SHIFT",
  --   action = act.SwitchToWorkspace({
  --     name = "default",
  --   }),
  -- },
  -- {
  --   key = "u",
  --   mods = "CTRL|SHIFT",
  --   action = act.SwitchToWorkspace({
  --     name = "monitoring",
  --     spawn = {
  --       args = { "top" },
  --     },
  --   }),
  -- },
  -- { key = "i", mods = "CTRL|SHIFT", action = act.SwitchToWorkspace },
  -- {
  --   key = "w",
  --   mods = "ALT|SHIFT",
  --   action = act.ShowLauncherArgs({
  --     flags = "FUZZY|WORKSPACES",
  --   }),
  -- },
  -- {
  --   key = "W",
  --   mods = "CTRL|SHIFT",
  --   action = act.PromptInputLine({
  --     description = wezterm.format({
  --       { Attribute = { Intensity = "Bold" } },
  --       { Foreground = { AnsiColor = "Fuchsia" } },
  --       { Text = "Enter name for new workspace" },
  --     }),
  --     action = wezterm.action_callback(function(window, pane, line)
  --       -- line will be `nil` if they hit escape without entering anything
  --       -- An empty string if they just hit enter
  --       -- Or the actual line of text they wrote
  --       if line then
  --         window:perform_action(
  --           act.SwitchToWorkspace({
  --             name = line,
  --           }),
  --           pane
  --         )
  --       end
  --     end),
  --   }),
  -- },
  -- { key = "D", mods = "ALT|SHIFT", action = action.ShowDebugOverlay },
  { key = "v", mods = "LEADER", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "s", mods = "LEADER", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "m", mods = "LEADER", action = action.TogglePaneZoomState },
  -- { key = "0", mods = "LEADER", action = action.PaneSelect({ mode = "SwapWithActive" }) },
  { key = "Enter", mods = "LEADER", action = action.ActivateCopyMode },

  { key = "c", mods = "ALT", action = action({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "x", mods = "ALT", action = action({ CloseCurrentTab = { confirm = true } }) },
  { key = "h", mods = "ALT", action = action({ ActivateTabRelative = -1 }) },
  { key = "l", mods = "ALT", action = action({ ActivateTabRelative = 1 }) },
  { key = "h", mods = "ALT|CTRL", action = action({ MoveTabRelative = -1 }) },
  { key = "l", mods = "ALT|CTRL", action = action({ MoveTabRelative = 1 }) },

  { key = "a", mods = "ALT", action = wezterm.action.ShowLauncher },
}
