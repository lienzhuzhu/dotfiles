return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function ()
        local status = require("lazy.status")
        return {
            options = {
                icons_enabled = true,
                theme = "auto",
                disabled_filetypes = {
                    statusline = { "NvimTree" }
                }
            },
            sections = {
                lualine_x = {
                    {
                        status.updates,
                        cond = status.has_updates,
                        color = { fg = "#E6C384" },
                    },
                    { "encoding" },
                    { "fileformat" },
                    { "filetype" },
                },
            },
        }
    end,
}
