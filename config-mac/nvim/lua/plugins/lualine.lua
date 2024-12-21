return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function ()
        local ls = require("lazy.status")
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
                        ls.updates,
                        cond = ls.has_updates,
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
