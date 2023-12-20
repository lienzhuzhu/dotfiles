return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects"
    },
    config = function()

        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua", "python", "vim", "vimdoc", "query" },
            auto_install = true,
            highlight = {
                enable = true
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>si",
                    node_incremental = "<leader>sn",
                    scope_incremental = "<leader>ss",
                    node_decremental = "<leader>sd",
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,

                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ap"] = "@parameter.outer",
                        ["ip"] = "@parameter.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                    },
                    selection_modes = {
                        ['@parameter.outer'] = 'v',
                        ['@function.outer'] = 'V',
                        ['@class.outer'] = '<c-v>',
                    },
                    include_surrounding_whitespace = true,
                },
            },
        })

    end
}
