return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()

        require'nvim-treesitter.configs'.setup({
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
        })

    end
}
