-- Entry point for Wezterm settings
local wezterm = require("wezterm")
local config = {}


-- General terminal emulator settings
--
config.audible_bell = "Disabled"


-- Window settings
--
config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.window_background_opacity = 0.94
config.macos_window_background_blur = 0
config.initial_cols = 170
config.initial_rows = 48
config.window_close_confirmation = "NeverPrompt"


-- Keymap settings
--
config.disable_default_key_bindings = true
config.keys = {
    {
        key = 'v',
        mods = 'CMD',
        action = wezterm.action.PasteFrom "Clipboard",
    },
    {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentTab { confirm = false },
    },
    {
        key = 'P',
        mods = 'CMD',
        action = wezterm.action.ActivateCommandPalette,
    },
    {
        key = 'n',
        mods = 'CMD',
        action = wezterm.action.SpawnWindow,
    },
    {
        key = 'r',
        mods = 'CMD',
        action = wezterm.action.ReloadConfiguration,
    },
    {
        key = 'q',
        mods = 'CMD',
        action = wezterm.action.QuitApplication
    },
}


-- Color schemes and visual settings
--
config.color_scheme = "mykanagawa"
config.colors = {
}


-- Font settings
--
config.font_size = 18.0
--config.font = wezterm.font("SauceCodePro Nerd Font")
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }


-- Command Palette
--
config.command_palette_bg_color = "#1a1a22"
config.command_palette_fg_color = "#c4746e"
config.command_palette_font_size = 23.0
--config.command_palette_rows = 5


return config
