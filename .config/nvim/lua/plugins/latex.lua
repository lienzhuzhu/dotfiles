return {
    "lervag/vimtex",
    enabled = false,
    init = function()

        vim.g.tex_flavor = "latex"
        vim.g.vimtex_quickfix_mode = 0
        vim.g.conceallevel = 1
        vim.g.tex_conceal = "abdmg"

        --vim.g.vimtex_view_method = "skim"
        --vim.g.vimtex_view_skim_sync = 1

        vim.g.vimtex_view_method = "sioyek"

        vim.keymap.set("n", "<leader>lc", "<cmd>VimtexCompile<CR>", {})

    end
}
