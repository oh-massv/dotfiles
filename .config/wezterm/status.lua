local wezterm = require("wezterm")
local palette = require("theme").palette

local Status = {}

function Status.setup()
  wezterm.on("update-right-status", function(window)
    local foreground = palette.base
    local background = palette.pink
    if window:leader_is_active() then
      background = palette.red
    end
    local date = wezterm.strftime(" %a %b %d %Y %H:%M ")
    window:set_right_status(wezterm.format({
      { Background = { Color = foreground } },
      { Foreground = { Color = background } },
      { Text = "" },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Attribute = { Intensity = "Bold" } },
      { Text = "" },
      { Text = " " },
      "ResetAttributes",
      { Attribute = { Intensity = "Bold" } },
      { Text = date },
      -- { Text = ": " },
      -- { Text = window:active_workspace() },
    }))
  end)

  wezterm.on("user-var-changed", function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    if name == "ZEN_MODE" then
      local incremental = value:find("+")
      local number_value = tonumber(value)
      if incremental ~= nil then
        while number_value > 0 do
          window:perform_action(wezterm.action.IncreaseFontSize, pane)
          number_value = number_value - 1
        end
        overrides.enable_tab_bar = false
      elseif number_value < 0 then
        window:perform_action(wezterm.action.ResetFontSize, pane)
        overrides.font_size = nil
        overrides.enable_tab_bar = true
      else
        overrides.font_size = number_value
        overrides.enable_tab_bar = false
      end
    end
    window:set_config_overrides(overrides)
  end)
end

return Status
