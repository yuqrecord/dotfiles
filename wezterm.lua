-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local mux = wezterm.mux

-- Color scheme
config.color_scheme = 'Hybrid (Gogh)'

-- Font
config.font_size = 16.0


-- Window opacity
local window_background_opacity_init = 0.8
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
  {
    key = '-',
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment,
  },
}

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
