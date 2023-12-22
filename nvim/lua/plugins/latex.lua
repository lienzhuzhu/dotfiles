return {
    "lervag/vimtex",

    config = function()

        vim.g.vimtex_view_method = "skim"
        vim.g.tex_flavor = "latex"
        vim.g.vimtex_quickfix_mode = 0
        vim.g.conceallevel = 1
        vim.g.tex_conceal = "abdmg"

    end
}
