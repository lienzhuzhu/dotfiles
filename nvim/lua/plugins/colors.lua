return {
    "rebelot/kanagawa.nvim",

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

        vim.cmd("colorscheme kanagawa-dragon")

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    end
}
