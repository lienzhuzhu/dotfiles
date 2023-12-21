return {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    --event = "BufReadPre",   -- necessary to prevent race conditions where mason or lspconfig don't exist
                            -- so first load other plugins then load bufferline on BufReadPre.
    config = function()

        require("bufferline").setup({
            options = {
                offsets = {
                    {
                        filetype = "NvimTree"
                    }
                }
            }
        })

        vim.keymap.set("n", "_", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "+", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })

    end
}
