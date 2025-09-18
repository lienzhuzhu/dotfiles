return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects"
    },
    opts = {
        ensure_installed = { "r", "markdown", "c", "lua", "python", "ruby", "vim", "vimdoc", "query" },
        auto_install = true,
        highlight = {
            enable = true
        },
        indent = {
            enable = false,
        }
    },
    main = "nvim-treesitter.configs",
}
