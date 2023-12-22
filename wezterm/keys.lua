
-- Keymap settings
--

local wezterm = require("wezterm")

local M = {}


local function private_helper()
    wezterm.log_error 'hello! from keys'
end


function M.apply_to_config(config)

    private_helper()

end

return M
