local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = 'cyberpunk'

config.enable_tab_bar = false

config.audible_bell = "Disabled"

config.font = wezterm.font_with_fallback { 'FantasqueSansMono Nerd Font', 'Andale Mono' }
config.font_size = 16

config.keys = {
    {
        key = 'c',
        mods = 'CMD',
        action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection',
    }
}

return config
