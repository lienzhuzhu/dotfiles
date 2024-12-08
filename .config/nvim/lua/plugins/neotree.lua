return {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },

    config = function ()

        require("neo-tree").setup({
            close_if_last_window = true,
            filesystem = {
                hijack_netrw_behavior = "open_current",
            }
        })

        vim.keymap.set("n", "<leader>f", "<cmd>Neotree toggle<CR>", { silent = true })

    end
}
