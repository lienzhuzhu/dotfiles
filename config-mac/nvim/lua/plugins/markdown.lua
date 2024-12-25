return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        enabled = true,
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        opts = {
            file_types = { "markdown", },
        },
    },
    {
        "iamcco/markdown-preview.nvim",
        enabled = true,
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown", "rmd" }
        end,
        ft = { "markdown", },
    }
}
