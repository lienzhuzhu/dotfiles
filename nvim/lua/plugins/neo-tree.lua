return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- image preview support
    },

    config = function()

        vim.keymap.set("n", "<leader>t", ":Neotree toggle<CR>")
        require("neo-tree").setup({
            close_if_last_window = true,
            window = {
                mappings = {
                    ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
                }
            }
        })

    end
}
