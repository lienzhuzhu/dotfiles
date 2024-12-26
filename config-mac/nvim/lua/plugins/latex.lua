return {
    "lervag/vimtex",
    enabled = true,
    init = function()

        vim.g.tex_flavor = "latex"
        vim.g.vimtex_quickfix_mode = 1

        vim.g.vimtex_view_method = "sioyek"

    end
}
