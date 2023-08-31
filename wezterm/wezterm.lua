local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = 'cyberpunk'

config.enable_tab_bar = false

config.font = wezterm.font_with_fallback { 'Mononoki Nerd Font Mono', 'Andale Mono' }
config.font_size = 16

return config
