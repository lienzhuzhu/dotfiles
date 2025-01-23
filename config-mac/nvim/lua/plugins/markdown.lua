return {
    {
        'MeanderingProgrammer/render-markdown.nvim', -- Preview within editor
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
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
        config = function()
            vim.keymap.set("n", "<leader>md", "<cmd>MarkdownPreviewToggle<CR>")
            vim.g.mkdp_markdown_css = ""
        end
    },
    {
        "lienzhuzhu/r2pdf.nvim",
        enabled = true,
        dev = true,
        init = function ()
            local opts = { noremap = true, silent = false }
            vim.keymap.set("n", "<leader>xn", ":Note ", opts)
        end,
        opts = function ()
            return {}
        end

    }
}
