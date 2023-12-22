-- Window settings
--

local wezterm = require("wezterm")

local M = {}


local function private_helper()
    wezterm.log_error 'hello! from window'
end


function M.apply_to_config(config)

    private_helper()

    config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
    config.enable_tab_bar = false
    config.window_background_opacity = 0.96
    config.macos_window_background_blur = 0
    config.initial_cols = 170
    config.initial_rows = 48

end

return M
