local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

local function basename(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

local mocha = {
  rosewater = "#F5E0DC",
  flamingo = "#F2CDCD",
  pink = "#F5C2E7",
  mauve = "#CBA6F7",
  red = "#F38BA8",
  maroon = "#EBA0AC",
  peach = "#FAB387",
  yellow = "#F9E2AF",
  green = "#A6E3A1",
  teal = "#94E2D5",
  sky = "#89DCEB",
  sapphire = "#74C7EC",
  blue = "#89B4FA",
  lavender = "#B4BEFE",

  text = "#CDD6F4",
  subtext1 = "#BAC2DE",
  subtext0 = "#A6ADC8",
  overlay2 = "#9399B2",
  overlay1 = "#7F849C",
  overlay0 = "#6C7086",
  surface2 = "#585B70",
  surface1 = "#45475A",
  surface0 = "#313244",

  base = "#1E1E2E",
  mantle = "#181825",
  crust = "#11111B",
}

local function get_process(tab)
  local process_icons = {
    ["docker"] = {
      { Foreground = { Color = mocha.blue } },
      { Text = wezterm.nerdfonts.linux_docker },
    },
    ["docker-compose"] = {
      { Foreground = { Color = mocha.blue } },
      { Text = wezterm.nerdfonts.linux_docker },
    },
    ["nvim"] = {
      { Foreground = { Color = mocha.green } },
      { Text = wezterm.nerdfonts.custom_vim },
    },
    ["vim"] = {
      { Foreground = { Color = mocha.green } },
      { Text = wezterm.nerdfonts.dev_vim },
    },
    ["node"] = {
      { Foreground = { Color = mocha.green } },
      { Text = wezterm.nerdfonts.mdi_hexagon },
    },
    ["zsh"] = {
      { Foreground = { Color = mocha.peach } },
      { Text = wezterm.nerdfonts.dev_terminal },
    },
    ["fish"] = {
      { Foreground = { Color = mocha.peach } },
      { Text = wezterm.nerdfonts.dev_terminal },
    },
    ["bash"] = {
      { Foreground = { Color = mocha.subtext0 } },
      { Text = wezterm.nerdfonts.cod_terminal_bash },
    },
    ["htop"] = {
      { Foreground = { Color = mocha.yellow } },
      { Text = wezterm.nerdfonts.mdi_chart_donut_variant },
    },
    ["cargo"] = {
      { Foreground = { Color = mocha.peach } },
      { Text = wezterm.nerdfonts.dev_rust },
    },
    ["go"] = {
      { Foreground = { Color = mocha.sapphire } },
      { Text = wezterm.nerdfonts.mdi_language_go },
    },
    ["lazydocker"] = {
      { Foreground = { Color = mocha.blue } },
      { Text = wezterm.nerdfonts.linux_docker },
    },
    ["git"] = {
      { Foreground = { Color = mocha.peach } },
      { Text = wezterm.nerdfonts.dev_git },
    },
    ["lazygit"] = {
      { Foreground = { Color = mocha.peach } },
      { Text = wezterm.nerdfonts.dev_git },
    },
    ["lua"] = {
      { Foreground = { Color = mocha.blue } },
      { Text = wezterm.nerdfonts.seti_lua },
    },
    ["wget"] = {
      { Foreground = { Color = mocha.yellow } },
      { Text = wezterm.nerdfonts.mdi_arrow_down_box },
    },
    ["curl"] = {
      { Foreground = { Color = mocha.yellow } },
      { Text = wezterm.nerdfonts.mdi_flattr },
    },
    ["gh"] = {
      { Foreground = { Color = mocha.mauve } },
      { Text = wezterm.nerdfonts.dev_github_badge },
    },
  }

  local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")

  return wezterm.format(
    process_icons[process_name]
    or { { Foreground = { Color = mocha.sky } }, { Text = string.format("[%s]", process_name) } }
  )
end

local function get_current_working_dir(tab)
  local current_dir = tab.active_pane.current_working_dir
  local HOME_DIR = string.format("file://%s", os.getenv("HOME"))

  return current_dir == HOME_DIR and "  ~"
      or string.format("  %s", string.gsub(current_dir, "(.*[/\\])(.*)", "%2"))
end

-- readonly show_session="#[fg=$thm_green]}#[bg=$thm_gray]#{?client_prefix,#[bg=$thm_red],#[bg=$thm_green]}#[fg=$thm_bg] #[fg=$thm_fg,bg=$thm_gray] #S "
-- readonly show_directory_in_window_status="#[fg=$thm_bg,bg=$thm_blue] #I #[fg=$thm_fg,bg=$thm_gray] #{b:pane_current_path} "
-- readonly show_directory_in_window_status_current="#[fg=$thm_bg,bg=$thm_orange] #I #[fg=$thm_fg,bg=$thm_bg] #{b:pane_current_path} "
-- readonly show_window_in_window_status="#[fg=$thm_fg,bg=$thm_bg] #W #[fg=$thm_bg,bg=$thm_blue] #I#[fg=$thm_blue,bg=$thm_bg]#[fg=$thm_fg,bg=$thm_bg,nobold,nounderscore,noitalics] "
-- readonly show_window_in_window_status_current="#[fg=$thm_fg,bg=$thm_gray] #W #[fg=$thm_bg,bg=$thm_orange] #I#[fg=$thm_orange,bg=$thm_bg]#[fg=$thm_fg,bg=$thm_bg,nobold,nounderscore,noitalics] "

wezterm.on("format-tab-title", function(tab)

  local background = mocha.blue
  local foreground = mocha.surface2

  if tab.is_active then
    background = mocha.peach
    foreground = mocha.text
  end
  return wezterm.format({
    { Background = { Color = background } },
    { Foreground = { Color = mocha.base } },
    { Attribute = { Intensity = "Bold" } },
    { Text = string.format(" %s", tab.tab_index + 1), },
    { Text = ' ' },
    "ResetAttributes",
    { Background = { Color = "rgba(30 30 46 0.0)" } },
    { Text = ' ' },
    { Text = get_process(tab) },
    { Text = " " },
    { Foreground = { Color = foreground } },
    { Text = get_current_working_dir(tab) },
    -- { Foreground = { Color = colors.base } },
    { Text = "  ▕" },
  })
end)

wezterm.on("update-right-status", function(window)
  local foreground = mocha.base
  local background = mocha.pink
  if window:leader_is_active() then
    background = mocha.red
  end
  local date = wezterm.strftime(" %a %b %d %Y %H:%M ")
  window:set_right_status(wezterm.format({
    { Background = { Color = foreground } },
    { Foreground = { Color = background } },
    { Text = '' },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Attribute = { Intensity = "Bold" } },
    { Text = '', },
    { Text = ' ' },
    "ResetAttributes",
    { Attribute = { Intensity = "Bold" } },
    { Text = date },
  }))
end)

