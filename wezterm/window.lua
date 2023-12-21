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

end

return M
