local wezterm = require 'wezterm'

wezterm.on('format-window-title', function(tab, _pane, _tabs, _panes, _config)
    return tab.active_pane.title
end)

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = 'cyberpunk'

config.enable_tab_bar = false

config.audible_bell = "Disabled"

config.window_decorations = "RESIZE"

config.font = wezterm.font_with_fallback { 'FantasqueSansMono Nerd Font', 'Andale Mono' }
config.font_size = 18

config.keys = {
    {
        key = 'c',
        mods = 'CMD',
        action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection',
    }
}

return config
