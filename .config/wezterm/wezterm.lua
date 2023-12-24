-- Entry point for Wezterm settings
local wezterm = require("wezterm")
local config = {}



-- Window settings
--
config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.window_background_opacity = 0.96
config.macos_window_background_blur = 0
config.initial_cols = 170
config.initial_rows = 48


-- General terminal emulator settings
--
config.audible_bell = "Disabled"


-- Keymap settings
--
config.keys = {
    {
        key = 'P',
        mods = 'CMD',
        action = wezterm.action.ActivateCommandPalette,
    },
}


-- Color schemes and visual settings
--
--config.color_scheme = "kanagawa (Gogh)"
config.color_scheme = "kanagawabones"
config.colors = {
     background = "#181616"
}


-- Font settings
--
config.font_size = 18.0
config.font = wezterm.font("SauceCodePro Nerd Font")


return config
