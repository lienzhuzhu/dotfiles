return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()

        require("nvim-tree").setup ({
            hijack_unnamed_buffer_when_opening = true,
            --reload_on_bufenter = false,
            --respect_buf_cwd = false,
            --sync_root_with_cwd = false,
            view = {
                width = 80,
                number = true,
                relativenumber = true,
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
