return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
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
                    require("lazy.status").updates,
                    cond = require("lazy.status").has_updates,
                    color = { fg = "#E6C384" },
                },
                { "encoding" },
                { "fileformat" },
                { "filetype" },
            },
        },
    },
}
