return {
    "norcalli/nvim-colorizer.lua",

    config = function()

        require"colorizer".setup({
            "yaml",
            "css",
        })

        vim.cmd [[autocmd BufWritePost * ColorizerAttachToBuffer]]

    end
}
