local wezterm = require 'wezterm'
local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font_size = 14.0
config.font = wezterm.font('FiraCode Nerd Font', { weight = 'Medium' })

-- config.color_scheme = 'Catppuccin Macchiato'
-- config.color_scheme = '3024 (dark) (terminal.sexy)'
-- config.color_scheme = '3024 Night (Gogh)'
-- config.color_scheme = 'Afterglow'
-- config.color_scheme = 'GitHub Dark'

config.check_for_updates = false
config.enable_tab_bar = false
config.scrollback_lines = 50000

config.window_background_opacity = 0.90
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config
