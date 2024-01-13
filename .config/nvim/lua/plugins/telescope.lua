return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5', -- NOTE: from telescope documentation it is not recommended to use latest master
        dependencies = { 'nvim-lua/plenary.nvim' },

        config = function()

            require("telescope").setup({
                defaults = {
                    layout_strategy = "center",
                },
                extensions = {
                    ['ui-select'] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            })

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
            vim.keymap.set("n", "<leader>pr", builtin.git_files, {})
            vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>pg", builtin.grep_string, {})

            require("telescope").load_extension("ui-select")

        end
    }
}
