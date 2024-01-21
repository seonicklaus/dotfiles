local wezterm = require 'wezterm'
local config = {}

-- Use config builder if possible
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Load WSL Domains
local wsl_domains = wezterm.default_wsl_domains()

-- Fullscreen on startup
wezterm.on('gui-startup', function(cmd)
    local _, _, window = wezterm.mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
end)

for _, domain in ipairs(wsl_domains) do
    domain.default_cwd = "~"
end

-- Configurations
config.adjust_window_size_when_changing_font_size = false
config.audible_bell = 'Disabled'
config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font_with_fallback {{
    family = 'Cascadia Code',
    weight = 'Regular',
    stretch = 'Normal'
}, {
    family = 'Symbols Nerd Font Mono',
}}

return config
