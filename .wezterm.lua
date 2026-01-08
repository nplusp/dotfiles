-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font {
  family = 'Fira Code'
}

config.macos_window_background_blur = 30
config.window_decorations = 'RESIZE'

config.color_scheme = 'Tokyo Night'

config.window_frame = {
  font = wezterm.font({ family = 'Fira Code', weight = 'Bold' }),
  font_size = 11,
}

-- config.default_prog = {"/opt/homebrew/bin/nu"}

return config