return {
    --"EdenEast/nightfox.nvim",
    "rebelot/kanagawa.nvim",

    config = function()

        require('kanagawa').setup({
            compile = false,             -- enable compiling the colorscheme
            undercurl = true,            -- enable undercurls
            commentStyle = { italic = true },
            background = {               -- map the value of 'background' option to a theme
                dark = "dragon",           -- try "dragon" !
                light = "lotus"
            },
        })
        vim.cmd("colorscheme kanagawa-dragon")

        --require('nightfox').setup()
        --vim.cmd("colorscheme nordfox")


        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.opt.termguicolors = true

    end
}
