-- Entry point for Wezterm settings

local config = {}

require("term").apply_to_config(config)
require("window").apply_to_config(config)
require("font").apply_to_config(config)
require("colors").apply_to_config(config)
require("keys").apply_to_config(config)

return config
