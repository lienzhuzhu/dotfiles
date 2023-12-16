return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()

        require('lualine').setup({
            tabline = {
                lualine_a = {},
                lualine_b = {'branch'},
                lualine_c = {'filename'},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            }
        })

    end
}