wezterm.on('user-var-changed', function(window, pane, name, value)
  local overrides = window:get_config_overrides() or {}
  if name == "ZEN_MODE" then
    local incremental = value:find("+")
    local number_value = tonumber(value)
    if incremental ~= nil then
      while (number_value > 0) do
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

-- wezterm.on('user-var-changed', function(window, pane, name, value)
--   local overrides = window:get_config_overrides() or {}
--   if name == "ZEN_MODE" then
--      if value == "on" then
--        overrides.font_size = 18
--      else
--        overrides.font_size = nil
--     end
--   end
--   window:set_config_overrides(overrides)
-- end)

local custom = wezterm.color.get_builtin_schemes()['Catppuccin Mocha']
custom.tab_bar.background = "rgba(30 30 46 0.0)"
custom.tab_bar.inactive_tab.bg_color = "#0f0f0f"
custom.tab_bar.new_tab.bg_color = "rgba(30 30 46 0.0)"

return {
  font = wezterm.font_with_fallback({
    {
      family = "JetBrainsMono Nerd Font Mono",
      weight = "Medium",
    },
  }),
  font_size = 15,
  custom_block_glyphs = false,
  use_ime = true,

  color_schemes = {
    ['customppuccin'] = custom,
  },
  color_scheme = 'customppuccin',

  use_fancy_tab_bar = false,
  adjust_window_size_when_changing_font_size = false,
  tab_max_width = 50,

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  window_background_opacity = 1.0,
  text_background_opacity = 1.0,
  window_decorations = "RESIZE",

  leader = { key = "s", mods = "CTRL" },
  keys = {
    -- { key = "E", mods = "ALT", action = wezterm.action { EmitEvent = "trigger-nvim-with-scrollback" } },
    { key = "s", mods = "LEADER", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
    { key = "v", mods = "LEADER", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
    { key = "[", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = -1 }) },
    { key = "]", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = 1 }) },
    { key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
    { key = "h", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Left" } },
    { key = "j", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Down" } },
    { key = "k", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Up" } },
    { key = "l", mods = "LEADER", action = wezterm.action { ActivatePaneDirection = "Right" } },
    { key = "H", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Left", 5 } } },
    { key = "J", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Down", 5 } } },
    { key = "K", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Up", 5 } } },
    { key = "L", mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Right", 5 } } },
    { key = "c", mods = "LEADER", action = wezterm.action { CloseCurrentPane = { confirm = false } } },

    { key = "t", mods = "LEADER", action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
  },
}

-- https://github.com/wez/wezterm/discussions/628
