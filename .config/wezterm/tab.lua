local wezterm = require("wezterm")
local palette = require("theme").palette

local Tab = {}

local function get_process(tab)
  local process_icons = {
    ["docker"] = {
      { Foreground = { Color = palette.blue } },
      { Text = wezterm.nerdfonts.linux_docker },
    },
    ["docker-compose"] = {
      { Foreground = { Color = palette.blue } },
      { Text = wezterm.nerdfonts.linux_docker },
    },
    ["nvim"] = {
      { Foreground = { Color = palette.green } },
      { Text = wezterm.nerdfonts.custom_vim },
    },
    ["bob"] = {
      { Foreground = { Color = palette.blue } },
      { Text = wezterm.nerdfonts.custom_vim },
    },
    ["vim"] = {
      { Foreground = { Color = palette.green } },
      { Text = wezterm.nerdfonts.dev_vim },
    },
    ["node"] = {
      { Foreground = { Color = palette.green } },
      { Text = wezterm.nerdfonts.mdi_hexagon },
    },
    ["Python"] = {
      { Foreground = { Color = palette.blue } },
      { Text = wezterm.nerdfonts.dev_python },
    },
    ["fish"] = {
      { Foreground = { Color = palette.overlay1 } },
      { Text = wezterm.nerdfonts.dev_terminal },
    },
    ["zsh"] = {
      { Foreground = { Color = palette.overlay1 } },
      { Text = wezterm.nerdfonts.dev_terminal },
    },
    ["bash"] = {
      { Foreground = { Color = palette.overlay1 } },
      { Text = wezterm.nerdfonts.cod_terminal_bash },
    },
    ["htop"] = {
      { Foreground = { Color = palette.yellow } },
      { Text = wezterm.nerdfonts.mdi_chart_donut_variant },
    },
    ["btop"] = {
      { Foreground = { Color = palette.rosewater } },
      { Text = wezterm.nerdfonts.mdi_chart_donut_variant },
    },
    ["cargo"] = {
      { Foreground = { Color = palette.peach } },
      { Text = wezterm.nerdfonts.dev_rust },
    },
    ["go"] = {
      { Foreground = { Color = palette.sapphire } },
      { Text = wezterm.nerdfonts.mdi_language_go },
    },
    ["lazydocker"] = {
      { Foreground = { Color = palette.blue } },
      { Text = wezterm.nerdfonts.linux_docker },
    },
    ["git"] = {
      { Foreground = { Color = palette.peach } },
      { Text = wezterm.nerdfonts.dev_git },
    },
    ["lazygit"] = {
      { Foreground = { Color = palette.mauve } },
      { Text = wezterm.nerdfonts.dev_git },
    },
    ["lua"] = {
      { Foreground = { Color = palette.blue } },
      { Text = wezterm.nerdfonts.seti_lua },
    },
    ["wget"] = {
      { Foreground = { Color = palette.yellow } },
      { Text = wezterm.nerdfonts.mdi_arrow_down_box },
    },
    ["curl"] = {
      { Foreground = { Color = palette.yellow } },
      { Text = wezterm.nerdfonts.mdi_flattr },
    },
    ["gh"] = {
      { Foreground = { Color = palette.mauve } },
      { Text = wezterm.nerdfonts.dev_github_badge },
    },
    ["flatpak"] = {
      { Foreground = { Color = palette.blue } },
      { Text = wezterm.nerdfonts.mdi_package_variant },
    },
  }

  local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")

  if process_name == "" then
    process_name = "fish"
  end

  return wezterm.format(
    process_icons[process_name]
      or { { Foreground = { Color = palette.sky } }, { Text = string.format("[%s]", process_name) } }
  )
end

local function get_current_working_folder_name(tab)
  local cwd_uri = tab.active_pane.current_working_dir

  cwd_uri = cwd_uri:sub(8)

  local slash = cwd_uri:find("/")
  local cwd = cwd_uri:sub(slash)

  local HOME_DIR = os.getenv("HOME")
  if cwd == HOME_DIR then
    return "  ~"
  end

  return string.format("  %s", string.match(cwd, "[^/]+$"))
end

function Tab.setup()
  wezterm.on("format-tab-title", function(tab)
    return wezterm.format({
      { Attribute = { Intensity = "Bold" } },
      { Foreground = { Color = palette.surface2 } },
      { Text = string.format(" %s  ", tab.tab_index + 1) },
      "ResetAttributes",
      { Text = get_process(tab) },
      { Text = " " },
      { Text = get_current_working_folder_name(tab) },
      { Foreground = { Color = palette.surface0 } },
      { Text = "  ▕" },
    })
  end)
end

return Tab
