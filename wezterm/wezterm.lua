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

return config
