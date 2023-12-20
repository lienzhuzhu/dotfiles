return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()

        require("nvim-tree").setup ({
            view = {
                width = 80
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                    window_picker = {
                        enable = false
                    }
                }
            },
            filters = {
                custom = { ".DS_Store" },
            },
            ui = {
                confirm = {
                    default_yes = true,
                },
            },
        })

        vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { silent = true })

    end
}
