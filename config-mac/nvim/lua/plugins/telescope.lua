return {
    'nvim-telescope/telescope.nvim',
    enabled = true,
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            "nvim-telescope/telescope-ui-select.nvim",
        },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        },
    },
    opts = function ()

        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>pf", builtin.find_files, {}) -- NOTE: aka fzf
        vim.keymap.set("n", "<leader>pr", builtin.git_files, {})
        vim.keymap.set("n", "<leader>pg", builtin.live_grep, {}) -- NOTE: ripgrep
        vim.keymap.set("n", "<leader>ps", builtin.grep_string, {}) -- NOTE: ripgrep incremental

        require("telescope").load_extension("ui-select")
        require("telescope").load_extension("fzf")

        local themes = require("telescope.themes")
        return {
            defaults = {
                layout_strategy = "flex",
            },
            extensions = {
                ['ui-select'] = {
                    themes.get_dropdown {
                    }
                }
            }
        }
    end,
}
