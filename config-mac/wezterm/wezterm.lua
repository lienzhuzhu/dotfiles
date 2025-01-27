-- Entry point for Wezterm settings
local wezterm = require("wezterm")
local config = {}


-- General terminal emulator settings
--
config.audible_bell = "Disabled"


-- Window settings
--
config.max_fps = 240
config.window_decorations = "TITLE | RESIZE"
config.enable_tab_bar = false
config.window_background_opacity = 1.0
--config.macos_window_background_blur = 36
config.initial_cols = 170
config.initial_rows = 48
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0
}


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
config.color_scheme = "OneHalfDark"


-- Font settings
--
config.font_size = 20.0
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }


-- Command Palette
--
config.command_palette_bg_color = "#1a1a22"
config.command_palette_fg_color = "#c4746e"
config.command_palette_font_size = 23.0
--config.command_palette_rows = 5


return config
