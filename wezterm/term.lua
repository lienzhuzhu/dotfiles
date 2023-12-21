-- General terminal emulator settings
--

local wezterm = require("wezterm")

local M = {}


local function private_helper()
    wezterm.log_error 'hello! from term'
end


function M.apply_to_config(config)

    private_helper()

    config.audible_bell = "Disabled"

end

return M
