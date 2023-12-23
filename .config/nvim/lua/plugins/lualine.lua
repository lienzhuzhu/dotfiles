return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()

        local lazy_status = require("lazy.status") -- to configure lazy pending updates count

        require('lualine').setup({
            options = {
                disabled_filetypes = {
                    statusline = { "NvimTree" }
                }
            }
        })

        require("lualine").setup({
            options = {
                disabled_filetypes = {
                    statusline = { "NvimTree" }
                }
            },
            sections = {
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#E6C384" },
                    },
                    { "encoding" },
                    { "fileformat" },
                    { "filetype" },
                },
            },
        })

    end
}
