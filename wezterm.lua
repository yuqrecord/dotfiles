-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local mux = wezterm.mux

-- Default shell for WindowsOS
if wezterm.target_triple:find('windows') then
  -- Use PowerShell as the default shell
  config.default_prog = { 'powershell.exe', '-NoLogo' }
end

-- Color scheme
config.color_scheme = 'Hybrid (Gogh)'

-- Font
config.font_size = 16.0

-- Concatinate PATH
function concat_path(...)
  local separator = package.config:sub(1,1)
  local args = {...}
  local path = table.concat(args, separator)
  return path
end


-- Window opacity
local window_background_opacity_init = 1.0
local window_background_opacity_step = 0.1
wezterm.on('increase-opacity', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = window_background_opacity_init
  else
    overrides.window_background_opacity = math.min(1.0, overrides.window_background_opacity + window_background_opacity_step)
  end
  window:set_config_overrides(overrides)
end)
wezterm.on('decrease-opacity', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = math.max(0.0, window_background_opacity_init - window_background_opacity_step)
  else
    overrides.window_background_opacity = math.max(0.0, overrides.window_background_opacity - window_background_opacity_step)
  end
  window:set_config_overrides(overrides)
end)


-- Keybindings
config.keys = {
  -- ALT + 1 to decrease opacity, ALT + 2 to increase opacity
  {
    key = '1',
    mods = 'ALT',
    action = wezterm.action.EmitEvent 'decrease-opacity',
  },
  {
    key = '2',
    mods = 'ALT',
    action = wezterm.action.EmitEvent 'increase-opacity',
  },
  -- CTRL + SHIFT + K to open the launcher
  {
    key = 'K',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ShowLauncher,
  },
  -- Disable CTRL + - to prevent zooming out
  {
    key = '-',
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment,
  },
}

-- Disable audle bell
config.audible_bell = 'Disabled'

-- SSH domains (read other files)
local domains = wezterm.default_ssh_domains()
local ok, ret = pcall(dofile, wezterm.config_dir .. '/ssh_domains.lua')
if ok and type(ret) == 'table' then
  for _, d in ipairs(ret) do
    table.insert(domains, d)
  end
end
config.ssh_domains = domains

-- Start up settings
wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window(cmd or {})
  local overrides = window:gui_window():get_config_overrides() or {}
  -- Full screen
  window:gui_window():toggle_fullscreen()
  -- Window opacity
  overrides.window_background_opacity = window_background_opacity_init
  window:gui_window():set_config_overrides(overrides)
end)

-- and finally, return the configuration to wezterm
return config
