return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,

    config = function()

        require('kanagawa').setup({
            compile = false,
            undercurl = true,
            commentStyle = { italic = true },
            background = {
                dark = "dragon",
                light = "lotus"
            },
        })

        vim.cmd("colorscheme kanagawa")

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    end
}
