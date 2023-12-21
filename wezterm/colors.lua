-- Color schemes and visual settings
--

local wezterm = require("wezterm")

local M = {}


local function private_helper()
    wezterm.log_error 'hello! from colors'
end


function M.apply_to_config(config)

    private_helper()

    config.color_scheme = "Batman"
    config.window_background_opacity = 0.94

end


return M
