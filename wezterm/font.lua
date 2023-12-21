-- Font settings
--

local wezterm = require("wezterm")

local M = {}


local function private_helper()
    wezterm.log_error 'hello! from font'
end


function M.apply_to_config(config)

    private_helper()

    config.font_size = 18.0
    config.font = wezterm.font("SauceCodePro Nerd Font")

end

return M
