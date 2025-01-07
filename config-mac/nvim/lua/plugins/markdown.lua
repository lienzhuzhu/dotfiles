return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        enabled = true,
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        opts = {
            file_types = { "markdown", },
            anti_conceal = {
                enabled = true,
            },
        },
    },
    {
        "lienzhuzhu/r2pdf.nvim",
        enabled = true,
        dev = true,
        init = function ()
            local opts = { noremap = true, silent = true }
            vim.keymap.set("n", "<leader>rp", "<cmd>R2PDF render<CR>", opts)
        end,
        opts = function ()
            return {}
        end

    }
}
