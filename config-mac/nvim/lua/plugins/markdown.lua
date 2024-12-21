return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        enabled = false,
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            file_types = { "markdown" },
        },
    },
    {
        "iamcco/markdown-preview.nvim",
        enabled = false,
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown", "rmd" }
        end,
        ft = { "markdown", "rmd" },
    }
}
